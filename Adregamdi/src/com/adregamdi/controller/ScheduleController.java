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
		
		List<ScheduleDTO> scheduleList = scheduleService.getScheduleList(page, 4);
		model.addAttribute("scheduleList", scheduleList);
		
		PageDTO pageDTO = scheduleService.getContentCnt(page, 4, 10);
		model.addAttribute("pageDTO", pageDTO);
		
		return "schedule/list";
	}
	
	@GetMapping("/write")
	public String write(@ModelAttribute("writeScheduleDTO") ScheduleDTO writeScheduleDTO, @RequestParam("page") int page, Model model) {
		
		return "schedule/write";
	}
	
	@PostMapping("/write_proc")
	public String write_proc(@ModelAttribute("writeScheduleDTO") ScheduleDTO writeScheduleDTO) {
		
		System.out.println(writeScheduleDTO.getSchedule_start());
		System.out.println(writeScheduleDTO.getSchedule_end());
		
		scheduleService.writeSchedule(writeScheduleDTO);
		
		return "schedule/write_success";
	}
	
	@GetMapping("/read")
	public String read(@RequestParam("schedule_no") int schedule_no, @RequestParam("page") int page, Model model) {
		
		ScheduleDTO scheduleDTO = scheduleService.getSchedule(schedule_no);
		model.addAttribute("scheduleDTO", scheduleDTO);
		model.addAttribute("page", page);
		
		return "schedule/read";
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam("schedule_no") int schedule_no, @RequestParam("page") int page, Model model) {
		
		ScheduleDTO scheduleDTO = scheduleService.getSchedule(schedule_no);
		model.addAttribute("scheduleDTO", scheduleDTO);
		model.addAttribute("page", page);
		
		return "schedule/modify";
	}
	
	@PostMapping("/modify_proc")
	public String modify_proc(@RequestParam("schedule_no") int schedule_no, @RequestParam("page") int page, Model model) {
		return "schedule/modify_success";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("schedule_no") int schedule_no, @RequestParam("page") int page, Model model) {
		
		scheduleService.deleteSchedule(schedule_no);
		model.addAttribute("page", page);
		
		return "schedule/delete";
	}
}
