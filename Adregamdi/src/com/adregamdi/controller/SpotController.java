package com.adregamdi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.adregamdi.dto.SpotDTO;

@Controller
@RequestMapping("/spot")
public class SpotController {

	@GetMapping("/local_main")
	public String localMain() {
		return "spot/local_main";
	}
	
	@GetMapping("/local_detail")
	public String localDetail(@RequestParam("spot_no") int spot_no) {
		return "spot/local_detail";
	}
	
	@GetMapping("/thema")
	public String thema() {
		return "spot/thema";
	}
	
	@GetMapping("/write")
	public String spotWrite(@ModelAttribute("writeSpotDTO") SpotDTO writeSpotDTO) {
		return "spot/write";
	}
}
