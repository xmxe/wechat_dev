package com.example.wx.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.bus.domain.Pet;
import com.example.bus.service.PetService;
import com.example.sys.domain.Announcement;
import com.example.sys.domain.User;
import com.example.sys.service.AnnouncementService;
import com.example.sys.service.UserService;
import com.example.sys.vo.AnnouncementVo;
import com.example.wx.annotation.LoginUser;
import com.example.wx.util.JacksonUtil;
import com.example.wx.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@RequestMapping("wx/announcement")
public class WxAnnouncementController {

    @Autowired
    private AnnouncementService announcementService;

    @Autowired
    private PetService petService;

    @Autowired
    private UserService userService;

    @RequestMapping("list")
    public Object list() {
     /*   if (userId == null) {
            return ResponseUtil.unlogin();
        }*/
        QueryWrapper<Announcement> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("create_time");
        return ResponseUtil.okList(announcementService.list(queryWrapper));
    }

    @RequestMapping("fetchById")
    public Object fetchById(Integer id) throws ParseException {
        Announcement announcement = announcementService.getById(id);

        Pet pet = petService.getById(announcement.getPetId());
        announcement.setPetName(pet.getName());
        announcement.setPetSex(pet.getSex());
        announcement.setPetId(pet.getId());
        announcement.setPetBirth(new SimpleDateFormat("yyyy-MM-dd")
                .parse(pet.getBirth()));


        User owner = userService.getById(announcement.getOwnerId());
        announcement.setOwnerName(owner.getName());
        announcement.setOwnerSex(owner.getSex());
        announcement.setPhone(owner.getPhone());


        return ResponseUtil.ok(announcement);
    }

    @RequestMapping("add")
    public Object add(@LoginUser Integer userId, @RequestBody Announcement announcement) {
        if (null == userId) {
            return ResponseUtil.unlogin();
        }
        switch (announcement.getType()){
            case "1":
                announcement.setType("领养公告");
                break;
            case "2":
                announcement.setType("寄养公告");
                break;
            case "3":
                announcement.setType("丢失公告");
                break;
            default:
                announcement.setType("招养公告");
                break;

        }
        announcement.setOwnerId(userId);
        announcement.setCreateTime(new Date());
        announcement.setAvailable(true);
        //Announcement announcement = new Announcement();
       /* Integer petId = JacksonUtil.parseInteger(body,"petId");
        String type = JacksonUtil.parseString(body,"type");
        String title = JacksonUtil.parseString(body,"title");
        String content = JacksonUtil.parseString(body,"content");
        String status = JacksonUtil.parseString(body,"status");*/

        try {
            /*announcement.setPetId(petId);
            announcement.setType(type);
            announcement.setTitle(title);
            announcement.setContent(content);
            announcement.setStatus(status);
            announcement.setOwnerId(userId);
            announcement.setCreateTime(new Date());
            announcement.setAvailable(true);*/

            announcementService.save(announcement);
            return ResponseUtil.ok();
        } catch (Exception e) {
            return ResponseUtil.fail();
        }
    }
}
