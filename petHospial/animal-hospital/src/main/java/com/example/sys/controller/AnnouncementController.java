package com.example.sys.controller;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.bus.domain.Goods;
import com.example.bus.domain.Inport;
import com.example.bus.domain.Pet;
import com.example.bus.domain.Provider;
import com.example.bus.service.PetService;
import com.example.bus.vo.PetVo;
import com.example.sys.common.DataGridView;
import com.example.sys.common.ResultObj;
import com.example.sys.common.WebUtils;
import com.example.sys.domain.Announcement;
import com.example.sys.domain.User;
import com.example.sys.service.AnnouncementService;
import com.example.sys.service.UserService;
import com.example.sys.vo.AnnouncementVo;
import com.example.sys.vo.NoticeVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;


@RestController
@RequestMapping("/announcement")
public class AnnouncementController {


    @Autowired
    private AnnouncementService announcementService;

    @Autowired
    private UserService userService;

    @Autowired
    private PetService petService;


    @RequestMapping("loadAllAnnouncement")
    public DataGridView loadAllAnnouncement(AnnouncementVo announcementVo) throws ParseException {

        IPage<Announcement> page = new Page<>(announcementVo.getPage(), announcementVo.getLimit());
        QueryWrapper<Announcement> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNoneEmpty(announcementVo.getTitle()), "title", announcementVo.getTitle());
        queryWrapper.eq(StringUtils.isNotBlank(announcementVo.getType()), "type", announcementVo.getType());
        queryWrapper.ge(announcementVo.getStartTime() != null, "create_time", announcementVo.getStartTime());
        queryWrapper.le(announcementVo.getEndTime() != null, "create_time", announcementVo.getEndTime());
        queryWrapper.orderByDesc("create_time");

        this.announcementService.page(page, queryWrapper);

        List<Announcement> records = page.getRecords();
        for (Announcement announcement : records) {
            User user = this.userService.getById(announcement.getOwnerId());
            if (null != user) {
                announcement.setOwnerName(user.getName());
                announcement.setOwnerSex(user.getSex());
                announcement.setPhone(user.getPhone());
            }
            Pet pet = this.petService.getById(announcement.getPetId());
            if (null != pet) {
                announcement.setPetName(pet.getName());
                announcement.setPetSex(pet.getSex());
                announcement.setPetBirth(new SimpleDateFormat("yyyy-MM-dd").parse(pet.getBirth()));
            }
        }
        return new DataGridView(page.getTotal(), page.getRecords());

    }

    /**
     * 添加
     */
    @RequestMapping("addAnnouncement")
    public ResultObj addAnnouncement(AnnouncementVo announcementVo) {
        Pet pet = this.petService.getById(announcementVo.getPetId());
        announcementVo.setOwnerId(pet.getOwnerId());
        announcementVo.setCreateTime(new Date());
        announcementVo.setAvailable(true);
        try {
            this.announcementService.save(announcementVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改
     */
    @RequestMapping("updateAnnouncement")
    public ResultObj updateAnnouncement(AnnouncementVo announcementVo) {
        Pet pet = this.petService.getById(announcementVo.getPetId());
        announcementVo.setOwnerId(pet.getOwnerId());
        try {
            this.announcementService.updateById(announcementVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }
    /**
     * 删除
     */
    @RequestMapping("deleteAnnouncement")
    public ResultObj deleteAnnouncement(Integer id) {
        try {
            this.announcementService.removeById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除
     */
    @RequestMapping("batchDeleteAnnouncement")
    public ResultObj batchDeleteAnnouncement(AnnouncementVo announcementVo) {
        try {
            Collection<Serializable> idList = new ArrayList<Serializable>();
            for (Integer id : announcementVo.getIds()) {
                idList.add(id);
            }
            this.announcementService.removeByIds(idList);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

}
