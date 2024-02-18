package com.synth.domain;

import lombok.Data;

@Data
public class ItemManufactureVO {

//		MANUFACTURE_CODE        NUMBER,              
//    	MANUFACTURE_NAME        VARCHAR2(50)        NOT NULL,
//    	CG_CODE                 NUMBER,
	
	private Long 	manufacture_code;
	private String 	manufacture_name;
	private Integer	cg_code;
}
