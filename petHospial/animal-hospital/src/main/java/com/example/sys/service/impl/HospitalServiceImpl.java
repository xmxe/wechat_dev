package com.example.sys.service.impl;

import com.example.sys.domain.Hospital;
import com.example.sys.mapper.HospitalMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.sys.service.HospitalService;
import org.springframework.stereotype.Service;


@Service
public class HospitalServiceImpl extends ServiceImpl<HospitalMapper, Hospital> implements HospitalService {

}
