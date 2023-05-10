package com.example.wx.controller;

import com.example.sys.domain.Apply;
import com.example.sys.domain.Hospital;
import com.example.sys.domain.User;
import com.example.sys.service.ApplyService;
import com.example.sys.service.UserService;
import com.example.wx.annotation.LoginUser;
import com.example.wx.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.Date;

@RestController
@RequestMapping("wx/apply")
public class WxApplyController {

    @Autowired
    private ApplyService applyService;

    @Autowired
    private UserService userService;

    @RequestMapping("add")
    public Object add(@LoginUser Integer userId, @RequestBody Apply apply) {
        if (null == userId) {
            return ResponseUtil.unlogin();
        }
        apply.setApplyUserId(userId);
        try {
            User doctor = userService.getById(apply.getDoctorId());
            apply.setHospitalId(doctor.getHospitalId());
            apply.setStatus(1);
            apply.setApplyTime(new Date());
            apply.setHasGenerateCase(0);
            apply.setMoney(new BigDecimal(10));

            applyService.save(apply);
            return ResponseUtil.ok();
        } catch (Exception e) {
            return ResponseUtil.fail();
        }

    }
}
