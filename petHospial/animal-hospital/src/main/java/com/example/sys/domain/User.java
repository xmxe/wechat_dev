package com.example.sys.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;


@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_user")
@ToString
public class User implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 真实姓名
     */
    private String name;

    /**
     * 昵称
     */
    private String loginname;

    /**
     * 具体地址
     */
    private String detailAddress;

    /**
     * 性别
     */
    private String sex;

    /**
     * 备注
     */
    private String remark;

    /**
     * 密码
     */
    private String pwd;

    /**
     * 医院id（职工）
     */
    private Integer hospitalId;

    /**
     * 更新时间
     */
    private Date updateTime;

    private Integer mgr;

    /**
     * 逻辑删除
     */
    private Integer available;

    /**
     * 排序号
     */
    private Integer ordernum;

    /**
     * 用户类型[0超级管理员1，管理员，2普通用户]
     */
    private Integer type;

    /**
     * 头像地址
     */
    private String imgpath;

    /**
     * 盐
     */
    private String salt;

    /**
     * 余额
     */
    private BigDecimal balance;

    /**
     * 微信id
     */
    private String openId;

    /**
     * 描述
     */
    private String description;

    /**
     * 省区
     */
    private String region;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 职位
     */
    private String position;

    private String idNumber;

    private String status;

    private String phone;

    private String jobNumber;

    private String province;

    private String city;

    private String county;

    @TableField(exist = false)
    private String fullAddress;

    @TableField(exist = false)
    private String hospitalName;



}
