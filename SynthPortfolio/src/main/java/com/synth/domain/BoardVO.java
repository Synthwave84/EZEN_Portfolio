package com.synth.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

//	게시판 참조 테이블
//	CREATE TABLE BOARD (
//			  
//		    BOARD_NO    NUMBER,                             -- 글번호
//		    TITLE       VARCHAR2(100)   NOT NULL,           -- 제목
//		    CONTENT     VARCHAR2(1000)  NOT NULL,           -- 내용
//		    AUTHOR      VARCHAR2(100)   NOT NULL,           -- 작성자
//		    CREATEDATE  DATE            DEFAULT SYSDATE,    -- 등록일
//		    MODIFYDATE  DATE            DEFAULT SYSDATE,    -- 수정일
//		    READCOUNT   NUMBER,          
//		    CONSTRAINT  PK_BOARD       PRIMARY KEY(BOARD_NO)
//			);
	
	private Long 	board_no;
	private String 	title;
	private String	content;
	private	String	author;
	private	Date		createdate;
	private	Date		modifydate;
	private	int		readcount;

}
