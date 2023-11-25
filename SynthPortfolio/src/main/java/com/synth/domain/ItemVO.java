package com.synth.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ItemVO {
/*
  		ITEM_NO             NUMBER                  NOT NULL,
        CG_CODE             NUMBER                  NOT NULL,
        ITEM_NAME           VARCHAR2(50)            NOT NULL,
        ITEM_PRICE          NUMBER                  NOT NULL,
        ITEM_DISCOUNT       NUMBER                  NULL,
        ITEM_MANUFACTURE    VARCHAR2(50)            NOT NULL,
        ITEM_CONTENT        VARCHAR2(4000)          NOT NULL,       -- 내용이 4000BYTE 초과여부판단? CLOB
        ITEM_UP_FOLDER      VARCHAR2(50)            NOT NULL,
        ITEM_IMG            VARCHAR2(100)           NOT NULL,       -- 날짜폴더경로가 포함하여 파일이름저장
        ITEM_AMOUNT         NUMBER                  NOT NULL,
        ITEM_BUY            CHAR(1)                 NOT NULL,       -- 대문자 Y또는 N값.
        ITEM_SHORT_DETAIL   VARCHAR2(2000)          NULL,
        ITEM_DATE           DATE DEFAULT SYSDATE    NULL,
        ITEM_UPDATEDATE     DATE DEFAULT SYSDATE    NULL,
        GRADE               NUMBER                  NULL,
        GEN                 VARCHAR2(20)            NULL,
        RAM_TYPE            VARCHAR2(10)            NULL,
        M2                  NUMBER            		NULL,
        F_FACTOR            VARCHAR2(10)            NULL,   
*/
		private Integer item_no;
		private Integer cg_code;
		private String  item_name;
		private Integer item_price;
		private Integer item_discount;
		private String  item_manufacture;
		private String  item_content;
		private String  item_up_folder;
		private String  item_img;
		private Integer item_amount;
		private String  item_buy;
		private String  item_short_detail;
		private Date    item_date;
		private Date    item_updatedate;
		private Integer grade;
		private String  gen;
		private String  ram_type;
		private Integer m2;
		private String  f_factor;
	
}
