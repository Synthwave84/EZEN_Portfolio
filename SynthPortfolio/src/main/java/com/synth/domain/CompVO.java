package com.synth.domain;

import lombok.Data;

@Data
public class CompVO {
	
		/*
		    COMP_NAME       VARCHAR2(30)        NOT NULL,
    		COMP_VALUE      VARCHAR2(50)        UNIQUE,
    		COMP_TYPE       VARCHAR2(30)        NOT NULL,
		*/
		private String comp_name;
		private String comp_value;
		private String comp_type;
}
