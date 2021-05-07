희순이의 데이터베이스 쿼리 ㅎ

DROP TABLE user_info PURGE;
CREATE TABLE user_info(
    user_no       INT             NOT NULL,
    user_name     VARCHAR2(20)    NOT NULL, 
    user_id       VARCHAR2(20)    NOT NULL, 
    user_pw       VARCHAR2(20)    NOT NULL, 
    user_email    VARCHAR2(50)    NOT NULL, 
    user_phone    VARCHAR2(13)    NOT NULL,
    CONSTRAINT User_info_pk PRIMARY KEY (user_no)
);

CREATE SEQUENCE user_info_SEQ
START WITH 1
INCREMENT BY 1;

INSERT INTO user_info VALUES (user_info_SEQ.nextval, '홍길동', 'Hong', '1111', 'Hong@gmail.com','010-0021-1421');
INSERT INTO user_info VALUES (user_info_SEQ.nextval, '김철수', 'Fallback', '1111', 'Fallback@gmail.com','010-5751-1221');
INSERT INTO user_info VALUES (user_info_SEQ.nextval, '길동이', 'RoadDong', '1111', 'RoadDong@naver.com', '010-9112-1434');

SELECT * FROM user_info;

SELECT F.FREE_no, U.user_id CONTENT_WRITER_ID, F.free_title, F.free_cnt, TO_CHAR(F.free_date, 'YYYY-MM-DD HH24:MI:SS') CONTENT_DATE
FROM FREEDOMBOARD F, USER_INFO U
WHERE F.free_writer = U.user_no;

SELECT F.FREE_NO, U.USER_ID CONTENT_WRITER_ID, TO_CHAR(F.free_date, 'YYYY-MM-DD HH24:MI:SS') CONTENT_DATE, F.Free_title, F.Free_content, F.Free_cnt
FROM USER_INFO U, FREEDOMBOARD F
WHERE U.USER_NO = f.free_writer
AND F.Free_No = 1;

DROP TABLE freedomBoard PURGE;
CREATE TABLE FREEDOMBOARD (
    free_no     NUMBER         CONSTRAINT freedomBoard_pk primary key,
    free_writer number         constraint freedomBoard_fk REFERENCES user_info(user_no),
    free_title  VARCHAR2(300)   not null,
    free_cnt    number         not null,
    free_date   date           not null,
    free_content varchar2(500) not null
);

ALTER TABLE FREEDOMBOARD MODIFY(free_title varchar2(300));

INSERT INTO freedomBoard VALUES (CONTENT_CNT_SEQ.nextval, 1, '자고 일어나니 나라가 망했다', '0', sysdate, '자고 일어나니 이게 나라냐?');
INSERT INTO freedomBoard VALUES (CONTENT_CNT_SEQ.nextval, 2, '철수하자 철수', '0', sysdate, '후퇴후퇴!!!');
INSERT INTO freedomBoard VALUES (CONTENT_CNT_SEQ.nextval, 3, '길동이 등장!!', '0', sysdate, '길동이 길동무가 되어주지');

CREATE SEQUENCE CONTENT_CNT_SEQ
START WITH 1
INCREMENT BY 1;

DROP TABLE SPOT_INFO PURGE;
CREATE TABLE SPOT_INFO(
    spot_idx    NUMBER        CONSTRAINT spot_info_pk primary key,
    spot_name   varchar2(20)  not null,
    local_no    number        not null,
    theme_no    number        not null,
    content     varchar2(500) not null,
    spot_writer number        CONSTRAINT spot_writer_fk References User_info(user_no),
    spot_addr   varchar2(100) not null
);

CREATE SEQUENCE spot_cnt_seq
start with 1 
increment by 1;

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

