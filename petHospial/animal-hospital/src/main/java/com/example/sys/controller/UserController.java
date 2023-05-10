package com.example.sys.controller;


import java.math.BigDecimal;
import java.util.*;

import com.example.bus.domain.Provider;
import com.example.sys.common.*;
import com.example.sys.domain.Hospital;
import com.example.sys.service.HospitalService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.sys.common.Constant;
import com.example.sys.domain.Dept;
import com.example.sys.domain.Role;
import com.example.sys.domain.User;
import com.example.sys.service.DeptService;
import com.example.sys.service.RoleService;
import com.example.sys.service.UserService;
import com.example.sys.vo.UserVo;

import cn.hutool.core.util.IdUtil;

/**
 * <p>
 * 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private DeptService deptService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private HospitalService hospitalService;

    /**
     * 用户全查询
     */
    @RequestMapping("loadAllUser")
    public DataGridView loadAllUser(UserVo userVo) {
        IPage<User> page = new Page<>(userVo.getPage(), userVo.getLimit());
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("available",userVo.getAvailable());
        queryWrapper.eq(StringUtils.isNotBlank(userVo.getName()), "loginname", userVo.getName()).or().eq(StringUtils.isNotBlank(userVo.getName()), "name", userVo.getName());
        queryWrapper.eq(StringUtils.isNotBlank(userVo.getDetailAddress()), "detail_address", userVo.getDetailAddress());
        queryWrapper.eq("type", Constant.USER_TYPE_NORMAL);//查询系统用户
        queryWrapper.eq(userVo.getHospitalId() != null, "hospital_id", userVo.getHospitalId());
        this.userService.page(page, queryWrapper);


        System.out.println(userService.getClass().getSimpleName());
        List<User> list = page.getRecords();
        return new DataGridView(page.getTotal(), list);

    }

    /**
     * 查询所有职工
     *
     * @param userVo
     * @return
     */
    @RequestMapping("loadAllEmployee")
    public DataGridView loadAllEmployee(UserVo userVo) {
        IPage<User> page = new Page<>(userVo.getPage(), userVo.getLimit());
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        if (Constant.USER_TYPE_HOSPITAL_DOCTOR == userVo.getType() || Constant.USER_TYPE_HOSPITAL_BEAUTICION == userVo.getType()) {
            queryWrapper.eq("type", userVo.getType());
        } else {
            queryWrapper.in("type", Constant.USER_TYPE_HOSPITAL_DOCTOR, Constant.USER_TYPE_HOSPITAL_BEAUTICION);
        }
        queryWrapper.eq(userVo.getHospitalId() != null && userVo.getHospitalId() != 0, "hospital_id", userVo.getHospitalId());
        queryWrapper.like(StringUtils.isNotBlank(userVo.getName()), "name", userVo.getName());
        this.userService.page(page, queryWrapper);
        List<User> list = page.getRecords();
        for (User user : list) {
            if (null != user.getHospitalId()) {
                Hospital hospital = hospitalService.getById(user.getHospitalId());
                user.setHospitalName(hospital.getName());
            }
            String fullAddress = user.getProvince() + user.getCity() + user.getCounty() + user.getDetailAddress();
            user.setFullAddress(fullAddress);
        }
        return new DataGridView(page.getTotal(), list);

    }


    /**
     * 加载最大的排序码
     *
     * @param
     * @return
     */
    @RequestMapping("loadUserMaxOrderNum")
    public Map<String, Object> loadUserMaxOrderNum() {
        Map<String, Object> map = new HashMap<String, Object>();

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("ordernum");
        IPage<User> page = new Page<>(1, 1);
        List<User> list = this.userService.page(page, queryWrapper).getRecords();
        if (list.size() > 0) {
            map.put("value", list.get(0).getOrdernum() + 1);
        } else {
            map.put("value", 1);
        }
        return map;
    }


    /**
     * 根据医院ID查询所有职工
     */
    @RequestMapping("loadUsersByHospitalId")
    public DataGridView loadUsersByHospitalId(Integer hospitalId) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(hospitalId != null, "hospital_id", hospitalId);
        queryWrapper.eq("available", Constant.AVAILABLE_TRUE);
        Set<Integer> types = new HashSet<>();
        types.add(Constant.USER_TYPE_HOSPITAL_DOCTOR);
        types.add(Constant.USER_TYPE_HOSPITAL_ADMIN);
        types.add(Constant.USER_TYPE_HOSPITAL_BEAUTICION);
        //queryWrapper.in("type", );
        queryWrapper.in("type", types);
        List<User> list = this.userService.list(queryWrapper);
        return new DataGridView(list);
    }


    /**
     * 把用户名转成拼音
     */
    @RequestMapping("changeChineseToPinyin")
    public Map<String, Object> changeChineseToPinyin(String username) {
        Map<String, Object> map = new HashMap<>();
        if (null != username) {
            map.put("value", PinyinUtils.getPingYin(username));
        } else {
            map.put("value", "");
        }
        return map;
    }

    /**
     * 添加用户
     */
    @RequestMapping("addUser")
    public ResultObj addUser(UserVo userVo) {
        try {

            userVo.setUpdateTime(new Date());
            String salt = IdUtil.simpleUUID().toUpperCase();
            userVo.setBalance(new BigDecimal(1000000));
            userVo.setSalt(salt);//设置盐
            userVo.setPwd(new Md5Hash(Constant.USER_DEFAULT_PWD, salt, 2).toString());//设置密码
            this.userService.save(userVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }


    /**
     * 根据用户ID查询一个用户
     */
    @RequestMapping("loadUserById")
    public DataGridView loadUserById(Integer id) {
        return new DataGridView(this.userService.getById(id));
    }

    /**
     * 修改用户
     */
    @RequestMapping("updateUser")
    public ResultObj updateUser(UserVo userVo) {
        try {
            this.userService.updateById(userVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除用户
     */
    @RequestMapping("deleteUser")
    public ResultObj deleteUser(Integer id) {
        try {
            this.userService.removeById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 重置用户密码
     */
    @RequestMapping("resetPwd")
    public ResultObj resetPwd(Integer id) {
        try {
            User user = new User();
            user.setId(id);
            String salt = IdUtil.simpleUUID().toUpperCase();
            user.setSalt(salt);//设置盐
            user.setPwd(new Md5Hash(Constant.USER_DEFAULT_PWD, salt, 2).toString());//设置密码
            this.userService.updateById(user);
            return ResultObj.RESET_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.RESET_ERROR;
        }
    }


    /**
     * 根据用户ID查询角色并选中已拥有的角色
     */
    @RequestMapping("initRoleByUserId")
    public DataGridView initRoleByUserId(Integer id) {
        //1,查询所有可用的角色
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("available", Constant.AVAILABLE_TRUE);
        List<Map<String, Object>> listMaps = this.roleService.listMaps(queryWrapper);

        //2,查询当前用户拥有的角色ID集合
        List<Integer> currentUserRoleIds = this.roleService.queryUserRoleIdsByUid(id);
        for (Map<String, Object> map : listMaps) {
            Boolean LAY_CHECKED = false;
            Integer roleId = (Integer) map.get("id");
            for (Integer rid : currentUserRoleIds) {
                if (rid == roleId) {
                    LAY_CHECKED = true;
                    break;
                }
            }
            map.put("LAY_CHECKED", LAY_CHECKED);
        }
        return new DataGridView(Long.valueOf(listMaps.size()), listMaps);
    }

    /**
     * 保存用户和角色的关系
     */
    @RequestMapping("saveUserRole")
    public ResultObj saveUserRole(Integer uid, Integer[] ids) {
        try {
            this.userService.saveUserRole(uid, ids);
            return ResultObj.DISPATCH_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DISPATCH_ERROR;
        }

    }

    @RequestMapping("loadPersonalInfo")
    public DataGridView loadPersonalInfo() {
        User user = (User) WebUtils.getSession().getAttribute("user");
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("id", user.getId());
        List<User> list = this.userService.list(queryWrapper);
        return new DataGridView(list);
    }

    @RequestMapping("loadAllUserForSelect")
    public DataGridView loadAllUserForSelect() {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type", Constant.USER_TYPE_CUSTMOR);
        queryWrapper.eq("available", Constant.AVAILABLE_TRUE);
        List<User> list = this.userService.list(queryWrapper);
        System.out.println(list);
        return new DataGridView(list);

    }

    @RequestMapping("loadDoctorByHospitalId")
    public DataGridView loadDoctorByHospitalId(Integer hospitalId) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type", Constant.USER_TYPE_HOSPITAL_DOCTOR);
        queryWrapper.eq("hospital_id",hospitalId);
        queryWrapper.eq("available", Constant.AVAILABLE_TRUE);
        List<User> list = this.userService.list(queryWrapper);
        System.out.println(list);
        return new DataGridView(list);

    }

    @RequestMapping("loadBeauticianByHospitalId")
    public DataGridView loadBeauticianByHospitalId(Integer hospitalId) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type", Constant.USER_TYPE_HOSPITAL_BEAUTICION);
        queryWrapper.eq("hospital_id",hospitalId);
        queryWrapper.eq("available", Constant.AVAILABLE_TRUE);
        List<User> list = this.userService.list(queryWrapper);
        System.out.println(list);
        return new DataGridView(list);

    }



}

