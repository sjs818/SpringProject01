package com.adregamdi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.adregamdi.dto.PageDTO;
import com.adregamdi.dto.TogetherDTO;
import com.adregamdi.service.TogetherService;

@Controller
@RequestMapping("/together")
public class TogetherController {
	
	@Autowired
	private TogetherService togetherService;
	
	/*@GetMapping("/list")
	public String list(@RequestParam("page") int page, Model model) {
		
		List<TogetherDTO> togetherList = togetherService.getTogetherList(page, 4);
		model.addAttribute("togetherList", togetherList);
		
		PageDTO pageDTO = togetherService.getContentCnt(page, 4, 10);
		model.addAttribute("pageDTO", pageDTO);
		
		return "together/list";
	}
	*/
	@GetMapping("/write")
	public String write(@ModelAttribute("writeTogetherDTO")TogetherDTO writeTogetherDTO,
			@RequestParam("page") int page, Model model) {
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
	
	
	
	
	
	
