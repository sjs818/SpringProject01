CREATE TABLE user_info
(
    user_no       INT             NOT NULL, 
    user_name     VARCHAR2(20)    NOT NULL, 
    user_id       VARCHAR2(20)    NOT NULL UNIQUE, 
    user_pw       VARCHAR2(100)    NOT NULL, 
    user_email    VARCHAR2(50)    NOT NULL, 
    user_phone    VARCHAR2(13)    NOT NULL, 
    CONSTRAINT user_no_pk PRIMARY KEY (user_no)
);

INSERT INTO USER_INFO VALUES(USER_INFO_SEQ.NEXTVAL, '어드레', 'adre', '123456789!q', 'adre@adre.com', '01012345678');

SELECT USER_NO, USER_NAME, USER_EMAIL, USER_PHONE FROM USER_INFO WHERE USER_ID='adre' AND USER_PW='1234';
SELECT USER_NAME, USER_ID FROM USER_INFO WHERE USER_ID='adre';



DELETE FROM USER_INFO;

commit;

select *from user_info;




CREATE SEQUENCE user_info_SEQ
START WITH 1
INCREMENT BY 1;




DROP TABLE USER_INFO PURGE;


DROP SEQUENCE user_info_SEQ;


COMMENT ON TABLE user_info IS '사용자 테이블';

COMMENT ON COLUMN user_info.user_no IS '회원번호';

COMMENT ON COLUMN user_info.user_name IS '회원이름';

COMMENT ON COLUMN user_info.user_id IS '회원id';

COMMENT ON COLUMN user_info.user_pw IS '회원pw';

COMMENT ON COLUMN user_info.user_email IS 'e-mail';

COMMENT ON COLUMN user_info.user_phone IS '휴대폰번호';
