package com.example.wx.controller;


import com.example.sys.domain.Announcement;
import com.example.sys.domain.Hospital;
import com.example.sys.service.HospitalService;
import com.example.wx.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;

@RestController
@RequestMapping("wx/hospital")
public class WxHospitalController {

    @Autowired
    private HospitalService hospitalService;

    @RequestMapping("list")
    public Object list() {
        return ResponseUtil.okList(hospitalService.list());
    }


    @RequestMapping("fetchById")
    public Object fetchById(Integer id) {
        Hospital hospital = hospitalService.getById(id);
        return ResponseUtil.ok(hospital);
    }
}
