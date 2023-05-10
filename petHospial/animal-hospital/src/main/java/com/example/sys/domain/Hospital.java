package com.example.sys.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_hospital")
public class Hospital implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String name;

    private String province;

    private String city;

    private String county;

    private String detailAddress;

    private String phone;

    private String leader;

    @TableField(exist = false)
    private String fullAddress;


}
