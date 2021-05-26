희순이의 데이터베이스 쿼리 ㅎ

---------- 유저 INFO 테이블 ---------------
DROP TABLE user_info PURGE;
CREATE TABLE user_info(
    user_no       INT             NOT NULL,
    user_name     VARCHAR2(20)    NOT NULL, 
    user_id       VARCHAR2(20)    NOT NULL, 
    user_pw       VARCHAR2(150)    NOT NULL, 
    user_email    VARCHAR2(50)    NOT NULL, 
    user_phone    VARCHAR2(13)    NOT NULL,
    CONSTRAINT User_info_pk PRIMARY KEY (user_no)
);

-- 유저 테이블 일부 수정
ALTER TABLE USER_INFO MODIFY(user_id UNIQUE);
ALTER TABLE USER_INFO MODIFY(user_provider NOT NULL);

-- 유저 테이블 시퀀스
CREATE SEQUENCE user_info_SEQ
START WITH 1
INCREMENT BY 1;

---------- 자유게시판 DB --------------
DROP TABLE freedomBoard PURGE;
CREATE TABLE FREEDOMBOARD (
    free_no     NUMBER         CONSTRAINT freedomBoard_pk primary key,
    free_writer number         constraint freedomBoard_fk REFERENCES user_info(user_no),
    free_title  VARCHAR2(300)   not null,
    free_cnt    number         not null,
    free_date   date           not null,
    free_content varchar2(2000) not null
);

----------- 자유게시판 댓글 데이블 --------------
DROP TABLE freedomReply PURGE;
CREATE TABLE freedomReply (
    reply_Num      number         constraint freedomReply_pk Primary Key,
    freedom_Num    number         constraint freedomReplu_fk References FreedomBoard(free_no),
    reply_writer   varchar2(100)  not null,
    reply_content  varchar2(1000) not null,
    reply_date     date           not null
 );
 
-- 댓글 시퀀스
CREATE SEQUENCE freedom_reply_SEQ
START WITH 1
INCREMENT BY 1;

-- 자유게시판 시퀀스
CREATE SEQUENCE CONTENT_CNT_SEQ
START WITH 1
INCREMENT BY 1;

-------------------------------------------------------------------------

DROP TABLE SPOT_INFO PURGE;
CREATE TABLE SPOT_INFO (
    SPOT_IDX        NUMBER          CONSTRAINT SPOT__PK PRIMARY KEY,
    SPOT_NAME       VARCHAR2(20)    NOT NULL,
    LOCAL_NO        NUMBER          NOT NULL,
    THEMA_NO        NUMBER          NOT NULL,
    SPOT_CONTENT    VARCHAR2(500)   NOT NULL,
    SPOT_WRITER     NUMBER,
    SPOT_ADDR       VARCHAR2(100)   NOT NULL,
    SPOT_FILE        VARCHAR2(50) 
);
DROP SEQUENCE SPOT_SEQ;
CREATE SEQUENCE SPOT_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 0;

insert into spot_info values (spot_seq.nextval, '새별오름', 1, 1, '오름 중 가장 유명한 곳', 1, '제주 제주시 애월읍 봉성리 산59-8');

SELECT * FROM SPOT_INFO;
SELECT SPOT_SEQ.NEXTVAL FROM DUAL;
ROLLBACK;

------------------------------------------------------------------------

DROP TABLE scheduling_custom purge;
CREATE TABLE scheduling_custom(
    schedule_no         NUMBER           constraint sche_cus_pk primary key, 
    writer              NUMBER           constraint sche_cus_fk REFERENCES user_info(user_no), 
    start_date          DATE             NOT NULL, 
    end_date            DATE             NOT NULL, 
    schedule_title      VARCHAR2(50)     NOT NULL, 
    schedule_content    VARCHAR2(500)    NOT NULL, 
    schedule_date       DATE             NOT NULL
);

CREATE SEQUENCE schedule_cnt_SEQ
START with 1
increment by 1;

CREATE TABLE together(
    to_no         INT              CONSTRAINT community_co_pk primary key,
    to_writer     INT              CONSTRAINT community_co_fk REFERENCES user_info(user_no),
    to_title      VARCHAR2(50)     NOT NULL, 
    to_cnt        INT              NOT NULL, 
    to_date       DATE             NOT NULL, 
    to_content    VARCHAR2(500)    NOT NULL, 
);

CREATE SEQUENCE community_to_SEQ
START WITH 1
INCREMENT BY 1;

