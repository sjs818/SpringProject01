package com.adregamdi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.xml.sax.SAXException;

import com.adregamdi.api.VisitKoreaAPI;
import com.adregamdi.dto.PageDTO;
import com.adregamdi.dto.PlanDTO;
import com.adregamdi.dto.PlanImgDTO;
import com.adregamdi.dto.UserPlanDTO;
import com.adregamdi.dto.VisitKoreaDTO;
import com.adregamdi.service.ScheduleService;

import net.sf.json.JSONArray;

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
		model.addAttribute("plan_no", scheduleService.getPlanNo());
		
		return "schedule/write";
	}
	
	@PostMapping("/write_proc")
	public String write_proc(@RequestParam("planData") String data, RedirectAttributes redirectAttributes) throws ParseException {
		List<UserPlanDTO> list = scheduleService.convertUserPlan(data);
		for(int i = 0; i < list.size(); i++) {
			scheduleService.insertUserPlan(list.get(i));
		}
		redirectAttributes.addAttribute("plan_no", list.get(0).getPlan_no());
		redirectAttributes.addAttribute("purpose", "write");
		return "redirect:/schedule/writeDetail";
	}
	
	@GetMapping("/writeDetail")
	public String writeDetail(@RequestParam("plan_no") int plan_no, @RequestParam("purpose") String purpose, Model model) {
		PlanDTO planDTO = new PlanDTO();
		String isModify = "N";
		
		planDTO = scheduleService.getPlan(plan_no);
		List<UserPlanDTO> plan = new ArrayList<UserPlanDTO>();
		if(purpose.equals("write")) {
			plan = scheduleService.getUserPlanCreate(plan_no);
			
		}
		
		model.addAttribute("isModify", isModify);
		model.addAttribute("planDTO", planDTO);
		model.addAttribute("plan_no", plan_no);
		model.addAttribute("planTotalDate", plan.get(0).getPlanTotalDate());
		model.addAttribute("planList", JSONArray.fromObject(plan));
		return "schedule/writeDetail";
	}
	
	@PostMapping("/writeDetail_proc")
	public String writeDetail_proc(@RequestParam("schedule") String data) throws ParseException {
		
		List<UserPlanDTO> schedule = scheduleService.convertSchedule(data);
		
		scheduleService.deleteSchedule(schedule.get(0));
		
		for(int i = 0; i < schedule.size(); i++) {
			scheduleService.updateSchedule(schedule.get(i));
		}
		
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
	
	@ResponseBody
	@GetMapping("/keyword")
	public List<VisitKoreaDTO> keyword(@ModelAttribute VisitKoreaDTO visitKoreaDTO, String keyword) throws ParserConfigurationException, SAXException, IOException, InterruptedException {
		
		if(visitKoreaDTO.getPageNo()==null) {
			visitKoreaDTO.setPageNo("1");
		}
		
		if(visitKoreaDTO.getSigunguCode() == null) {
			visitKoreaDTO.setSigunguCode("");
		}
		
		if(visitKoreaDTO.getContentTypeId() == null) {
			visitKoreaDTO.setContentTypeId("");
		}
		return visitKoreaAPI.getKeywordInformation(visitKoreaDTO, keyword);
	}
	
	@ResponseBody
	@PostMapping("/upload")
	public PlanDTO uploadPlanImg(@ModelAttribute PlanImgDTO planImgDTO) throws IllegalStateException, IOException {
		
		scheduleService.uploadPlanImg(planImgDTO);
		scheduleService.updatePlanImg(planImgDTO);
		
		return scheduleService.getPlan(planImgDTO.getPlan_no());
	}
	
	@ResponseBody
	@PostMapping("/update")
	public boolean uploadPlan(@ModelAttribute PlanDTO planDTO) {
				
		return scheduleService.updatePlan(planDTO);
	}
}