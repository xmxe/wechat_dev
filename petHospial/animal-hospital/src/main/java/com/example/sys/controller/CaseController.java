package com.example.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.bus.domain.Pet;
import com.example.bus.domain.Provider;
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
import com.example.sys.vo.ApplyVo;
import com.example.sys.vo.CaseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author me
 * @since 2020-11-30
 */
@RestController
@RequestMapping("/case")
public class CaseController {

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

    @RequestMapping("loadAllCase")
    public DataGridView loadAllCase(CaseVo caseVo) {
        IPage<Case> page = new Page<>(caseVo.getPage(), caseVo.getLimit());
        QueryWrapper<Case> queryWrapper = new QueryWrapper<>();

        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getType() == Constant.USER_TYPE_HOSPITAL_DOCTOR ){
            queryWrapper.eq("doctor_id", user.getId());
            queryWrapper.lt("case_type", 20);
        } else if(user.getType()== Constant.USER_TYPE_HOSPITAL_BEAUTICION) {
            queryWrapper.eq("doctor_id", user.getId());
            queryWrapper.gt("case_type", 20);
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


}
