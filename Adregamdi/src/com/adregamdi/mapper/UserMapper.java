package com.adregamdi.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.adregamdi.dto.UserDTO;

public interface UserMapper {
	
	
	@Select("SELECT USER_NAME FROM USER_INFO WHERE USER_ID = #{user_id}")
	String checkID(String user_id);
	

	@Select("SELECT USER_NO FROM USER_INFO WHERE USER_PHONE = #{user_phone}")
	Integer checkPhone(String user_phone);
	
	@Insert("INSERT INTO USER_INFO VALUES(USER_INFO_SEQ.NEXTVAL, #{user_name}, #{user_id},  #{user_pw},  #{user_email},  #{user_phone}, #{user_provider})")
	void addUserInfo(UserDTO joinUserDTO);

	@Select("SELECT USER_NO, USER_NAME, USER_EMAIL, USER_PHONE FROM USER_INFO WHERE USER_ID=#{user_id}")
	UserDTO getLogin(UserDTO loginUserDTO);
	
	@Select("SELECT USER_NO, USER_NAME, USER_EMAIL, USER_PHONE, USER_PROVIDER FROM USER_INFO WHERE USER_ID=#{user_id}")
	UserDTO getLoginUser(UserDTO tmpLoginUserDTO);
	
	@Select("SELECT USER_PW FROM USER_INFO WHERE USER_ID=#{user_id}")
	String getPw(String user_id);
	
	@Select("SELECT USER_ID, USER_NAME, USER_EMAIL, USER_PHONE FROM USER_INFO WHERE USER_NO=#{user_no}")
	UserDTO getModifyUserDTO(int user_idx);

	@Update("UPDATE USER_INFO SET USER_PW=#{user_pw}, USER_EMAIL=#{user_email}, USER_PHONE=#{user_phone} WHERE USER_NO=#{user_no}")
	void modifyUserInfo(UserDTO modifyUserDTO);
	
	@Delete("DELETE FROM USER_INFO WHERE user_no in(SELECT user_no FROM user_info WHERE user_id=#{user_id} AND user_pw=#{user_pw})")
	void deleteUserInfo(UserDTO deleteUserDTO);

	@Delete("DELETE FROM USER_INFO WHERE user_no in(SELECT user_no FROM user_info WHERE user_email=#{user_email} AND user_phone=#{user_phone})")
	void deleteNaverInfo(UserDTO deleteUserDTO);
	
}
