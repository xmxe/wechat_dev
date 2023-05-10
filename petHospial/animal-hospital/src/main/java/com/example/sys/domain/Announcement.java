package com.example.sys.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;


@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_announcement")
@ToString
@Accessors(chain = true)
public class Announcement implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String title;

    private String content;

    private String type;

    private Integer petId;

    private Integer ownerId;

    private String status;

    private Boolean available;

    private Date createTime;

    @TableField(exist = false)
    private String ownerName;

    @TableField(exist = false)
    private String ownerSex;

    @TableField(exist = false)
    private String petName;

    @TableField(exist = false)
    private String petSex;



    @TableField(exist = false)
    private Date petBirth;

    @TableField(exist = false)
    private String phone;




}
