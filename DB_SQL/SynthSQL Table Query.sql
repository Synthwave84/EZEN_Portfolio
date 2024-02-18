
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
        ITEM_UUID           VARCHAR2(100)           UNIQUE,
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

        CONSTRAINT  PK_ITEM_NO          PRIMARY KEY(ITEM_NO),
        FOREIGN KEY (CG_CODE)           REFERENCES CG_CODE_TBL(CG_CODE),
        FOREIGN KEY (ITEM_MANUFACTURE)  REFERENCES MANUFACTURE_TAB(MANUFACTURE_CODE)

        
);

DROP SEQUENCE SEQ_ITEM_TBL;
CREATE SEQUENCE SEQ_ITEM_TBL;

-- 옵션 분류 테이블
DROP TABLE OPTION_TYPE;
CREATE TABLE OPTION_TYPE
(
    OPTION_TYPE_ID       NUMBER CONSTRAINT OPTION_TYPE_ID PRIMARY KEY,
    OPTION_TYPE_NAME     VARCHAR2(50)      UNIQUE
);

DROP SEQUENCE SEQ_OPTION_TYPE;
CREATE SEQUENCE SEQ_OPTION_TYPE;

-- 옵션 카테고리 분류
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

-- 옵션값 분류
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
    ITEM_OPTION_ID      NUMBER                  CONSTRAINT PK_ITEM_OPTION_ID PRIMARY KEY,
    ITEM_UUID           VARCHAR2(100)           NOT NULL,
    OPTION_TYPE_ID      NUMBER                  NULL,
    OPTION_CG_ID        NUMBER                  NULL,
    OPTION_ID           NUMBER                  NULL,
    
    FOREIGN KEY (ITEM_UUID)       REFERENCES ITEM_TBL(ITEM_UUID),
    FOREIGN KEY (OPTION_TYPE_ID) REFERENCES OPTION_TYPE(OPTION_TYPE_ID),
    FOREIGN KEY (OPTION_CG_ID)   REFERENCES OPTION_CG(OPTION_CG_ID),
    FOREIGN KEY (OPTION_ID)     REFERENCES OPTION_VALUE(OPTION_ID)
);

DROP SEQUENCE SEQ_ITEM_OPTION;
CREATE SEQUENCE SEQ_ITEM_OPTION;

DROP TABLE CART_TAB;
CREATE TABLE CART_TAB
    (
        CART_NO             NUMBER,
        ITEM_NO             NUMBER          NOT NULL,
        MEMBER_ID           VARCHAR2(15)    NOT NULL,
        CART_AMOUNT         NUMBER          NOT NULL,
        CONSTRAINT PK_CART_NO   PRIMARY KEY(CART_NO) 
    );

DROP SEQUENCE SEQ_CART_TAB;
CREATE SEQUENCE SEQ_CART_TAB;

DROP TABLE ORDER_TAB;
CREATE TABLE ORDER_TAB
    (
        ORD_CODE            NUMBER,               
        MEMBER_ID           VARCHAR2(15)            NOT NULL,
        ORD_NAME            VARCHAR2(30)            NOT NULL,
        ORD_ZIPCODE         CHAR(5)                 NOT NULL,
        ORD_ADDR_BASIC      VARCHAR2(50)            NOT NULL,
        ORD_ADDR_DETAIL     VARCHAR2(50)            NOT NULL,
        ORD_TEL             VARCHAR2(20)            NOT NULL,
        ORD_PRICE           NUMBER                  NOT NULL,  -- 총주문금액. 선택
        ORD_REGDATE         DATE DEFAULT SYSDATE    NOT NULL,
        ORD_STATUS          VARCHAR2(20)            NOT NULL,
        PAYMENT_STATUS      VARCHAR2(20)            NOT NULL
       -- FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER_TAB(MEMBER_ID)
    );
ALTER TABLE ORDER_TAB
ADD CONSTRAINT PK_ORDER_TAB PRIMARY KEY(ORD_CODE);

DROP SEQUENCE SEQ_ORDER_TAB;
CREATE SEQUENCE SEQ_ORDER_TAB;


DROP TABLE ORDETAIL_TAB;
CREATE TABLE ORDETAIL_TAB
    (
        ORD_CODE        NUMBER      NOT NULL REFERENCES ORDER_TAB(ORD_CODE),
        ITEM_NO         NUMBER      NOT NULL REFERENCES ITEM_TBL(ITEM_NO),
        DT_AMOUNT       NUMBER      NOT NULL,
        DT_PRICE        NUMBER      NOT NULL  -- 역정규화
        
    );

ALTER TABLE ORDETAIL_TAB
ADD CONSTRAINT PK_ORDER_TAB PRIMARY KEY(ORD_CODE);

DROP TABLE PAY_TAB;
CREATE TABLE PAY_TAB 
    (
        PAY_CODE            NUMBER          ,-- 일련번호
        ORD_CODE            NUMBER          NOT NULL,    -- 주문번호
        MBSP_ID             VARCHAR2(50)    NOT NULL,    -- 회원ID
        PAY_METHOD          VARCHAR2(50)    NOT NULL,    -- 결제방식
        PAY_DATE            DATE            NULL,        -- 결제일
        PAY_TOT_PRICE       NUMBER          NOT NULL,    -- 결제금액
        PAY_NOBANK_PRICE    NUMBER          NULL,        -- 무통장입금금액
        PAY_NOBANK_USER     VARCHAR2(50)    NULL,        -- 무통장 입금자명
        PAY_NOBANK          VARCHAR2(50)    NULL,        -- 입금은행
        PAY_BANKACCOUNT     VARCHAR2(100)   NULL,
        PAY_MEMO            VARCHAR2(100)   NULL         -- 메모
    );

ALTER TABLE PAY_TAB
ADD CONSTRAINT PK_PAY_TAB PRIMARY KEY(PAY_CODE);

DROP SEQUENCE SEQ_PAY_TAB;
CREATE SEQUENCE SEQ_PAY_TAB;

DROP TABLE REVIEW_TAB;

CREATE TABLE REVIEW_TAB(
        REV_NUM         NUMBER,
        MEMBER_ID         VARCHAR2(15)                NOT NULL,
        ITEM_NO         NUMBER                      NOT NULL,
        REV_CONTENT     VARCHAR2(200)               NOT NULL,
        REV_SCORE       NUMBER                      NOT NULL,
        REV_REGDATE     DATE DEFAULT SYSDATE        NOT NULL,
        FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER_TAB(MEMBER_ID),
        FOREIGN KEY(ITEM_NO) REFERENCES ITEM_TBL(ITEM_NO)
);

ALTER TABLE REVIEW_TAB
ADD CONSTRAINT PK_REVIEW_TBL PRIMARY KEY(REV_NUM);

DROP TABLE REVIEW_TAB;
CREATE SEQUENCE SEQ_REV_TAB;








