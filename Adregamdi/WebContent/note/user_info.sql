CREATE TABLE user_info
(
    user_no       INT              NOT NULL, 
    user_name     VARCHAR2(15)     , 
    user_id       VARCHAR2(50)     unique, 
    user_pw       VARCHAR2(100)    , 
    user_email    VARCHAR2(50)     NOT NULL, 
    user_phone    VARCHAR2(15)     NOT NULL, 
    user_provider INT              NOT NULL,
    CONSTRAINT user_info_pk PRIMARY KEY (user_no)
);




CREATE SEQUENCE user_info_SEQ
START WITH 1
INCREMENT BY 1;




DROP TABLE USER_INFO PURGE;


DROP SEQUENCE user_info_SEQ;




-- 회원탈퇴를 위해 반드시 필요한 쿼리문
ALTER TABLE FREEDOMBOARD DROP CONSTRAINT freedomBoard_fk;
ALTER TABLE FREEDOMBOARD ADD CONSTRAINT freedomBoard_fk FOREIGN KEY (free_writer)
REFERENCES USER_INFO(user_no) ON DELETE CASCADE;