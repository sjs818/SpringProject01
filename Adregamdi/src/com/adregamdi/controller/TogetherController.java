package com.adregamdi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TogetherController {
	
	@RequestMapping("/together")

	@GetMapping("/list")
	public String list() {
		return "together/list";
	}

	@GetMapping("/write")
	public String write() {
		return "together/list";
	}

	@GetMapping("/delete")
	public String delete() {
		return "together/list";
	}
	
	@GetMapping("/modify")
	public String modify() {
		return "together/modify";
	}
	
}
	
	
	
	
	
	
