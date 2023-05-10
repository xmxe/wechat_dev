package com.example.sys.domain;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;

import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 *
 * </p>
 *
 * @author me
 * @since 2020-11-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_case")
public class Case implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private Integer applyId;

    private String result;

    private String method;

    private Date caseTime;

    private String symptom;

    private BigDecimal expense;

    private Integer doctorId;

    private Integer confirmUserId;

    private Integer caseType;

    private Integer payStatus;

    @TableField(exist = false)
    private String confirmUserName;

    @TableField(exist = false)
    private String petName;

    @TableField(exist = false)
    private String petSex;

    @TableField(exist = false)
    private Integer petAge;

    @TableField(exist = false)
    private String hospitalName;

    @TableField(exist = false)
    private String doctorName;

    @TableField(exist = false)
    private Integer petId;

    @TableField(exist = false)
    private String typeName;
}
