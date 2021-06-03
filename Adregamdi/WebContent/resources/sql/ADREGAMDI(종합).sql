-- ADREGAMDI --

-- 1. 회원정보 --

-- (1) 테이블 생성 --
DROP TABLE USER_INFO PURGE;
CREATE TABLE USER_INFO
(
    USER_NO       NUMBER          CONSTRAINT USER_INFO_PK PRIMARY KEY, 
    USER_NAME     VARCHAR2(15), 
    USER_ID       VARCHAR2(50)    UNIQUE, 
    USER_PW       VARCHAR2(100), 
    USER_EMAIL    VARCHAR2(50)    NOT NULL, 
    USER_PHONE    VARCHAR2(15)    NOT NULL, 
    USER_PROVIDER NUMBER          NOT NULL
);

-- (2) 시퀀스 생성 --
DROP SEQUENCE USER_INFO_SEQ;
CREATE SEQUENCE USER_INFO_SEQ
START WITH 1
INCREMENT BY 1;

-- (3) 특이사항 --

-- 회원탈퇴를 위해 반드시 필요한 쿼리문

-- 외래키 컬럼 삭제
ALTER TABLE [각 게시판 테이블] DROP CONSTRAINT [외래키 이름];

-- ON DELETE CASCADE 를 적용한 외래키 재생성
ALTER TABLE [각 게시판 테이블] ADD CONSTRAINT [외래키 이름] FOREIGN KEY ([외래키 자식 컬럼])
REFERENCES USER_INFO(user_no) ON DELETE CASCADE;

-- PROVIDER(0) : 관리자(ADMINISTRATOR)

-- 2. 공지사항 --

-- (1) 테이블 생성 --
DROP TABLE NOTICE PURGE;
CREATE TABLE NOTICE(
    NOTICE_NO        NUMBER           CONSTRAINT NOTICE_PK PRIMARY KEY, 
    NOTICE_USER_NO   NUMBER           CONSTRAINT NOTICE_FK REFERENCES USER_INFO(USER_NO),
    NOTICE_TITLE     VARCHAR2(100)    NOT NULL, 
    NOTICE_CNT       NUMBER           NOT NULL, 
    NOTICE_DATE      DATE             NOT NULL, 
    NOTICE_CONTENT   VARCHAR2(4000)   NOT NULL
);

-- (2) 시퀀스 생성 --
DROP SEQUENCE NOTICE_SEQ;
CREATE SEQUENCE NOTICE_SEQ
START WITH 1
INCREMENT BY 1;


-- 3. 자유게시판 --

-- (1) 테이블 생성 --

-- FREEDOMBOARD
DROP TABLE FREEDOMBOARD PURGE;
CREATE TABLE FREEDOMBOARD (
    FREE_NO        NUMBER            CONSTRAINT FREEDOMBOARD_PK PRIMARY KEY,
    FREE_WRITER    NUMBER            CONSTRAINT FREEDOMBOARD_FK REFERENCES USER_INFO(USER_NO),
    FREE_TITLE     VARCHAR2(300)     NOT NULL,
    FREE_CNT       NUMBER            NOT NULL,
    FREE_DATE      DATE              NOT NULL,
    FREE_CONTENT   VARCHAR2(4000)    NOT NULL
);

-- FREEDOMREPLY
DROP TABLE FREEDOMREPLY PURGE;
CREATE TABLE FREEDOMREPLY (
    REPLY_NUM       NUMBER           CONSTRAINT FREEDOMREPLY_PK PRIMARY KEY,
    FREEDOM_NUM     NUMBER           CONSTRAINT FREEDOMREPLY_FK REFERENCES FREEDOMBOARD(FREE_NO),
    REPLY_WRITER    VARCHAR2(100)    NOT NULL,
    REPLY_CONTENT   VARCHAR2(1000)   NOT NULL,
    REPLY_DATE      DATE             NOT NULL
);

-- (2) 시퀀스 생성 --

DROP SEQUENCE FREEDOM_REPLY_SEQ;
CREATE SEQUENCE FREEDOM_REPLY_SEQ
START WITH 1
INCREMENT BY 1;

DROP SEQUENCE CONTENT_CNT_SEQ;
CREATE SEQUENCE CONTENT_CNT_SEQ
START WITH 1
INCREMENT BY 1;


-- 4. 여행지 --

select rownum, like_idx, content_id, like_cnt, review_cnt 
from (select * from spot_info order by like_cnt desc)
where rownum <= 3;


-- (1) 테이블 생성 --

-- SPOT_INFO
DROP TABLE SPOT_INFO PURGE;
CREATE TABLE SPOT_INFO (
    LIKE_IDX     NUMBER         CONSTRAINT LIKE_PK PRIMARY KEY,
    CONTENT_ID   VARCHAR2(10)   NOT NULL,
    LIKE_CNT     NUMBER,
    REVIEW_CNT   NUMBER
);

-- REVIEW_INFO
DROP TABLE REVIEW_INFO PURGE;
CREATE TABLE REVIEW_INFO (
    REVIEW_IDX       NUMBER          CONSTRAINT REVIEW_PK PRIMARY KEY,
    CONTENT_ID       VARCHAR2(10)    NOT NULL,
    USER_NO          NUMBER          CONSTRAINT REVIEW_FK2 REFERENCES USER_INFO(USER_NO),
    USER_NAME        VARCHAR2(15)    NOT NULL,
    REVIEW_DATE      VARCHAR2(100)   NOT NULL,
    REVIEW_CONTENT   VARCHAR2(200)   NOT NULL
);

-- (2) 시퀀스 생성 --

DROP SEQUENCE SPOT_SEQ;
CREATE SEQUENCE SPOT_SEQ
START WITH 1
INCREMENT BY 1;

DROP SEQUENCE REVIEW_SEQ;
CREATE SEQUENCE REVIEW_SEQ
START WITH 1
INCREMENT BY 1;

-- 5. 여행 일정 만들기 --

-- (1) 테이블 생성 --

-- PLAN
DROP TABLE PLAN PURGE;
CREATE TABLE PLAN (
    PLAN_NO        NUMBER           CONSTRAINT PLAN_PK PRIMARY KEY,
    USER_NO        NUMBER           CONSTRAINT PLAN_FK REFERENCES USER_INFO(USER_NO),
    PLAN_TITLE     VARCHAR2(200)    NOT NULL,
    PLAN_INFO      VARCHAR2(1000)   NOT NULL,
    PLAN_IMG       VARCHAR(300)     NOT NULL,
    PLAN_PRIVATE   VARCHAR(1)       DEFAULT 'N'
);

-- PLAN_IMG
DROP TABLE PLAN_IMG PURGE;
CREATE TABLE PLAN_IMG (
    PLAN_NO    NUMBER          CONSTRAINT PLAN_IMG_FK REFERENCES PLAN(PLAN_NO),
    USER_NO    NUMBER          NOT NULL,
    PLAN_IMG   VARCHAR2(300)   NOT NULL,
    REGDATE    DATE            NOT NULL
);

-- USER_PLAN
DROP TABLE USER_PLAN PURGE;
CREATE TABLE USER_PLAN (
    PLAN_NO          NUMBER           CONSTRAINT USER_PLAN_FK REFERENCES PLAN(PLAN_NO),
    USER_NO          NUMBER,
    TITLE            VARCHAR2(200),
    CONTENTID        VARCHAR2(10),
    CONTENTTYPEID    VARCHAR2(5),
    ADDR             VARCHAR2(200),
    IMG_SRC          VARCHAR2(300),
    MAPX             VARCHAR2(20),
    MAPY             VARCHAR2(20),
    PLANDATE         VARCHAR2(30),
    PLANDAY          VARCHAR2(30),
    PLANTOTALDATE    VARCHAR2(30),
    STARTDATE        VARCHAR2(20),
    ENDDATE          VARCHAR2(20),
    DESCRIPT         VARCHAR2(1000), 
    IS_INSERTAFTER   VARCHAR(1)       DEFAULT 'N',
    ISACC            VARCHAR(1)       DEFAULT 'N'
);

-- (2) 시퀀스 생성 --

DROP SEQUENCE PLAN_SEQ;
CREATE SEQUENCE PLAN_SEQ
START WITH 1
INCREMENT BY 1;

-- 6. 동행 게시판

-- (1) 테이블 생성 --

-- TOGETHER
DROP TABLE TOGETHER PURGE;
CREATE TABLE TOGETHER(
    TO_NO        INT              CONSTRAINT TOGETHER_PK PRIMARY KEY,
    TO_WRITER    INT              CONSTRAINT TOGETHER_FK REFERENCES USER_INFO(USER_NO),
    TO_TITLE     VARCHAR2(300)    NOT NULL, 
    TO_CNT       NUMBER           NOT NULL, 
    TO_DATE      DATE             NOT NULL, 
    TO_CONTENT   VARCHAR2(4000)   NOT NULL
);

-- TOGETHERREPLY
DROP TABLE TOGETHERREPLY PURGE;
CREATE TABLE TOGETHERREPLY (
    REPLY_NUM       NUMBER           CONSTRAINT TOGETHERREPLY_PK PRIMARY KEY,
    TOGETHER_NUM    NUMBER           CONSTRAINT TOGETHERREPLY_FK REFERENCES TOGETHER(TO_NO),
    REPLY_WRITER    VARCHAR2(100)    NOT NULL,
    REPLY_CONTENT   VARCHAR2(1000)   NOT NULL,
    REPLY_DATE      DATE             NOT NULL
);

-- (2) 시퀀스 생성 --

DROP SEQUENCE TOGETHER_SEQ;
CREATE SEQUENCE TOGETHER_SEQ
START WITH 1
INCREMENT BY 1;

DROP SEQUENCE TOGETHER_REPLY_SEQ;
CREATE SEQUENCE TOGETHER_REPLY_SEQ
START WITH 1
INCREMENT BY 1;.

select rownum, like_idx, content_id, like_cnt, review_cnt 
from (select * from spot_info order by like_cnt desc)
where rownum <= 3;

select * from user_plan;
select * from plan;

DROP TABLE TOGETHER PURGE;
create table together(

    to_no       NUMBER              constraint together_pk primary key,                      -- 게시글번호
    to_writer_no   number           constraint together_fk1 references user_info(user_no),   -- 회원번호
    to_writer   varchar2(50)        constraint together_fk2 references user_info(user_id),   -- 회원번호
    to_title    varchar2(300)       not null,                                                -- 공고제목   
    to_place    varchar2(300)       not null,                                                -- 여행장소    
    to_place_name varchar2(100)     not null,
    to_content  varchar2(4000)      not null,                                                -- 공고문
    to_date     date                not null,                                                -- 작성날짜   
    to_curr     number              DEFAULT '1',                                            -- 현재인원    
    to_total    number              not null,                                                -- 모집인원   
    to_meet     varchar2(100)       not null,                                                -- 여행날짜   
    to_state    number              not null                                                 -- 공고현황   
);
        
SELECT * FROM TOGETHER;
commit;

-- TOGETHERREPLY
DROP TABLE TOGETHERREPLY PURGE;
DROP TABLE TOGETHER_REPLY PURGE;
CREATE TABLE TOGETHERREPLY (
    REPLY_NUM       NUMBER           CONSTRAINT TOGETHERREPLY_PK PRIMARY KEY,
    TOGETHER_NUM    NUMBER           CONSTRAINT TOGETHERREPLY_FK REFERENCES TOGETHER(TO_NO),
    REPLY_WRITER    VARCHAR2(100)    NOT NULL,
    REPLY_CONTENT   VARCHAR2(1000)   NOT NULL,
    REPLY_DATE      DATE             NOT NULL
);


drop sequence together_seq;
create sequence together_seq
start with 1
increment by 1;

select * from together;

insert into together values (together_seq.nextval, 1, '휴애리자연생활공원 가실 분', '322836', '6월 6일에 휴애리 자연생활농원 놀러가실 분 구합니다!!', sysdate, 1, 3, sysdate, 0); 
SELECT T.TO_NO, U.USER_NO TO_WRITER, U.USER_ID TO_ID, TO_CHAR(T.TO_DATE, 'YYYY-MM-DD HH24:MI:SS') TO_DATE, T.TO_TITLE, T.TO_CONTENT, T.TO_CURR, T.TO_TOTAL, T.TO_MEET, T.TO_STATE FROM USER_INFO U, TOGETHER T WHERE U.USER_NO = T.TO_WRITER AND T.TO_NO = 1;
commit;

SELECT TO_NO, TO_WRITER_NO, TO_WRITER, TO_TITLE, TO_PLACE, TO_PLACE_NAME, TO_CONTENT, TO_CHAR(TO_DATE, 'YYYY-MM-DD HH24:MI') TO_DATE, TO_CURR, TO_TOTAL, TO_MEET, TO_STATE FROM TOGETHER WHERE TO_NO = 1;

DROP TABLE SUBSCRIPTION PURGE;
CREATE TABLE SUBSCRIPTION (
    sub_no          NUMBER  CONSTRAINT SUBSCRIPTION_PK PRIMARY KEY,
    to_no           NUMBER constraint SUBSCRIPTION_FK references TOGETHER(to_no),
    to_writer_no    NUMBER,
    sub_message     VARCHAR2(500),
    sub_writer      NUMBER,
    sub_status      VARCHAR(1) DEFAULT '0',
    sub_date        DATE
);

drop sequence SUBSCRIPTION_seq;
create sequence SUBSCRIPTION_seq
start with 1
increment by 1;