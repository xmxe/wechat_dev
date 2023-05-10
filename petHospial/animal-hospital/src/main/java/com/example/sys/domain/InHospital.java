package com.example.sys.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

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
@TableName("sys_in_hospital")
@AllArgsConstructor
@NoArgsConstructor
public class InHospital implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private Integer petId;

    private Integer doctorId;

    private Integer roomNumber;

    private Integer bedNumber;

    private String reason;

    private Integer type;

    private Date addTime;

    private Integer status;

    @TableField(exist = false)
    private String petName;

    @TableField(exist = false)
    private String doctorName;

    @TableField(exist = false)
    private String doctorPhone;


}
