package com.adregamdi.service;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.UserDAO;
import com.adregamdi.dto.UserDTO;

@Service
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Resource(name="loginUserDTO") 
	private UserDTO loginUserDTO;
	
	public boolean checkID(String user_id) {
		String checking_id = userDAO.checkID(user_id);
		
		if(checking_id == null ) {
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
			loginUserDTO.setUserLogin(true);
		}
	}	
}