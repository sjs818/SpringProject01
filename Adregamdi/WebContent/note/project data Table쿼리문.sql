DROP TABLE user_info PURGE;
CREATE TABLE user_info(
    user_no       INT             NOT NULL,
    user_name     VARCHAR2(20)    NOT NULL, 
    user_id       VARCHAR2(20)    NOT NULL, 
    user_pw       VARCHAR2(20)    NOT NULL, 
    user_email    VARCHAR2(50)    NOT NULL, 
    user_phone    INT             NOT NULL,
    CONSTRAINT User_info_pk PRIMARY KEY (user_no)
);

CREATE SEQUENCE user_info_SEQ
START WITH 1
INCREMENT BY 1;

DROP TABLE freedomBoard PURGE;
CREATE TABLE FREEDOMBOARD (
    free_no     NUMBER         CONSTRAINT freedomBoard_pk primary key,
    free_writer number         constraint freedomBoard_fk REFERENCES user_info(user_no),
    free_title  VARCHAR2(50)   not null,
    free_cnt    number         not null,
    free_date   date           not null,
    free_content varchar2(500) not null
);

CREATE SEQUENCE CONTENT_CNT_SEQ
START WITH 1
INCREMENT BY 1;

DROP TABLE SPOT_INFO;
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

CREATE TABLE community_to(
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

