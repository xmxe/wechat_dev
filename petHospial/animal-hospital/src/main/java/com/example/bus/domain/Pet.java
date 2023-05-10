package com.example.bus.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDate;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@TableName("bus_pet")
public class Pet implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String name;

    private String sex;

    private Integer age;

    private String birth;

    private String petType;

    private Integer ownerId;

    private String description;

    private Boolean deleted;

    private String province;

    private String city;

    private String county;

    private String detailAddress;

    @TableField(exist = false)
    private String ownerName;

    @TableField(exist = false)
    private String ownerSex;

    @TableField(exist = false)
    private String phone;

    @TableField(exist = false)
    private String fullAddress;

}
