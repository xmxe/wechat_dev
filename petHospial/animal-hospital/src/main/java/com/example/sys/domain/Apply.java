package com.example.sys.domain;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_apply")
public class Apply implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private Integer petId;

    private Integer doctorId;

    private Integer hospitalId;

    private Integer type;

    private Date applyTime;

    private Integer status;

    private Integer hasGenerateCase;

    private String remark;

    private BigDecimal money;

    private Integer applyUserId;

    @TableField(exist = false)
    private String petName;

    @TableField(exist = false)
    private String petType;

    @TableField(exist = false)
    private String phone;

    @TableField(exist = false)
    private String hospitalName;

    @TableField(exist = false)
    private String doctorName;

    @TableField(exist = false)
    private String beauticianName;

    @TableField(exist = false)
    private String applyStatus;

    @TableField(exist = false)
    private String applyType;

}
