package com.adregamdi.controller;

import java.util.HashMap;

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

import com.adregamdi.dao.UserDAO;
import com.adregamdi.dto.UserDTO;
import com.adregamdi.service.KakaoService;
import com.adregamdi.service.UserService;
import com.adregamdi.validator.UserValidator;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserDAO userDAO;
	
    @Autowired
    private KakaoService kakaoService;
	
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
	
	
    @RequestMapping("/kakao_proc")
    public String kakaoProc(@RequestParam(value = "code", required = false) String code) throws Exception{
        String access_Token = kakaoService.getAccessToken(code);
        System.out.println("#########" + code);
        HashMap<String, Object> kakaoInfo = kakaoService.getUserInfo(access_Token);
        System.out.println("#access_Token# : " + access_Token);
        System.out.println("#userID# : " + kakaoInfo.get("email"));
        System.out.println("#nickName# : " + kakaoInfo.get("nickname"));
        System.out.println(kakaoInfo);
        loginUserDTO.setUser_name((String) kakaoInfo.get("nickname"));
        loginUserDTO.setUser_email((String) kakaoInfo.get("email"));
       
        if(kakaoInfo.get("email") == null) {
        	return "user/login_fail";
        }else {
			loginUserDTO.setUserLogin(true);
        	return "user/login_success";        	
        }
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
		
		String checking_name = userDAO.checkName(joinUserDTO.getUser_name());
		
		if(checking_name == null) {
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
