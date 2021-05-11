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
import org.springframework.web.bind.annotation.RequestParam;

import com.adregamdi.dto.TogetherDTO;
import com.adregamdi.service.TogetherService;

@Controller
@RequestMapping("/together")
public class TogetherController {

	@Autowired
	TogetherService togetherService;
	
	@GetMapping("/list")
	public String BoardList(Model model) {
		List<TogetherDTO> contentList = TogetherService.getToghetherList();
		model.addAttribute("contentList", contentList);
		return "together/list";
	}
	
	@GetMapping("/delete")
	public String BoardDelete() {
		return "together/delete";
	}
	
	@GetMapping("/read")
	public String BoardRead(@RequestParam("content_idx") int content_idx, Model model) {
		TogetherDTO readContentDTO = TogetherService.getTogetherContent(content_idx);
		model.addAttribute("readContentDTO", readContentDTO);
		return "together/read";
	}
	
	@GetMapping("/write")
	public String BoardWrite
	(@ModelAttribute("TogetherWriteDTO") TogetherDTO TogetherDTO) {
		return "together/write";
	}
	
	@PostMapping("/writeProc")
	public String Together_Proc
	(@Valid @ModelAttribute("TogetherDTO") TogetherDTO TogetherDTO, BindingResult result) {
		if(result.hasErrors())
			return "together/write";
		
		TogetherService.InsertTogetherContent(togetherWriteDTO);
		
		return "together/write_success";
	}
	
	@GetMapping("/modify")
	public String BoardModify
	(@ModelAttribute("TogetherDTO") TogetherDTO togetherModifyDTO, 
	 @RequestParam("content_idx") int content_idx, Model model) {
		
		TogetherDTO TogetherDTO = togetherService.getTogetherContent(content_idx);
		
		togetherModifyDTO.setto_no(TogetherDTO.getto_no());
		togetherModifyDTO.setto_writer(TogetherDTO.getto_writher());
		togetherModifyDTO.setto_title(TogetherDTO.getto_title());
		togetherModifyDTO.setto_cnt(TogetherDTO.getto_cnt());
		togetherModifyDTO.setto_date(TogetherDTO.getto_date());
		togetherModifyDTO.setto_content(TogetherDTO.getto_content());
		
		return "together/modify";
	}
	
	@PostMapping("/modifyProc")
	public String BoardModify_Proc
	(@Valid @ModelAttribute("togetherModifyDTO") TogetherDTO togetherModifyDTO, BindingResult result) {
		
		togetherService.ModifytogetherContent(togetherModifyDTO);
		
		return "together/modify_success";
	}
	
}
	
	
	
	
	
	
