
-- 포트폴리오 쇼핑몰 작업.

-- 회원정보 테이블

DROP TABLE MEMBER_TAB;
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

ALTER TABLE MEMBER_TAB
ADD CONSTRAINT PK_MEMBER_ID PRIMARY KEY (MEMBER_ID);


-- 게시판 테이블
DROP TABLE BOARD;
CREATE TABLE BOARD (
		  
	    BNO    NUMBER,                                  -- 글번호
	    TITLE       VARCHAR2(100)   NOT NULL,           -- 제목
	    CONTENT     VARCHAR2(1000)  NOT NULL,           -- 내용
	    AUTHOR      VARCHAR2(100)   NOT NULL,           -- 작성자
	    CREATEDATE  DATE            DEFAULT SYSDATE,    -- 등록일
	    MODIFYDATE  DATE            DEFAULT SYSDATE,    -- 수정일
	    READCOUNT   NUMBER          DEFAULT 0,
	    CONSTRAINT  PK_BOARD        PRIMARY KEY(BNO)
		);
        

-- 시퀀스 생성 (게시글 번호)
DROP SEQUENCE SEQ_BOARD;
CREATE SEQUENCE SEQ_BOARD;

-- 관리자 페이지 전용 관리자 계정 테이블.

CREATE TABLE ADMINISTRATOR_TBL (
    ADMINISTRATOR_ID            VARCHAR2(15)    PRIMARY KEY,
    ADMINISTRATOR_PW            CHAR(60)        NOT NULL,
    ADMINISTRATOR_LOGIN_TIME    DATE
);   



    
-- 카테고리 테이블
DROP TABLE CG_CODE_TBL;
CREATE TABLE CG_CODE_TBL
(
    CG_CODE     NUMBER          PRIMARY KEY,
    CG_PRTCODE  NUMBER          NULL,
    CG_NAME     VARCHAR2(40)    UNIQUE,
    FOREIGN KEY(CG_PRTCODE) REFERENCES CG_CODE_TBL(CG_CODE)
);

-- 제조사 테이블
DROP TABLE MANUFACTURE_TAB;
CREATE TABLE MANUFACTURE_TAB 
(
    MANUFACTURE_CODE        NUMBER,              
    MANUFACTURE_NAME        VARCHAR2(50)        NOT NULL,
    CG_CODE                 NUMBER,
    
    CONSTRAINT      PK_MANU_OPTION       PRIMARY KEY(MANUFACTURE_CODE),
    FOREIGN KEY     (CG_CODE)            REFERENCES CG_CODE_TBL(CG_CODE)
);

DROP SEQUENCE SEQ_MANUF_CODE;
CREATE SEQUENCE SEQ_MANUF_CODE;

-- 품목 관리용 테이블
DROP TABLE ITEM_TBL;
CREATE TABLE ITEM_TBL (
        ITEM_NO             NUMBER                  NOT NULL,
        CG_CODE             NUMBER                  NOT NULL,
        ITEM_NAME           VARCHAR2(50)            NOT NULL,
        ITEM_PRICE          NUMBER                  NOT NULL,
        ITEM_DISCOUNT       NUMBER                  NULL,
        ITEM_MANUFACTURE    NUMBER                  NOT NULL,
        ITEM_CONTENT        VARCHAR2(4000)          NOT NULL,       -- 내용이 4000BYTE 초과여부판단? CLOB
        ITEM_UP_FOLDER      VARCHAR2(50)            NOT NULL,
        ITEM_IMG            VARCHAR2(100)           NOT NULL,       -- 날짜폴더경로가 포함하여 파일이름저장
        ITEM_AMOUNT         NUMBER                  NOT NULL,
        ITEM_BUY            VARCHAR2(1)             NOT NULL,       -- 대문자 Y또는 N값.
        ITEM_SHORT_DETAIL   VARCHAR2(2000)          NULL,
        ITEM_DATE           DATE DEFAULT SYSDATE    NULL,
        ITEM_UPDATEDATE     DATE DEFAULT SYSDATE    NULL,
        OPTION_TYPE_ID      NUMBER                  NOT NULL,
        OPTION_CG_ID        NUMBER                  NOT NULL,
        OPTION_ID           NUMBER                  NOT NULL,

        CONSTRAINT  PK_ITEM_NO      PRIMARY KEY(ITEM_NO),
        FOREIGN KEY (CG_CODE)        REFERENCES CG_CODE_TBL(CG_CODE),
        FOREIGN KEY (ITEM_MANUFACTURE) REFERENCES MANUFACTURE_TAB(MANUFACTURE_CODE),
        FOREIGN KEY (OPTION_TYPE_ID) REFERENCES OPTION_TYPE(OPTION_TYPE_ID),
        FOREIGN KEY (OPTION_CG_ID)   REFERENCES OPTION_CG(OPTION_CG_ID),
        FOREIGN KEY (OPTION_ID)     REFERENCES OPTION_VALUE(OPTION_ID)
        
);

DROP SEQUENCE SEQ_ITEM_TBL;
CREATE SEQUENCE SEQ_ITEM_TBL;

DROP TABLE OPTION_TYPE;
CREATE TABLE OPTION_TYPE
(
    OPTION_TYPE_ID       NUMBER CONSTRAINT OPTION_TYPE_ID PRIMARY KEY,
    OPTION_TYPE_NAME     VARCHAR2(50)      UNIQUE
);

DROP SEQUENCE SEQ_OPTION_TYPE;
CREATE SEQUENCE SEQ_OPTION_TYPE;

DROP TABLE OPTION_CG;
CREATE TABLE OPTION_CG 
    (
        OPTION_CG_ID    NUMBER  CONSTRAINT OPTION_CG_ID PRIMARY KEY,
        OPTION_TYPE_ID  NUMBER,
        OPTION_CG_NAME  VARCHAR2(50) NOT NULL,
        
    FOREIGN KEY(OPTION_TYPE_ID)     REFERENCES OPTION_TYPE(OPTION_TYPE_ID)
    );


DROP SEQUENCE SEQ_OPTION_CG;
CREATE SEQUENCE SEQ_OPTION_CG;


DROP TABLE OPTION_VALUE;
CREATE TABLE OPTION_VALUE 
(
    OPTION_ID           NUMBER          CONSTRAINT OPTION_ID PRIMARY KEY,
    OPTION_TYPE_ID      NUMBER          NOT NULL,
    OPTION_CG_ID        NUMBER          NOT NULL,
    OPTION_VALUE        VARCHAR2(30)    NOT NULL,
    
    FOREIGN KEY(OPTION_CG_ID)          REFERENCES OPTION_CG(OPTION_CG_ID),   
    FOREIGN KEY(OPTION_TYPE_ID)        REFERENCES OPTION_TYPE(OPTION_TYPE_ID)
);

DROP SEQUENCE SEQ_OPTION_VALUE;
CREATE SEQUENCE SEQ_OPTION_VALUE;

DROP TABLE ITEM_OPTION;
CREATE TABLE ITEM_OPTION (
    ITEM_NO             NUMBER                  NOT NULL,
    OPTION_TYPE_ID      NUMBER                  NULL,
    OPTION_CG_ID        NUMBER                  NULL,
    OPTION_ID           NUMBER                  NULL,
    
    PRIMARY KEY (ITEM_NO),
    FOREIGN KEY (ITEM_NO)       REFERENCES ITEM_TBL(ITEM_NO),
    FOREIGN KEY (OPTION_TYPE_ID) REFERENCES OPTION_TYPE(OPTION_TYPE_ID),
    FOREIGN KEY (OPTION_CG_ID)   REFERENCES OPTION_CG(OPTION_CG_ID),
    FOREIGN KEY (OPTION_ID)     REFERENCES OPTION_VALUE(OPTION_ID)
);

