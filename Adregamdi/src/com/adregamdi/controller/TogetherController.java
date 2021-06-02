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
import org.springframework.web.bind.annotation.ResponseBody;

import com.adregamdi.api.VisitKoreaAPI;
import com.adregamdi.dto.PageDTO;
import com.adregamdi.dto.TogetherDTO;
import com.adregamdi.dto.TogetherReplyDTO;
import com.adregamdi.dto.UserDTO;
import com.adregamdi.dto.VisitKoreaDTO;
import com.adregamdi.service.TogetherService;

@Controller
@RequestMapping("/together")
public class TogetherController {

	@Autowired
	TogetherService togetherService;
	
	@Resource(name="loginUserDTO")
	private UserDTO loginUserDTO;
	
	@Autowired
	private VisitKoreaAPI spot;
	
	@GetMapping("/list")
	public String TogetherList(@RequestParam(value="page", defaultValue="1")int page, Model model) {
		List<TogetherDTO> contentList = togetherService.getTogetherList(page);
		model.addAttribute("loginUserDTO", loginUserDTO);
		model.addAttribute("contentList", contentList);
		
		PageDTO pageDTO = togetherService.getContentCnt(page);
		model.addAttribute("pageDTO", pageDTO);
		
		return "together/list";
	}
	
//	@GetMapping("/delete")
//	public String TogetherDelete(@RequestParam("content_idx")int content_idx,
//		@ModelAttribute("tmptogetherDeleteDTO")TogetherDTO tmptogetherDeleteDTO, BindingResult result, Model model) {
//		TogetherDTO togetherDeleteDTO = togetherService.getTogetherContent(content_idx);
//		model.addAttribute("togetherDeleteDTO", togetherDeleteDTO);
//		return "together/delete";
//	}
//	
//	@PostMapping("/deleteProc")
//	public String TogetherDeleteProc
//	(@RequestParam("content_idx") int content_idx, 
//	 @ModelAttribute("tmptogetherDeleteDTO") TogetherDTO tmptogetherDeleteDTO, BindingResult result, Model model) {
//		
//		String user_pw = togetherService.GetTogetherPassword(content_idx);
//    String input_pw = tmptogetherDeleteDTO.getTo_user_pw();
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		
//		boolean pwMatchRes = encoder.matches(input_pw, user_pw);
//		if(input_pw != null && pwMatchRes == true) {
//			togetherService.DeleteTogetherContent(content_idx);
//			return "together/delete_success";
//		} else {
//			model.addAttribute("content_idx", content_idx);
//			return "together/delete_fail";
//		}
//	}
	@GetMapping("/read")
	public String TogetherRead
	(@ModelAttribute ("replyWriteDTO") TogetherReplyDTO replyWriteDTO, @RequestParam("content_idx") int content_idx, Model model) {
		
		TogetherDTO readContentDTO = togetherService.getTogetherContent(content_idx);
		model.addAttribute("loginUserDTO", loginUserDTO);
		model.addAttribute("readContentDTO", readContentDTO);
		model.addAttribute("content_idx", content_idx);
		
		return "together/read_reply";
	}
	
	@ResponseBody
	@PostMapping("/replyCount")
	public int replyCount(@RequestParam("content_idx") int content_idx) {
		return togetherService.GetTogetherReplyCount(content_idx);
	}
	
	 @GetMapping("/deleteProc")
	public String BoardDeleteProc
	(@RequestParam("content_idx") int content_idx) {
		togetherService.DeleteTogetherComment(content_idx);
		togetherService.DeleteTogetherContent(content_idx);
		
		return "together/delete_success";
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
			
		togetherWriteDTO.setTo_writer_no(loginUserDTO.getUser_no());
		togetherWriteDTO.setTo_writer(loginUserDTO.getUser_id());
		
		System.out.println(togetherWriteDTO.toString());
		togetherService.InsertTogetherContent(togetherWriteDTO);
			
		return "together/write_success";
	}
	
	@GetMapping("/modify")
	public String TogetherModify
	(@ModelAttribute("togetherModifyDTO") TogetherDTO togetherModifyDTO, 
	 @RequestParam("content_idx") int content_idx, Model model) {
		
		TogetherDTO TogetherDTO = togetherService.getTogetherContent(content_idx);
		
		togetherModifyDTO.setTo_no(TogetherDTO.getTo_no());
		togetherModifyDTO.setTo_writer(TogetherDTO.getTo_writer());
		togetherModifyDTO.setTo_title(TogetherDTO.getTo_title());
		togetherModifyDTO.setTo_date(TogetherDTO.getTo_date());
		togetherModifyDTO.setTo_content(TogetherDTO.getTo_content());
		
		
		model.addAttribute("togetherModifyDTO", togetherModifyDTO);
		
		return "together/modify";
	}
	
	@PostMapping("/modifyProc")
	public String TogetherModify_Proc
	(@Valid @ModelAttribute("togetherModifyDTO") TogetherDTO togetherModifyDTO, BindingResult result) {
		
		togetherService.ModifyTogetherContent(togetherModifyDTO);
		
		return "together/modify_success";
	}
	
	@ResponseBody
	@GetMapping("/keyword")
	public List<VisitKoreaDTO> getKeywordInfo(VisitKoreaDTO visitKoreaDTO, String keyword, Model model) throws Exception {
		
		if(visitKoreaDTO.getPageNo()==null) visitKoreaDTO.setPageNo("1");
		if(visitKoreaDTO.getContentTypeId()==null) visitKoreaDTO.setContentTypeId("");
		List<VisitKoreaDTO> resultKeyword = spot.getKeywordInformation(visitKoreaDTO, keyword);
		
		return resultKeyword;
	} 	
}