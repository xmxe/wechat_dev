package com.example.sys.vo;

import com.example.sys.domain.Hospital;
import com.example.sys.domain.Loginfo;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@EqualsAndHashCode(callSuper=false)
public class HospitalVo extends Hospital {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private Integer page=1;
	private Integer limit=10;
	
	private Integer[] ids;//接收多个ID
	
}
