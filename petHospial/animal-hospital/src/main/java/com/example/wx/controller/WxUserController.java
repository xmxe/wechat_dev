package com.example.wx.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.sys.common.Constant;
import com.example.sys.domain.User;
import com.example.sys.service.UserService;
import com.example.wx.annotation.LoginUser;
import com.example.wx.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("wx/user")
public class WxUserController {

    @Autowired
    private UserService userService;

    @RequestMapping("doctorList")
    private Object doctorList(Integer type) {

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        if (type < 20) {
            queryWrapper.eq("type", Constant.USER_TYPE_HOSPITAL_DOCTOR);
        }else {
            queryWrapper.eq("type", Constant.USER_TYPE_HOSPITAL_BEAUTICION);
        }
        List<User> list = userService.list(queryWrapper);
        return ResponseUtil.okList(list);
    }
}
