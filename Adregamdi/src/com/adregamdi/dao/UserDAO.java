package com.adregamdi.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.dto.UserDTO;
import com.adregamdi.mapper.UserMapper;

@Repository
public class UserDAO {
	
	@Autowired
	private UserMapper userMapper;

	public String checkID(String user_id) {
		String checking_id = userMapper.checkID(user_id);
		return checking_id;
	}

	
	public Integer checkPhone(String user_phone) {
		return userMapper.checkPhone(user_phone);
	}
	
	public void addUserInfo(UserDTO joinUserDTO) {	
		if(joinUserDTO.getUser_provider() != 2) {
			joinUserDTO.setUser_provider(1);
		}
		userMapper.addUserInfo(joinUserDTO);
	}
	

	
	public UserDTO getLoginUserDTO(UserDTO loginUserDTO) {
		UserDTO formDBUserDTO = userMapper.getLoginUser(loginUserDTO);
		
		return formDBUserDTO;
	}
	
	public String getPw(String user_id) {
		return userMapper.getPw(user_id);
	}
	
	
	public UserDTO getModifyUserDTO(int user_no) {
		return userMapper.getModifyUserDTO(user_no);
	}
	
	public void modifyUserInfo(UserDTO modifyUserDTO) {
		userMapper.modifyUserInfo(modifyUserDTO);
	}
	
	
}
