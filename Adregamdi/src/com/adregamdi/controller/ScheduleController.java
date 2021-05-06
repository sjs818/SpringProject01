package com.adregamdi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.adregamdi.dto.PageDTO;
import com.adregamdi.dto.ScheduleDTO;
import com.adregamdi.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/list")
	public String list(@RequestParam("page") int page, Model model) {
		
		List<ScheduleDTO> scheduleList = scheduleService.getScheduleList(page, 12);
		model.addAttribute("scheduleList", scheduleList);
		
		PageDTO pageDTO = scheduleService.getContentCnt(page, 12);
		model.addAttribute("pageDTO", pageDTO);
		
		return "schedule/list";
	}
	
	@GetMapping("/write")
	public String write(@ModelAttribute("writeScheduleDTO") ScheduleDTO writeScheduleDTO) {
		return "schedule/write";
	}
	
	@PostMapping("/write_proc")
	public String write_proc(@ModelAttribute("writeScheduleDTO") ScheduleDTO writeScheduleDTO) {
		
		scheduleService.writeSchedule(writeScheduleDTO);
		
		return "schedule/write_success";
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
