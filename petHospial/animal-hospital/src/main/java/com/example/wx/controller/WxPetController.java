package com.example.wx.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.bus.domain.Pet;
import com.example.bus.service.PetService;
import com.example.sys.domain.User;
import com.example.sys.service.UserService;
import com.example.wx.annotation.LoginUser;
import com.example.wx.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("wx/pet")
public class WxPetController {

    @Autowired
    private PetService petService;

    @Autowired
    private UserService userService;

    @RequestMapping("listByOwnerId")
    public Object listByOwnerId(@LoginUser Integer id) {
        if (null == id) {
            return ResponseUtil.unlogin();
        }
        QueryWrapper<Pet> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("owner_id", id);
        List<Pet> list = petService.list(queryWrapper);
        return ResponseUtil.okList(list);
    }

    @RequestMapping("detail")
    public Object detail(@LoginUser Integer userId,Integer id){
        if (null == userId) {
            return ResponseUtil.unlogin();
        }
        Pet pet = petService.getById(id);
        User owner = this.userService.getById(pet.getOwnerId());
        StringBuilder builder = new StringBuilder();
        String fullAddress = builder.append(pet.getProvince()).append(pet.getCity())
                .append(pet.getCounty()).append(pet.getDetailAddress()).toString();

        pet.setFullAddress(fullAddress);
        if (null != owner) {
            pet.setOwnerName(owner.getName());
            pet.setOwnerSex(owner.getSex());
            pet.setPhone(owner.getPhone());
        }
        return ResponseUtil.ok(pet);
    }

}
