package com.synth.domain;

import lombok.Data;

@Data
public class CgcodeVO {

	/* 
	CG_CODE     NUMBER  PRIMARY KEY,
    CG_PRTCODE  NUMBER  NULL,
    CG_NAME     VARCHAR2(40)  NOT NULL
    */
	private Integer cg_code;
	private Integer cg_prtcode;
	private String  cg_name;
}
