package com.adregamdi.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.UserDAO;
import com.adregamdi.dto.PlanDTO;
import com.adregamdi.dto.SubscriptionDTO;
import com.adregamdi.dto.TogetherDTO;
import com.adregamdi.dto.UserDTO;

@Service
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	
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
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String dtoPw = userDAO.getPw(tmpLoginUserDTO.getUser_id());
		boolean pwdMatch = encoder.matches(tmpLoginUserDTO.getUser_pw(), dtoPw);
		
		if(dtoPw != null && pwdMatch == true) {
			UserDTO fromDBUserDTO = userDAO.getLoginUserDTO(tmpLoginUserDTO);
			
			loginUserDTO.setUser_no(fromDBUserDTO.getUser_no());
			loginUserDTO.setUser_id(fromDBUserDTO.getUser_id());
			loginUserDTO.setUser_name(fromDBUserDTO.getUser_name());
			loginUserDTO.setUser_email(fromDBUserDTO.getUser_email());
			loginUserDTO.setUser_phone(fromDBUserDTO.getUser_phone());
			loginUserDTO.setUser_provider(fromDBUserDTO.getUser_provider());
			loginUserDTO.setUserLogin(true);
			
			
		}

	}	
	
	

	

	
	public void addUserInfo(UserDTO JoinUserDTO) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(JoinUserDTO.getUser_pw());
		JoinUserDTO.setUser_pw(securePw);
		userDAO.addUserInfo(JoinUserDTO);
	}
	
	
	
	
	
	
	public void getModifyUserDTO(UserDTO modifyUserDTO) {
		UserDTO fromDBUserDTO = userDAO.getModifyUserDTO(loginUserDTO.getUser_no());
		
		modifyUserDTO.setUser_name(fromDBUserDTO.getUser_name());
		modifyUserDTO.setUser_id(fromDBUserDTO.getUser_id());
		modifyUserDTO.setUser_email(fromDBUserDTO.getUser_email());
		modifyUserDTO.setUser_phone(fromDBUserDTO.getUser_phone());
		modifyUserDTO.setUser_no(loginUserDTO.getUser_no());
	}
	
	
	
	public void modifyUserInfo(UserDTO modifyUserDTO) {
		modifyUserDTO.setUser_no(loginUserDTO.getUser_no());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(modifyUserDTO.getUser_pw());
		modifyUserDTO.setUser_pw(securePw);
		userDAO.modifyUserInfo(modifyUserDTO);
	}
	
	
	public void deleteUserInfo(UserDTO deleteUserDTO) {	
		
		if(loginUserDTO.getUser_provider() == 1) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String dtoPw = userDAO.getPw(loginUserDTO.getUser_id());
			boolean pwdMatch = encoder.matches(deleteUserDTO.getUser_pw(), dtoPw);
			
			if(dtoPw != null && pwdMatch == true) {
				deleteUserDTO.setUser_pw(dtoPw);
				userDAO.deleteUserInfo(deleteUserDTO);
			}
		}else if(loginUserDTO.getUser_provider() == 2) {
			userDAO.deleteNaverInfo(deleteUserDTO);
		}
	}

	public List<PlanDTO> getMyPlan(int user_no) {
		return userDAO.getMyPlan(user_no);
	}


	public String getPrivateCount(int user_no) {
		return userDAO.getPrivateCount(user_no);
	}
	
	public String getPublicCount(int user_no) {
		return userDAO.getPublicCount(user_no);
	}

	public List<TogetherDTO> getMyTo(int user_no) {
		return userDAO.getMyTo(user_no);
	}

	public List<SubscriptionDTO> getToNotification(int to_no) {
		return userDAO.getToNotification(to_no);
	}

	public String getMyToCount(int user_no) {
		return userDAO.getMyToCount(user_no);
	}

	public boolean subCancel(int sub_no) {
		return userDAO.subCancel(sub_no) > 0;
	}
	

}