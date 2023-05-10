package com.example.bus.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.bus.domain.Goods;
import com.example.bus.domain.Inport;
import com.example.bus.domain.Pet;
import com.example.bus.domain.Provider;
import com.example.bus.service.PetService;
import com.example.bus.vo.PetVo;
import com.example.bus.vo.PetVo;
import com.example.sys.common.Constant;
import com.example.sys.common.DataGridView;
import com.example.sys.common.ResultObj;
import com.example.sys.common.WebUtils;
import com.example.sys.domain.User;
import com.example.sys.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@RestController
@RequestMapping("/pet")
public class PetController {


    @Autowired
    private PetService petService;

    @Autowired
    private UserService userService;

    @RequestMapping("loadAllPet")
    public DataGridView loadAllPet(PetVo petVo) {
        IPage<Pet> page = new Page<>(petVo.getPage(), petVo.getLimit());
        QueryWrapper<Pet> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(petVo.getName()), "name", petVo.getName());
        queryWrapper.eq(null != petVo.getPetType(), "type", null != petVo.getPetType());
        this.petService.page(page, queryWrapper);
        List<Pet> records = page.getRecords();
        for (Pet pet : records) {
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
        }
        return new DataGridView(page.getTotal(), records);
    }

    @RequestMapping("addPet")
    public ResultObj addPet(PetVo petVo) {
        try {
            this.petService.save(petVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改
     */
    @RequestMapping("updatePet")
    public ResultObj updatePet(PetVo petVo) {
        try {
            this.petService.updateById(petVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除
     */
    @RequestMapping("deletePet")
    public ResultObj deletePet(Integer id) {
        try {
            this.petService.removeById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除
     */
    @RequestMapping("batchDeletePet")
    public ResultObj batchDeletePet(PetVo petVo) {
        try {
            Collection<Serializable> idList = new ArrayList<Serializable>();
            for (Integer id : petVo.getIds()) {
                idList.add(id);
            }
            this.petService.removeByIds(idList);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("loadAllPetForSelect")
    public DataGridView loadAllPetForSelect() {
        QueryWrapper<Pet> queryWrapper = new QueryWrapper<>();
        List<Pet> list = this.petService.list(queryWrapper);
        System.out.println(list);
        return new DataGridView(list);
    }

    @RequestMapping("loadAllPetByOwnerIdForSelect")
    public DataGridView loadAllPetByOwnerIdForSelect() {
        QueryWrapper<Pet> queryWrapper = new QueryWrapper<>();
        User user = (User) WebUtils.getSession().getAttribute("user");
        queryWrapper.eq("owner_id",user.getId());
        List<Pet> list = this.petService.list(queryWrapper);
        System.out.println(list);
        return new DataGridView(list);
    }

}
