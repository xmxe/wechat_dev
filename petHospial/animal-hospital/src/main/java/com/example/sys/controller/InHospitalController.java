package com.example.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.bus.domain.Pet;
import com.example.bus.service.PetService;
import com.example.sys.common.Constant;
import com.example.sys.common.DataGridView;
import com.example.sys.common.ResultObj;
import com.example.sys.common.WebUtils;
import com.example.sys.domain.InHospital;
import com.example.sys.domain.Notice;
import com.example.sys.domain.User;
import com.example.sys.service.InHospitalService;
import com.example.sys.service.UserService;
import com.example.sys.vo.InHospitalVo;
import com.example.sys.vo.NoticeVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/inHospital")
public class InHospitalController {

    @Autowired
    private InHospitalService inHospitalService;

    @Autowired
    private PetService petService;

    @Autowired
    private UserService userService;


    /**
     * 查询
     */
    @RequestMapping("loadAllInHospital")
    public DataGridView loadAllInHospital(InHospitalVo inHospitalVo) {
        IPage<InHospital> page = new Page<>(inHospitalVo.getPage(), inHospitalVo.getLimit());
        QueryWrapper<InHospital> queryWrapper = new QueryWrapper<>();
        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getType() == Constant.USER_TYPE_HOSPITAL_ADMIN ||
                user.getType() == Constant.USER_TYPE_HOSPITAL_DOCTOR) {
            queryWrapper.eq("doctor_id", user.getId());
        }
        if (null != inHospitalVo.getType()) {
            queryWrapper.eq("type", inHospitalVo.getType());
        }


        queryWrapper.orderByDesc("add_time");
        this.inHospitalService.page(page, queryWrapper);
        List<InHospital> records = page.getRecords();
        for (InHospital inHospital: records){
            Pet pet = petService.getById(inHospital.getPetId());
            inHospital.setPetName(pet.getName());

            User doctor = userService.getById(inHospital.getDoctorId());
            inHospital.setDoctorName(doctor.getName());
            inHospital.setDoctorPhone(doctor.getPhone());
        }
        return new DataGridView(page.getTotal(), page.getRecords());
    }

    @RequestMapping("addInHospital")
    public ResultObj addInHospital(InHospitalVo inHospitalVo) {
        try {
            inHospitalVo.setAddTime(new Date());
            inHospitalVo.setStatus(1);
            User user = (User) WebUtils.getSession().getAttribute("user");
            inHospitalVo.setDoctorId(user.getId());
            this.inHospitalService.save(inHospitalVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }


}
