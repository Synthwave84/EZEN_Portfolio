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

SELECT * FROM MEMBER_TAB;