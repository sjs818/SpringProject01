package com.adregamdi.controller;

import javax.annotation.Resource;
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

import com.adregamdi.dto.UserDTO;
import com.adregamdi.service.UserService;
import com.adregamdi.validator.UserValidator;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
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
	public String logout() {
		loginUserDTO.setUserLogin(false);
		return "/user/logout";
	}
	
	@GetMapping("/not_login")
	  public String notLogin() {
	  return "user/not_login";
	}
	
	@GetMapping("/null_login")
	public String nullLogin() {
		return "user/null_login";
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
		userService.addUserInfo(joinUserDTO);
		
		return "user/join_success";		
	}
	
	
	
	
	
	
	
	@InitBinder
  public void initBinder(WebDataBinder binder) {
	  	UserValidator validator1 = new UserValidator();
	  	binder.addValidators(validator1);
	  }
}
