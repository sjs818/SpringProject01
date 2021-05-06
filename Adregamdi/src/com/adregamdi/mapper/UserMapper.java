package com.adregamdi.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.adregamdi.dto.UserDTO;

public interface UserMapper {
	
	
	@Select("SELECT USER_NAME FROM USER_INFO WHERE USER_ID=#{user_id}")
	String checkID(String user_id);
	
	@Insert("INSERT INTO USER_INFO VALUES(USER_INFO_SEQ.NEXTVAL, #{user_name}, #{user_id},  #{user_pw},  #{user_email},  #{user_phone})")
	void addUserInfo(UserDTO joinUserDTO);
	
	@Select("SELECT USER_NO, USER_NAME FROM USER_INFO WHERE USER_ID=#{user_id} AND USER_PW=#{user_pw}")
	UserDTO getLoginUser(UserDTO tmpLoginUserDTO);
	
	
}
