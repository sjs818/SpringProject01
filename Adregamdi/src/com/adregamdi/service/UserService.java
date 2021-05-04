package com.adregamdi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.UserDAO;

@Service
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	/*
	 * @Resource(name="loginUserDTO") private UserDTO loginUserDTO;
	 */
	
	public boolean checkID(String user_id) {
		String checking_id = userDAO.checkID(user_id);
		
		if(checking_id == null ) {
			return true;
		}else {
			return false;
		}
		
	}
}
