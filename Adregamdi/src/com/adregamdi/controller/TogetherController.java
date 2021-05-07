package com.adregamdi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.adregamdi.dto.TogetherDTO;

@Controller
@RequestMapping("/together")
public class TogetherController {
	

	@GetMapping("/list")
	public String list() {
		return "together/list";
	}
	
	@GetMapping("/write")
	public String write(@ModelAttribute("writeTogetherDTO")TogetherDTO writeTogetherDTO) {
		return "together/write";
	}

	@GetMapping("/delete")
	public String delete() {
		return "together/delete";
	}
	
	@GetMapping("/modify")
	public String modify() {
		return "together/modify";
	}
	
	@GetMapping("/read")
	public String read() {
		return "together/read";
	}		
}
	
	
	
	
	
	
