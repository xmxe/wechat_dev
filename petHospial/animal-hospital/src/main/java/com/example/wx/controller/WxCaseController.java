package com.example.wx.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.bus.domain.Pet;
import com.example.bus.service.PetService;
import com.example.sys.domain.Apply;
import com.example.sys.domain.Case;
import com.example.sys.domain.Hospital;
import com.example.sys.domain.User;
import com.example.sys.service.ApplyService;
import com.example.sys.service.CaseService;
import com.example.sys.service.HospitalService;
import com.example.sys.service.UserService;
import com.example.wx.annotation.LoginUser;
import com.example.wx.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("wx/case")
public class WxCaseController {

    @Autowired
    private CaseService caseService;

    @Autowired
    private PetService petService;

    @Autowired
    private HospitalService hospitalService;

    @Autowired
    private UserService userService;

    @Autowired
    private ApplyService applyService;

    @RequestMapping("list")
    public Object list(@LoginUser Integer userId) {
        if (userId == null) {
            return ResponseUtil.unlogin();
        }
        QueryWrapper<Case> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("confirm_user_id", userId);
        queryWrapper.orderByDesc("case_time");
        List<Case> list = caseService.list(queryWrapper);
        for (Case c : list) {
            Apply apply = applyService.getById(c.getApplyId());
            Pet pet = petService.getById(apply.getPetId());
            c.setPetName(pet.getName());
            c.setPetAge(pet.getAge());
            c.setPetSex(pet.getSex());
            User doctor = userService.getById(c.getDoctorId());
            c.setDoctorName(doctor.getName());
            User owner = userService.getById(userId);
            Hospital hospital = hospitalService.getById(doctor.getHospitalId());
            c.setHospitalName(hospital.getName());
        }
        return ResponseUtil.okList(list);
    }

    @RequestMapping("detail")
    public Object detail(@LoginUser Integer userId, Integer id) {
        if (null == userId) {
            return ResponseUtil.unlogin();
        }
        Case c = caseService.getById(id);
        User owner = this.userService.getById(userId);
        c.setConfirmUserName(owner.getName());
        User doctor = userService.getById(c.getDoctorId());
        c.setDoctorName(doctor.getName());
        Hospital hospital = hospitalService.getById(doctor.getHospitalId());
        c.setHospitalName(hospital.getName());

        Apply apply = applyService.getById(c.getApplyId());
        Pet pet = petService.getById(apply.getPetId());
        c.setPetName(pet.getName());
        c.setPetSex(pet.getSex());
        c.setPetAge(pet.getAge());

        return ResponseUtil.ok(c);
    }
}
