package com.example.bus.service.impl;

import com.example.bus.domain.Pet;
import com.example.bus.mapper.PetMapper;
import com.example.bus.service.PetService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;


@Service
public class PetServiceImpl extends ServiceImpl<PetMapper, Pet> implements PetService {

}
