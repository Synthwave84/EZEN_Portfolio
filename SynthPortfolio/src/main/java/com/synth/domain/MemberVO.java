package com.synth.domain;

import java.util.Date;

import lombok.Data;


//	롬복 데이터 어노테이션 추가. > toString,Getter,Setter 통합.
@Data
public class MemberVO {
	
//		생성할 밸류 오브젝트 테이블 구성
	
	/*
	 	MEMBER_ID             VARCHAR2(15)            NOT NULL,
        MEMBER_NAME           VARCHAR2(30)            NOT NULL,       -- 이름
        MEMBER_EMAIL          VARCHAR2(50)            NOT NULL,       -- 이메일
        MEMBER_PASSWORD       CHAR(60)                NOT NULL,       -- 비밀번호 암호화 처리.
        MEMBER_ZIPCODE        CHAR(5)                 NOT NULL,       -- 우편번호
        MEMBER_ADDR           VARCHAR2(100)           NOT NULL,       -- 주소
        MEMBER_DEADDR         VARCHAR2(100)           NOT NULL,       -- 상세주소
        MEMBER_PHONE          VARCHAR2(15)            NOT NULL,       -- 연락처    
        MEMBER_POINT          NUMBER DEFAULT 0        NOT NULL,       -- 포인트
        MEMBER_LASTLOGIN      DATE DEFAULT SYSDATE    NOT NULL,       -- 최근 접속일
        MEMBER_DATESUB        DATE DEFAULT SYSDATE    NOT NULL,       -- 등록일
        MEMBER_UPDATEDATE     DATE DEFAULT SYSDATE    NOT NULL        -- 정보 수정일 
	*/
	
	private String 	member_id;
	private String 	member_name;
	private String 	member_email;
	private String 	member_password;
	private String 	member_zipcode;
	private String 	member_addr;
	private String 	member_deaddr;
	private String 	member_phone;
	private int	   	member_point;
	private	Date   	member_lastlogin;
	private	Date   	member_datesub;
	private	Date	   	member_updatedate;
}
