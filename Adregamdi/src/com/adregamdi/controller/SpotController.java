package com.adregamdi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.adregamdi.dto.SpotDTO;
import com.adregamdi.service.SpotService;

@Controller
@RequestMapping("/spot")
public class SpotController {
	
	@Autowired
	SpotService spotService;

	@GetMapping("/local_main")
	public String localMain() {
		return "spot/local_main";
	}
	
	@GetMapping("/local_detail")
	public String localDetail(@RequestParam("local_no") int local_no) {
		return "spot/local_detail";
	}
	
	@GetMapping("/thema_main")
	public String themaMain() {
		return "spot/thema_main";
	}
	
	@GetMapping("/thema_detail")
	public String themaDetail(@RequestParam("thema_no") int thema_no) {
		return "spot/thema_detail";
	}
	
	@GetMapping("/thema")
	public String thema() {
		return "spot/thema";
	}
	
	@GetMapping("/write")
	public String write(@ModelAttribute("spotDTO") SpotDTO writeSpotDTO ) {
		
		
		return "spot/write";
	}
	
	@PostMapping("/write_proc")
	public String spotWriteProc(@ModelAttribute("spotDTO") SpotDTO writeSpotDTO, BindingResult result) {
		
		if(result.hasErrors()) {
			return "spot/write";
		}
		
		spotService.addSpotInfo(writeSpotDTO);
		
		return "spot/success";
	}
	
	@GetMapping("/read") 
	public String spotRead(){
		return "spot/read";
	}
	
	@GetMapping("/modify")
	public String spotModify() {
		return "spot/modify";
	}
	
	@GetMapping("/delete") 
	public String spotDelete() {
		return "spot/delete";
	}
	
	
}
