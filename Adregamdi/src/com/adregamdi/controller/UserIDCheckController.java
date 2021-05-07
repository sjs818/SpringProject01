package com.adregamdi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.adregamdi.service.UserService;

@RestController
public class UserIDCheckController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/user/checkID/{user_id}")
	public String checkID(@PathVariable String user_id) {
		boolean chck = userService.checkID(user_id);
		return chck+"";
		
	}
	
}
