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
import com.example.sys.domain.Apply;
import com.example.sys.domain.Case;
import com.example.sys.domain.Hospital;
import com.example.sys.domain.User;
import com.example.sys.service.ApplyService;
import com.example.sys.service.CaseService;
import com.example.sys.service.HospitalService;
import com.example.sys.service.UserService;
import com.example.sys.vo.CaseVo;
import com.example.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;


@RestController
@RequestMapping("/history")
public class HistoryController {

    @Autowired
    private CaseService caseService;

    @Autowired
    private ApplyService applyService;

    @Autowired
    private UserService userService;

    @Autowired
    private HospitalService hospitalService;

    @Autowired
    private PetService petService;

    @RequestMapping("loadAllDiagnoseHistory")
    public DataGridView loadAllDiagnoseHistory(CaseVo caseVo) {
        IPage<Case> page = new Page<>(caseVo.getPage(), caseVo.getLimit());
        QueryWrapper<Case> queryWrapper = new QueryWrapper<>();

        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getType() == Constant.USER_TYPE_HOSPITAL_DOCTOR) {
            queryWrapper.eq("doctor_id", user.getId());
        } else if (user.getType() == Constant.USER_TYPE_CUSTMOR) {
            queryWrapper.eq("confirm_user_id", user.getId());
        }
        queryWrapper.lt("case_type", 20);
        queryWrapper.ge(caseVo.getStartTime() != null, "case_time", caseVo.getStartTime());
        queryWrapper.le(caseVo.getEndTime() != null, "case_time", caseVo.getEndTime());
        queryWrapper.orderByDesc("case_time");
        this.caseService.page(page, queryWrapper);
        List<Case> records = page.getRecords();
        for (Case c : records) {
            Apply apply = applyService.getById(c.getApplyId());
            Pet pet = petService.getById(apply.getPetId());
            c.setPetName(pet.getName());
            c.setPetAge(pet.getAge());
            c.setPetSex(pet.getSex());
            c.setPetId(pet.getId());

            User doctor = userService.getById(c.getDoctorId());
            c.setDoctorName(doctor.getName());
            Hospital hospital = hospitalService.getById(doctor.getHospitalId());
            c.setHospitalName(hospital.getName());

            User confirmUser = userService.getById(c.getConfirmUserId());
            c.setConfirmUserName(confirmUser.getName());
            getTypeString(c);
        }
        return new DataGridView(page.getTotal(), page.getRecords());
    }

    @RequestMapping("loadAllBeautyHistory")
    public DataGridView loadAllBeautyHistory(CaseVo caseVo) {
        IPage<Case> page = new Page<>(caseVo.getPage(), caseVo.getLimit());
        QueryWrapper<Case> queryWrapper = new QueryWrapper<>();

        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getType() == Constant.USER_TYPE_HOSPITAL_DOCTOR) {
            queryWrapper.eq("doctor_id", user.getId());
        } else if (user.getType() == Constant.USER_TYPE_CUSTMOR) {
            queryWrapper.eq("confirm_user_id", user.getId());
        }
        queryWrapper.gt("case_type", 20);
        queryWrapper.ge(caseVo.getStartTime() != null, "case_time", caseVo.getStartTime());
        queryWrapper.le(caseVo.getEndTime() != null, "case_time", caseVo.getEndTime());
        queryWrapper.orderByDesc("case_time");
        this.caseService.page(page, queryWrapper);
        List<Case> records = page.getRecords();
        for (Case c : records) {
            Apply apply = applyService.getById(c.getApplyId());
            Pet pet = petService.getById(apply.getPetId());
            c.setPetName(pet.getName());
            c.setPetAge(pet.getAge());
            c.setPetSex(pet.getSex());
            c.setPetId(pet.getId());

            User doctor = userService.getById(c.getDoctorId());
            c.setDoctorName(doctor.getName());
            Hospital hospital = hospitalService.getById(doctor.getHospitalId());
            c.setHospitalName(hospital.getName());

            User confirmUser = userService.getById(c.getConfirmUserId());
            c.setConfirmUserName(confirmUser.getName());
            getTypeString(c);
        }
        return new DataGridView(page.getTotal(), page.getRecords());
    }

    @RequestMapping("loadAllPayHistory")
    public DataGridView loadAllPayHistory(CaseVo caseVo) {
        IPage<Case> page = new Page<>(caseVo.getPage(), caseVo.getLimit());
        QueryWrapper<Case> queryWrapper = new QueryWrapper<>();

        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getType() == Constant.USER_TYPE_HOSPITAL_DOCTOR) {
            queryWrapper.eq("doctor_id", user.getId());
        } else if (user.getType() == Constant.USER_TYPE_CUSTMOR) {
            queryWrapper.eq("confirm_user_id", user.getId());
        }
        queryWrapper.ge(caseVo.getStartTime() != null, "case_time", caseVo.getStartTime());
        queryWrapper.le(caseVo.getEndTime() != null, "case_time", caseVo.getEndTime());
        queryWrapper.orderByDesc("case_time");
        this.caseService.page(page, queryWrapper);
        List<Case> records = page.getRecords();
        for (Case c : records) {
            Apply apply = applyService.getById(c.getApplyId());
            Pet pet = petService.getById(apply.getPetId());
            c.setPetName(pet.getName());
            c.setPetAge(pet.getAge());
            c.setPetSex(pet.getSex());
            c.setPetId(pet.getId());

            User doctor = userService.getById(c.getDoctorId());
            c.setDoctorName(doctor.getName());
            Hospital hospital = hospitalService.getById(doctor.getHospitalId());
            c.setHospitalName(hospital.getName());

            User confirmUser = userService.getById(c.getConfirmUserId());
            c.setConfirmUserName(confirmUser.getName());
            getTypeString(c);
        }
        return new DataGridView(page.getTotal(), page.getRecords());
    }
    @Transactional
    @RequestMapping("addCase")
    public ResultObj addCase(CaseVo caseVo) {
        caseVo.setCaseTime(new Date());
        caseVo.setPayStatus(Constant.TO_BE_PAY);
        Apply apply = applyService.getById(caseVo.getApplyId());
        caseVo.setDoctorId(apply.getDoctorId());
        caseVo.setConfirmUserId(apply.getApplyUserId());
        caseVo.setCaseType(apply.getType());
        try {
            this.caseService.save(caseVo);
            apply.setHasGenerateCase(Constant.HAS_GENERATED);
            applyService.updateById(apply);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }


    }

    @Transactional
    @RequestMapping("pay")
    public ResultObj pay(Integer id) {
        Case caseVo = caseService.getById(id);
        if(caseVo.getPayStatus()!=1){
            return ResultObj.OPERATE_ERROR;
        }
        User user = (User) WebUtils.getSession().getAttribute("user");

        user.setBalance(user.getBalance().subtract(caseVo.getExpense()));
        caseVo.setPayStatus(2);
        try {
            this.caseService.updateById(caseVo);
            userService.updateById(user);
            return ResultObj.PAY_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.PAY_ERROR;
        }
    }

    private void getTypeString(Case c) {
        switch (c.getCaseType()) {
            case 11:
                c.setTypeName("门诊");
                break;
            case 12:
                c.setTypeName("绝育");
                break;
            case 13:
                c.setTypeName("疫苗");
                break;
            case 21:
                c.setTypeName("洗澡");
                break;
            case 22:
                c.setTypeName("洗牙");
                break;
            case 23:
                c.setTypeName("美容");
                break;
            case 24:
                c.setTypeName("其它");
                break;
            default:
                break;
        }
    }

    @RequestMapping("delete")
    public ResultObj delete(Integer id) {
        try {
            this.caseService.removeById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

}
