package com.adregamdi.controller;

import java.util.List;

import javax.annotation.Resource;
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
import com.adregamdi.dto.UserDTO;
import com.adregamdi.service.TogetherService;

@Controller
@RequestMapping("/together")
public class TogetherController {

	@Autowired
	TogetherService togetherService;
	
	@Resource(name="loginUserDTO")
	private UserDTO loginUserDTO;
	
	@GetMapping("/list")
	public String TogetherList(Model model) {
		List<TogetherDTO> contentList = togetherService.getTogetherList();
		model.addAttribute("contentList", contentList);
		return "together/list";
	}
	
	@GetMapping("/delete")
	public String TogetherDelete() {
		return "together/delete";
	}
	
	@GetMapping("/read")
	public String TogetherRead(@RequestParam("content_idx") int content_idx, Model model) {
		TogetherDTO readContentDTO = togetherService.getTogetherContent(content_idx);
		model.addAttribute("readContentDTO", readContentDTO);
		return "together/read";
	}
	
	@GetMapping("/write")
	public String TogetherWrite
	(@ModelAttribute("togetherWriteDTO") TogetherDTO togetherWriteDTO) {
		return "together/write";
	}
	
	@PostMapping("/writeProc")
	public String TogetherWrite_Proc
	(@Valid @ModelAttribute("togetherWriteDTO") TogetherDTO togetherWriteDTO, BindingResult result) {
		if(result.hasErrors())
			return "together/write";
	
		togetherService.InsertTogetherContent(togetherWriteDTO);
		
		return "together/write_success";
	}
	
	@GetMapping("/modify")
	public String TogetherModify
	(@ModelAttribute("TogetherDTO") TogetherDTO togetherModifyDTO, 
	 @RequestParam("content_idx") int content_idx, Model model) {
		
		TogetherDTO TogetherDTO = togetherService.getTogetherContent(content_idx);
		
		togetherModifyDTO.setTo_no(TogetherDTO.getTo_no());
		togetherModifyDTO.setTo_writer(TogetherDTO.getTo_writer());
		togetherModifyDTO.setTo_title(TogetherDTO.getTo_title());
		togetherModifyDTO.setTo_cnt(TogetherDTO.getTo_cnt());
		togetherModifyDTO.setTo_date(TogetherDTO.getTo_date());
		togetherModifyDTO.setTo_content(TogetherDTO.getTo_content());
		
		return "together/modify";
	}
	
	@PostMapping("/modifyProc")
	public String TogetherModify_Proc
	(@Valid @ModelAttribute("togetherModifyDTO") TogetherDTO togetherModifyDTO, BindingResult result) {
		
		togetherService.ModifyTogetherContent(togetherModifyDTO);
		
		return "together/modify_success";
	}
	
}
	
	
	
	
	
	
