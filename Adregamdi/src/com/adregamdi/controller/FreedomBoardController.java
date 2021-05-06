package com.adregamdi.controller;


import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.adregamdi.dto.FreedomBoardDTO;
import com.adregamdi.service.FreedomBoardService;

@Controller
@RequestMapping("/freedom")
public class FreedomBoardController {

	@Autowired
	FreedomBoardService freedomBoardService;
	
	@GetMapping("/list")
	public String BoardList(Model model) {
		List<FreedomBoardDTO> contentList = freedomBoardService.getFreedomBoardList();
		model.addAttribute("contentList", contentList);
		return "freedom/list";
	}
	
	@GetMapping("/delete")
	public String BoardDelete() {
		return "freedom/delete";
	}
	
	@GetMapping("/read")
	public String BoardRead() {
		return "freedom/read";
	}
	
	@GetMapping("/write")
	public String BoardWrite() {
		return "freedom/write";
	}
	
	@PostMapping("/write_proc")
	public String BoardWrite_Proc
	(@Valid @ModelAttribute("FreedomWriteDTO") FreedomBoardDTO FreedomWriteDTO, BindingResult result) {
		if(result.hasErrors())
			return "freedom/write";
		
		return "freedom/write_proc";
	}
	
	@GetMapping("/modify")
	public String BoardModify() {
		return "freedom/modify";
	}
	
	
}
