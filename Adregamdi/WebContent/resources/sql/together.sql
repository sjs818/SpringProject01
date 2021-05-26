-- together 테이블 삭제
DROP TABLE TOGETHER PURGE;

-- together SEQ 삭제
DROP SEQUENCE TOGETHER_SEQ;

-- together 테이블 생성
CREATE TABLE together(
    to_no         INT              CONSTRAINT together_pk primary key,
    to_writer     INT              CONSTRAINT together_fk REFERENCES user_info(user_no),
    to_title      VARCHAR2(50)     NOT NULL, 
    to_cnt        INT              NOT NULL, 
    to_date       DATE             NOT NULL, 
    to_content    VARCHAR2(500)    NOT NULL
);

-- together SEQ
CREATE SEQUENCE together_SEQ
START WITH 1
INCREMENT BY 1;
