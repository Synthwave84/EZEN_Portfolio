
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
		  
	    BNO    NUMBER,                             -- 글번호
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


