package com.synth.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminVO {
	/*
	CREATE TABLE ADMINISTRATOR_TBL (
		    ADMINISTRATOR_ID            VARCHAR2(15)    PRIMARY KEY,
		    ADMINISTRATOR_PW            CHAR(60)        NOT NULL,
		    ADMINISTRATOR_LOGIN_TIME    DATE
		);
	*/
	
	private String 	administrator_id;
	private String 	administrator_pw;
	private Date		administrator_login_time;
}
