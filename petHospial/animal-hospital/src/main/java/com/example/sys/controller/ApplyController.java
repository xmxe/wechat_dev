package com.example.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.bus.domain.Goods;
import com.example.bus.domain.Pet;
import com.example.bus.domain.Provider;
import com.example.bus.service.PetService;
import com.example.bus.vo.GoodsVo;
import com.example.sys.common.Constant;
import com.example.sys.common.DataGridView;
import com.example.sys.common.ResultObj;
import com.example.sys.common.WebUtils;
import com.example.sys.domain.Apply;
import com.example.sys.domain.Hospital;
import com.example.sys.domain.User;
import com.example.sys.service.ApplyService;
import com.example.sys.service.HospitalService;
import com.example.sys.service.UserService;
import com.example.sys.vo.ApplyVo;
import com.example.sys.vo.HospitalVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/apply")
public class ApplyController {

    @Autowired
    private ApplyService applyService;

    @Autowired
    private PetService petService;

    @Autowired
    private UserService userService;

    @Autowired
    private HospitalService hospitalService;

    /**
     * 查询挂号预约
     */
    @RequestMapping("loadAllDoctorApply")
    public DataGridView loadAllGoods(ApplyVo applyVo) {
        IPage<Apply> page = new Page<>(applyVo.getPage(), applyVo.getLimit());
        QueryWrapper<Apply> queryWrapper = new QueryWrapper<>();


        if (null != applyVo.getType() && applyVo.getType() / 10 >= 1) {
            queryWrapper.eq("type", applyVo.getType());
        }
        queryWrapper.lt("type", 20);
        User user = (User) WebUtils.getSession().getAttribute("user");

        if (user.getType() == Constant.USER_TYPE_CUSTMOR) {
            queryWrapper.eq("apply_user_id", user.getId());
        } else if (user.getType() == Constant.USER_TYPE_HOSPITAL_DOCTOR ||
                user.getType() == Constant.USER_TYPE_HOSPITAL_BEAUTICION) {
            queryWrapper.eq("doctor_id", user.getId());
        }
        queryWrapper.ge(applyVo.getStartTime() != null, "apply_time", applyVo.getStartTime());
        queryWrapper.le(applyVo.getEndTime() != null, "apply_time", applyVo.getEndTime());
        queryWrapper.orderByDesc("apply_time");

        this.applyService.page(page, queryWrapper);
        List<Apply> records = page.getRecords();
        for (Apply apply : records) {
            getTypeString(apply);
            if (apply.getStatus() == 1) {
                apply.setApplyStatus("预约中");
            } else if (apply.getStatus() == 2) {
                apply.setApplyStatus("预约成功");
            } else {
                apply.setApplyStatus("预约异常");
            }

            Pet pet = this.petService.getById(apply.getPetId());
            if (null != pet) {
                apply.setPetName(pet.getName());
                apply.setPetType(pet.getPetType());
            }
            User applyUser = this.userService.getById(apply.getApplyUserId());
            if (null != applyUser) {
                apply.setPhone(applyUser.getPhone());
            }
            User doctor = this.userService.getById(apply.getDoctorId());
            if (null != doctor) {
                apply.setDoctorName(doctor.getName());
                Hospital hospital = this.hospitalService.getById(doctor.getHospitalId());
                if (null != hospital) {
                    apply.setHospitalName(hospital.getName());
                }
            }
        }
        return new DataGridView(page.getTotal(), records);
    }


    /**
     * 查询挂号预约
     */
    @RequestMapping("loadAllBeauticianApply")
    public DataGridView loadAllBeauticianApply(ApplyVo applyVo) {
        IPage<Apply> page = new Page<>(applyVo.getPage(), applyVo.getLimit());
        QueryWrapper<Apply> queryWrapper = new QueryWrapper<>();


        if (null != applyVo.getType() && applyVo.getType() / 10 >= 1) {
            queryWrapper.eq("type", applyVo.getType());
        }
        queryWrapper.gt("type", 20);
        User user = (User) WebUtils.getSession().getAttribute("user");

        if (user.getType() == Constant.USER_TYPE_CUSTMOR) {
            queryWrapper.eq("apply_user_id", user.getId());
        } else if (user.getType() == Constant.USER_TYPE_HOSPITAL_DOCTOR ||
                user.getType() == Constant.USER_TYPE_HOSPITAL_BEAUTICION) {
            queryWrapper.eq("doctor_id", user.getId());
        }
        queryWrapper.ge(applyVo.getStartTime() != null, "apply_time", applyVo.getStartTime());
        queryWrapper.le(applyVo.getEndTime() != null, "apply_time", applyVo.getEndTime());
        queryWrapper.orderByDesc("apply_time");

        this.applyService.page(page, queryWrapper);
        List<Apply> records = page.getRecords();
        for (Apply apply : records) {
            getTypeString(apply);
            if (apply.getStatus() == 1) {
                apply.setApplyStatus("预约中");
            } else if (apply.getStatus() == 2) {
                apply.setApplyStatus("预约成功");
            } else {
                apply.setApplyStatus("预约异常");
            }

            Pet pet = this.petService.getById(apply.getPetId());
            if (null != pet) {
                apply.setPetName(pet.getName());
                apply.setPetType(pet.getPetType());
            }
            User applyUser = this.userService.getById(apply.getApplyUserId());
            if (null != applyUser) {
                apply.setPhone(applyUser.getPhone());
            }
            User doctor = this.userService.getById(apply.getDoctorId());
            if (null != doctor) {
                apply.setDoctorName(doctor.getName());
                Hospital hospital = this.hospitalService.getById(doctor.getHospitalId());
                if (null != hospital) {
                    apply.setHospitalName(hospital.getName());
                }
            }
        }
        return new DataGridView(page.getTotal(), records);
    }


    @RequestMapping("disagreeApply")
    public ResultObj disagreeApply(Integer id) {
        Apply apply = applyService.getById(id);
        try {
            apply.setStatus(3);
            this.applyService.updateById(apply);
            return ResultObj.OPERATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.OPERATE_ERROR;
        }
    }

    @RequestMapping("agreeApply")
    public ResultObj agreeApply(Integer id) {
        Apply apply = applyService.getById(id);
        try {
            apply.setStatus(2);
            this.applyService.updateById(apply);
            return ResultObj.OPERATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.OPERATE_ERROR;
        }
    }

    @RequestMapping("addApply")
    public ResultObj addApply(ApplyVo applyVo) {
        User user = (User) WebUtils.getSession().getAttribute("user");
        applyVo.setStatus(1);
        applyVo.setMoney(new BigDecimal(10));
        applyVo.setApplyTime(new Date());
        applyVo.setApplyUserId(user.getId());
        try {
            this.applyService.save(applyVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }


    }


    @RequestMapping("loadApplyUnGenerate")
    public DataGridView loadApplyUnGenerate() {
        QueryWrapper<Apply> queryWrapper = new QueryWrapper<>();
        User doctor = (User) WebUtils.getSession().getAttribute("user");
        if (doctor.getType() == Constant.USER_TYPE_HOSPITAL_DOCTOR) {
            queryWrapper.lt("type", 20);
        } else {
            queryWrapper.gt("type", 20);
        }
        queryWrapper.eq("has_generate_case", Constant.HAS_NOT_GENERATED);

        List<Apply> list = this.applyService.list(queryWrapper);
        for (Apply apply : list) {
            Pet pet = petService.getById(apply.getPetId());
            apply.setPetName(pet.getName());

            getTypeString(apply);
        }
        return new DataGridView(list);
    }

    private void getTypeString(Apply apply) {
        switch (apply.getType()) {
            case 11:
                apply.setApplyType("门诊");
                break;
            case 12:
                apply.setApplyType("绝育");
                break;
            case 13:
                apply.setApplyType("疫苗");
                break;
            case 21:
                apply.setApplyType("洗澡");
                break;
            case 22:
                apply.setApplyType("洗牙");
                break;
            case 23:
                apply.setApplyType("美容");
                break;
            case 24:
                apply.setApplyType("其它");
                break;
            default:
                break;
        }
    }

}
