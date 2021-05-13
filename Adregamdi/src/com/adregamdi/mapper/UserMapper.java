package com.adregamdi.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.adregamdi.dto.UserDTO;

public interface UserMapper {
	
	
	@Select("SELECT USER_NAME FROM USER_INFO WHERE USER_ID = #{user_id}")
	String checkID(String user_id);
	
	@Select("SELECT USER_ID FROM USER_INFO WHERE USER_NAME = #{user_name}")
	String checkName(String user_name);
	
	@Insert("INSERT INTO USER_INFO VALUES(USER_INFO_SEQ.NEXTVAL, #{user_name}, #{user_id},  #{user_pw},  #{user_email},  #{user_phone}, 1)")
	void addUserInfo(UserDTO joinUserDTO);
	
	@Select("SELECT USER_NO, USER_NAME, USER_EMAIL, USER_PHONE FROM USER_INFO WHERE USER_ID=#{user_id}")
	UserDTO getLoginUser(UserDTO tmpLoginUserDTO);
	
	@Select("SELECT USER_PW FROM USER_INFO WHERE USER_ID=#{user_id}")
	String getPw(String user_id);
	
	@Select("SELECT USER_ID, USER_NAME, USER_EMAIL, USER_PHONE FROM USER_INFO WHERE USER_NO=#{user_no}")
	UserDTO getModifyUserDTO(int user_idx);

	@Update("UPDATE USER_INFO SET USER_PW=#{user_pw}, USER_EMAIL=#{user_email}, USER_PHONE=#{user_phone} WHERE USER_NO=#{user_no}")
	void modifyUserInfo(UserDTO modifyUserDTO);
	
	@Insert("INSERT INTO USER_INFO VALUES(USER_INFO_SEQ.NEXTVAL, #{user_name}, #{user_id},  null,  #{user_email},  #{user_phone}, 2)")
	void addNaverInfo(UserDTO loginUserDTO);

}
