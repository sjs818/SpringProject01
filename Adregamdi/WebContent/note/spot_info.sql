DROP TABLE SPOT_INFO PURGE;
CREATE TABLE SPOT_INFO (
    SPOT_IDX        NUMBER          CONSTRAINT SPOT__PK PRIMARY KEY,
    SPOT_NAME       VARCHAR2(50)    NOT NULL,
    LOCAL_NO        NUMBER          NOT NULL,
    THEMA_NO        NUMBER          NOT NULL,
    SPOT_CONTENT    VARCHAR2(500)   NOT NULL,
    SPOT_WRITER     NUMBER,
    SPOT_ADDR       VARCHAR2(100)   NOT NULL,
    SPOT_FILE        VARCHAR2(50),
    SPOT_CNT        NUMBER,
    SPOT_LIKE       NUMBER
);

DROP SEQUENCE SPOT_SEQ;
CREATE SEQUENCE SPOT_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 0;

insert into spot_info values (spot_seq.nextval, '새별오름', 1, 1, '오름 중 가장 유명한 곳', 1, '제주 제주시 애월읍 봉성리 산59-8', null);
UPDATE SPOT_INFO SET spot_name = '새별오름', local_no = 1, thema_no = 1, spot_content = '유명한 곳', spot_writer=1, spot_addr='제주 제주시 애월읍 봉성리 산59-8', spot_file='124' 
WHERE spot_idx = 1;

SELECT * FROM SPOT_INFO;
SELECT SPOT_SEQ.NEXTVAL FROM DUAL;
ROLLBACK;