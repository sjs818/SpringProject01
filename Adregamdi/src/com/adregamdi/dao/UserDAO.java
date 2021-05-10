package com.adregamdi.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.dto.UserDTO;
import com.adregamdi.mapper.UserMapper;
import com.adregamdi.service.UserService;

@Repository
public class UserDAO {
	
	@Autowired
	private UserMapper userMapper;

	@Autowired
	private UserService userService;
	
	public String checkID(String user_id) {
		String checking_id = userMapper.checkID(user_id);
		return checking_id;
	}
	
	public void addUserInfo(UserDTO joinUserDTO) {
		userMapper.addUserInfo(joinUserDTO);
	}
	
	public UserDTO getLoginUserDTO(UserDTO loginUserDTO) {
		String inputId = loginUserDTO.getUser_pw();

		UserDTO formDBUserDTO = userMapper.getLoginUser(loginUserDTO);
		
		return formDBUserDTO;
	}
	
}
