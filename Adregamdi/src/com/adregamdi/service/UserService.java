package com.adregamdi.service;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.UserDAO;
import com.adregamdi.dto.UserDTO;
import com.adregamdi.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private UserMapper userMapper;
	
	@Resource(name="loginUserDTO") 
	private UserDTO loginUserDTO;
	
	public boolean checkID(String user_id) {
		String checking_id = userDAO.checkID(user_id);
		
		if(checking_id == null) {
			return true;
		}else {
			return false;
		}
		
	}

	public void getLoginUserDTO(UserDTO tmpLoginUserDTO) {
		UserDTO fromDBUserDTO = userDAO.getLoginUserDTO(tmpLoginUserDTO);
		
		if(fromDBUserDTO != null) {
			loginUserDTO.setUser_no(fromDBUserDTO.getUser_no());
			loginUserDTO.setUser_name(fromDBUserDTO.getUser_name());
			loginUserDTO.setUser_email(fromDBUserDTO.getUser_email());
			loginUserDTO.setUser_phone(fromDBUserDTO.getUser_phone());
			loginUserDTO.setUserLogin(true);
		}
	}	
	
	
	
	/*
	 * public void addUserInfo(UserDTO JoinUserDTO) {
	 * userDAO.addUserInfo(JoinUserDTO); }
	 */
	

	
	public void addUserInfo(UserDTO user) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(user.getUser_pw());
		user.setUser_pw(securePw);
		userMapper.addUserInfo(user);
	}
	
	
	
	
}