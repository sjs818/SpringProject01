package com.adregamdi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@GetMapping("/list")
	public String list() {
		return "schedule/list";
	}
	
	@GetMapping("/write")
	public String write() {
		return "schedule/write";
	}
	
	@GetMapping("/read")
	public String read() {
		return "schedule/read";
	}
	
	@GetMapping("/modify")
	public String modify() {
		return "schedule/modify";
	}
	
	@GetMapping("/delete")
	public String delete() {
		return "schedule/delete";
	}
}
