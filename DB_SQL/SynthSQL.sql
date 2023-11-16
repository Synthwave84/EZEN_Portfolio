
-- 포트폴리오 쇼핑몰 작업.

-- 회원정보 테이블

CREATE TABLE MEMBER_TAB 
(
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
);
DROP TABLE MEMBER_TAB;
SELECT * FROM MEMBER_TAB;

-- 게시판 테이블

CREATE TABLE BOARD (
		  
	    BNO    NUMBER,                                  -- 글번호
	    TITLE       VARCHAR2(100)   NOT NULL,           -- 제목
	    CONTENT     VARCHAR2(1000)  NOT NULL,           -- 내용
	    AUTHOR      VARCHAR2(100)   NOT NULL,           -- 작성자
	    CREATEDATE  DATE            DEFAULT SYSDATE,    -- 등록일
	    MODIFYDATE  DATE            DEFAULT SYSDATE,    -- 수정일
	    READCOUNT   NUMBER          DEFAULT 0,
	    CONSTRAINT  PK_BOARD       PRIMARY KEY(BNO)
		);
DROP TABLE BOARD;
-- 시퀀스 생성 (게시글 번호)
CREATE SEQUENCE SEQ_BOARD;
DROP SEQUENCE SEQ_BOARD;

SELECT * FROM BOARD;
COMMIT;

SELECT * FROM BOARD;

-- 관리자 페이지 전용 관리자 계정 테이블.

CREATE TABLE ADMINISTRATOR_TBL (
    ADMINISTRATOR_ID            VARCHAR2(15)    PRIMARY KEY,
    ADMINISTRATOR_PW            CHAR(60)        NOT NULL,
    ADMINISTRATOR_LOGIN_TIME    DATE
);   

-- 관리자 아이디 비밀번호 admin , 1234
INSERT INTO ADMINISTRATOR_TBL VALUES('admin', '$2a$10$dQFCMr0udCI865eG6SoIcOaNr3Y/dgBX.R4qf6rX5KA3jciSnnNjG',SYSDATE);
DROP TABLE ITEM_COMP;
CREATE TABLE ITEM_COMP_TBL
(
    GRADE           NUMBER          PRIMARY KEY,
    GEN             VARCHAR2(20)    UNIQUE,
    RAM_TYPE        VARCHAR2(10)    UNIQUE,
    M2              CHAR            UNIQUE,
    F_FACTOR        VARCHAR2(10)    UNIQUE
);
DROP TABLE CG_CODE_TBL;
CREATE TABLE CG_CODE_TBL
(
    CG_CODE     NUMBER  PRIMARY KEY,
    CG_PRTCODE  NUMBER  NULL,
    CG_NAME     VARCHAR2(40)  NOT NULL
);

INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (1,NULL,'CPU');
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (2,NULL,'쿨러');
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (3,NULL,'메인보드(Mainboard)');
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (4,NULL,'램(Memory)');
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (5,NULL,'그래픽카드(VGA)');
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (6,NULL,'저장장치(HDD,SSD)');
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (7,NULL,'파워');
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (8,NULL,'케이스');
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (9,NULL,'기타');

INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (11,1,'인텔(Intel)');
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (12,1,'AMD');
    
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (21,2,'공랭');
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (22,2,'수냉');
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (23,2,'케이스,시스템 팬');
    
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (31,3,'인텔 시스템용');
INSERT INTO CG_CODE_TBL (CG_CODE,CG_PRTCODE,CG_NAME) 
    VALUES (32,3,'AMD 시스템용');





CREATE TABLE ITEM_TBL (
        ITEM_NO             NUMBER  CONSTRAINT      PK_ITEM_NO         PRIMARY KEY,
        CG_CODE             NUMBER                  NOT NULL,
        ITEM_NAME           VARCHAR2(50)            NOT NULL,
        ITEM_PRICE          NUMBER                  NOT NULL,
        ITEM_DISCOUNT       NUMBER                  NOT NULL,
        ITEM_MANUFACTURE    VARCHAR2(50)            NOT NULL,
        ITEM_CONTENT        VARCHAR2(4000)          NOT NULL,       -- 내용이 4000BYTE 초과여부판단? CLOB
        ITEM_UP_FOLDER      VARCHAR2(50)            NOT NULL,
        ITEM_IMG            VARCHAR2(100)           NOT NULL,       -- 날짜폴더경로가 포함하여 파일이름저장
        ITEM_AMOUNT         NUMBER                  NOT NULL,
        ITEM_BUY            CHAR(1)                 NOT NULL,       -- 대문자 Y또는 N값.
        ITEM_DATE           DATE DEFAULT SYSDATE    NOT NULL,
        ITEM_UPDATEDATE     DATE DEFAULT SYSDATE    NOT NULL,
        GRADE               NUMBER                  NOT NULL,
        GEN                 VARCHAR2(20)            NULL,
        RAM_TYPE            VARCHAR2(10)            NULL,
        M2                  CHAR(1)                 NULL,
        F_FACTOR            VARCHAR2(10)            NULL,

        FOREIGN KEY(CG_CODE)    REFERENCES CG_CODE_TBL(CG_CODE),
        FOREIGN KEY(GRADE)      REFERENCES ITEM_COMP_TBL(GRADE),
        FOREIGN KEY(GEN)        REFERENCES ITEM_COMP_TBL(GEN),
        FOREIGN KEY(RAM_TYPE)   REFERENCES ITEM_COMP_TBL(RAM_TYPE),
        FOREIGN KEY(M2)         REFERENCES ITEM_COMP_TBL(M2),
        FOREIGN KEY(F_FACTOR)   REFERENCES ITEM_COMP_TBL(F_FACTOR)
);










