package com.example.sys.service.impl;

import com.example.sys.domain.Announcement;
import com.example.sys.mapper.AnnouncementMapper;
import com.example.sys.service.AnnouncementService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.Collection;


@Service
public class AnnouncementServiceImpl extends ServiceImpl<AnnouncementMapper, Announcement> implements AnnouncementService {

}
