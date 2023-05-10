package com.example.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.bus.domain.Pet;
import com.example.bus.domain.Provider;
import com.example.sys.common.Constant;
import com.example.sys.domain.Hospital;
import com.example.sys.domain.User;
import com.example.sys.vo.HospitalVo;
import com.example.sys.common.DataGridView;
import com.example.sys.common.ResultObj;
import com.example.sys.domain.Hospital;
import com.example.sys.service.HospitalService;
import com.example.sys.vo.HospitalVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


@RestController
@RequestMapping("/hospital")
public class HospitalController {

    @Autowired
    private HospitalService hospitalService;

    @RequestMapping("loadAllHospital")
    public DataGridView loadAllHospital(HospitalVo hospitalVo) {
        IPage<Hospital> page = new Page<>(hospitalVo.getPage(), hospitalVo.getLimit());
        QueryWrapper<Hospital> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(hospitalVo.getName()), "name",
                hospitalVo.getName());
        queryWrapper.like(StringUtils.isNotBlank(hospitalVo.getFullAddress()), "full_address", hospitalVo.getFullAddress());
        queryWrapper.eq(StringUtils.isNotBlank(hospitalVo.getProvince()), "province",
                hospitalVo.getProvince());
        queryWrapper.eq(StringUtils.isNotBlank(hospitalVo.getCity()), "city", hospitalVo.getCity());
        queryWrapper.eq(StringUtils.isNotBlank(hospitalVo.getCounty()), "county", hospitalVo.getCounty());
        this.hospitalService.page(page, queryWrapper);
        List<Hospital> records = page.getRecords();
        for (Hospital hospital : records) {
            StringBuilder builder = new StringBuilder();
            String fullAddress = builder.append(hospital.getProvince()).append(hospital.getCity())
                    .append(hospital.getCounty()).append(hospital.getDetailAddress()).toString();

            hospital.setFullAddress(fullAddress);
        }
        return new DataGridView(page.getTotal(), page.getRecords());
    }

    @RequestMapping("addHospital")
    public ResultObj addHospital(HospitalVo hospitalVo) {

        try {
            this.hospitalService.save(hospitalVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }


    }

    /**
     * 修改
     */
    @RequestMapping("updateHospital")
    public ResultObj updateHospital(HospitalVo hospitalVo) {

        try {
            //TODO 更新失败
            this.hospitalService.updateById(hospitalVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除
     */
    @RequestMapping("deleteHospital")
    public ResultObj deleteHospital(Integer id) {
        try {
            this.hospitalService.removeById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除
     */
    @RequestMapping("batchDeleteHospital")
    public ResultObj batchDeleteHospital(HospitalVo hospitalVo) {
        try {
            Collection<Serializable> idList = new ArrayList<Serializable>();
            for (Integer id : hospitalVo.getIds()) {
                idList.add(id);
            }
            this.hospitalService.removeByIds(idList);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }


    /**
     * 加载所有可用的医院
     */
    @RequestMapping("loadAllHospitalForSelect")
    public DataGridView loadAllHospitalForSelect() {
        QueryWrapper<Hospital> queryWrapper=new QueryWrapper<>();
        List<Hospital> list = this.hospitalService.list(queryWrapper);
        return new DataGridView(list);
    }


}
