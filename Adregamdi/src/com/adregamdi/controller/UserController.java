package com.adregamdi.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mybatis.spring.MyBatisSystemException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.adregamdi.dao.UserDAO;
import com.adregamdi.dto.UserDTO;
import com.adregamdi.service.UserService;
import com.adregamdi.validator.UserValidator;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserDAO userDAO;
	
	@Resource(name="loginUserDTO")
	private UserDTO loginUserDTO;
	
	
	@GetMapping("/login")
	public String login
	(@ModelAttribute("tmpLoginUserDTO") UserDTO tmpLoginUserDTO,
	@RequestParam(value="fail", defaultValue="false") boolean fail,
	Model model)
	{
		model.addAttribute("fail", fail);
		
		return "user/login";
	}
	
	@PostMapping("/login_proc")
	public String loginProc(@Valid @ModelAttribute("tmpLoginUserDTO") UserDTO tmpLoginUserDTO, BindingResult result) {
		
		try {
			if(result.hasErrors()) {
				return "user/login";
			}
			
			userService.getLoginUserDTO(tmpLoginUserDTO);
			
			if(loginUserDTO.isUserLogin() == true) {
				return "user/login_success";
			}else {
				return "user/login_fail";
			}
		} catch (MyBatisSystemException e) {
			e.printStackTrace();
		}
		return "user/login_fail";	
	}
	
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) throws IOException {
		loginUserDTO.setUserLogin(false);
		session.invalidate();
		return "/user/logout";
	}
	
	@GetMapping("/not_login")
	  public String notLogin() {
	  return "user/not_login";
	}
	
	@GetMapping("/active_login")
	public String nullLogin() {
		return "user/active_login";
	}
	
	
	
	
	
	@GetMapping("/join")
	public String join(@ModelAttribute("joinUserDTO") UserDTO joinUserDTO) {
		
		return "user/join";
	}
	
	
	@PostMapping("/join_proc")
	public String joinProc(@Valid @ModelAttribute("joinUserDTO") UserDTO joinUserDTO, BindingResult result) {
		if(result.hasErrors()) {                         
			return "user/join";
		}
		
		String user_phone = joinUserDTO.getUser_phone().replace("-", "");		
		Integer checkPhone = userDAO.checkPhone(user_phone);
		System.out.println("번호확인 : " + checkPhone);
		
		if(checkPhone == null) {
		
			userService.addUserInfo(joinUserDTO);	
		
			return "user/join_success";
		}else {
			return "user/join_fail";
		}
		
	}
	
	
	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyUserDTO") UserDTO modifyUserDTO) {
		userService.getModifyUserDTO(modifyUserDTO);
		return "user/modify";
	}
	
	
	@PostMapping("/modify_proc")
	public String modifyProc(@Valid @ModelAttribute("modifyUserDTO") UserDTO modifyUserDTO, BindingResult result) {
		if(result.hasErrors()) {
			return "user/modify";
		}
		userService.modifyUserInfo(modifyUserDTO);
		return "user/modify_success";
	}
	
	
	
	
	@InitBinder
  public void initBinder(WebDataBinder binder) {
	  	UserValidator validator1 = new UserValidator();
	  	binder.addValidators(validator1);
	  }
}
