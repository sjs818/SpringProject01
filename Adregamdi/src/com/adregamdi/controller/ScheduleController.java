package com.adregamdi.controller;

import java.io.IOException;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import com.adregamdi.api.VisitKoreaAPI;
import com.adregamdi.dto.PageDTO;
import com.adregamdi.dto.PlanDTO;
import com.adregamdi.dto.ScheduleDTO;
import com.adregamdi.dto.VisitKoreaDTO;
import com.adregamdi.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private VisitKoreaAPI visitKoreaAPI;
	
	@GetMapping("/list")
	public String list(@RequestParam("page") int page, Model model) {
		
		PageDTO pageDTO = scheduleService.getContentCnt(page, 4, 10);
		model.addAttribute("pageDTO", pageDTO);
		
		return "schedule/list";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute PlanDTO planDTO, @RequestParam String plan_date, @RequestParam String plan_term, Model model) {
		
		scheduleService.createPlan(planDTO);
		
		model.addAttribute("plan_title", planDTO.getPlan_title());
		model.addAttribute("plan_date",  plan_date);
		model.addAttribute("plan_term", plan_term);
		model.addAttribute("planNo", scheduleService.getPlanNo());
		
		return "schedule/write";
	}
	
	@PostMapping("/write_proc")
	public String write_proc(@ModelAttribute("writeScheduleDTO") ScheduleDTO writeScheduleDTO) {
		
		System.out.println(writeScheduleDTO.getSchedule_start());
		System.out.println(writeScheduleDTO.getSchedule_end());
		
		scheduleService.writeSchedule(writeScheduleDTO);
		
		return "schedule/write_success";
	}
	
	@ResponseBody
	@GetMapping("/information")
	public List<VisitKoreaDTO> information(@ModelAttribute VisitKoreaDTO visitKoreaDTO, Model model) throws ParserConfigurationException, SAXException, IOException, InterruptedException {
		
		if(visitKoreaDTO.getPageNo() == null) {
			visitKoreaDTO.setPageNo("1");
		}
		
		if(visitKoreaDTO.getSigunguCode() == null) {
			visitKoreaDTO.setSigunguCode("");
		}
		
		if(visitKoreaDTO.getContentTypeId() == null) {
			visitKoreaDTO.setContentTypeId("");
		}
		
		int totalCount = visitKoreaAPI.getTotalCount(visitKoreaDTO.getContentTypeId(), visitKoreaDTO.getSigunguCode());
		
		return visitKoreaAPI.getInformation(visitKoreaDTO, totalCount);
	}
	
	@ResponseBody
	@GetMapping("/detail")
	public List<String> detail(@ModelAttribute VisitKoreaDTO visitKoreaDTO) throws ParserConfigurationException, SAXException, IOException {
		return visitKoreaAPI.getEachInformation(visitKoreaDTO);
	}
	
	@GetMapping("/guide")
	public String guide(@ModelAttribute VisitKoreaDTO visitKoreaDTO, Model model) {
		model.addAttribute("contentId", visitKoreaDTO.getContentId());
		model.addAttribute("contentTypeId", visitKoreaDTO.getContentTypeId());
		return "schedule/detail";
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
