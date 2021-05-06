package com.adregamdi.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.adregamdi.dto.UserDTO;

@Controller
@RequestMapping("/user")
public class UserController {

	
	
	@GetMapping("/login")
	public String login
	(@ModelAttribute("tmpLoginUserDTO") UserDTO tmpLoginUserDTO,
	@RequestParam(value="failure", defaultValue="false") boolean failure,
	Model model)
	{
		model.addAttribute("failure", failure);
		
		return "user/login";
	}
	
	@PostMapping("/login_proc")
	public String loginProc(@Valid @ModelAttribute("tmpLoginUserDTO") UserDTO TmpLoginUserDTO, BindingResult result) {
		
		
		
		return null;
		
	}
	
}
