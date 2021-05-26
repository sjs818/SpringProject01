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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.adregamdi.dto.FreedomBoardDTO;
import com.adregamdi.dto.FreedomReplyDTO;
import com.adregamdi.dto.PageDTO;
import com.adregamdi.dto.UserDTO;
import com.adregamdi.service.FreedomBoardService;

@Controller
@RequestMapping("/freedom")
public class FreedomBoardController {

	@Autowired
	FreedomBoardService freedomBoardService;

	@Resource(name = "loginUserDTO")
	private UserDTO loginUserDTO;

	@GetMapping("/list")
	public String BoardList(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		List<FreedomBoardDTO> contentList = freedomBoardService.getFreedomBoardList(page);
		model.addAttribute("loginUserDTO", loginUserDTO);
		model.addAttribute("contentList", contentList);
		
		PageDTO pageDTO = freedomBoardService.getContentCnt(page);
		model.addAttribute("pageDTO", pageDTO);
		
		return "freedom/list";
	}
	
	@GetMapping("/deleteProc")
	public String BoardDeleteProc
	(@RequestParam("content_idx") int content_idx) {
		freedomBoardService.FreedomBoardDeleteContent(content_idx);
		
		return "freedom/delete_success";
	}
	
	@GetMapping("/read")
	public String BoardRead
	(@ModelAttribute ("replyWriteDTO") FreedomReplyDTO replyWriteDTO, @RequestParam("content_idx") int content_idx, Model model) {
		FreedomBoardDTO readContentDTO = freedomBoardService.getFreedomBoardContent(content_idx);
		model.addAttribute("loginUserDTO", loginUserDTO);
		model.addAttribute("readContentDTO", readContentDTO);
		return "freedom/read_demo";
	}

	@GetMapping("/write")
	public String BoardWrite
	(@ModelAttribute("freedomWriteDTO") FreedomBoardDTO freedomWriteDTO) {
		return "freedom/write_ckeditor_demo";
	}
	
	@RequestMapping(value = "/writeProc", method=RequestMethod.POST)
	public String BoardWrite_Proc
	(@Valid @ModelAttribute("FreedomWriteDTO") FreedomBoardDTO freedomWriteDTO, BindingResult result) {
		if(result.hasErrors())
			return "freedom/write_ckeditor_demo";
		
		freedomBoardService.InsertFreedomBoardContent(freedomWriteDTO);

		return "freedom/write_success";
	}

	@GetMapping("/modify")
	public String BoardModify(@ModelAttribute("freedomModifyDTO") FreedomBoardDTO freedomModifyDTO,
			@RequestParam("content_idx") int content_idx, Model model) {

		FreedomBoardDTO freedomContentDTO = freedomBoardService.getFreedomBoardContent(content_idx);

		freedomModifyDTO.setFree_no(freedomContentDTO.getFree_no());
		freedomModifyDTO.setFree_title(freedomContentDTO.getFree_title());
		freedomModifyDTO.setFree_content(freedomContentDTO.getFree_content());
		freedomModifyDTO.setFree_cnt(freedomContentDTO.getFree_cnt());
		freedomModifyDTO.setContent_writer_id(freedomContentDTO.getContent_writer_id());
		freedomModifyDTO.setContent_date(freedomContentDTO.getContent_date());

		model.addAttribute("freedomModifyDTO",freedomModifyDTO);
		
		return "freedom/modify_demo";

	}

	@PostMapping("/modifyProc")
	public String BoardModify_Proc
	(@Valid @ModelAttribute("freedomModifyProcDTO") FreedomBoardDTO freedomModifyProcDTO, BindingResult result) {
		
		freedomBoardService.ModifyFreedomBoardContent(freedomModifyProcDTO);
		
		return "freedom/modify_success";
	}
}

// 안쓰는 코드지만 남겨둠
/*
 * @GetMapping("/delete") public String BoardDelete
 * (@RequestParam("content_idx") int content_idx,
 * 
 * @ModelAttribute("tmpfreedomDeleteDTO") FreedomBoardDTO tmpfreedomDeleteDTO,
 * BindingResult result, Model model) { FreedomBoardDTO freedomDeleteDTO =
 * freedomBoardService.getFreedomBoardContent(content_idx);
 * model.addAttribute("freedomDeleteDTO", freedomDeleteDTO);
 * 
 * return "freedom/delete"; }
 * 
 * 
 * @PostMapping("/deleteProc") public String BoardDeleteProc
 * (@RequestParam("content_idx") int content_idx,
 * 
 * @ModelAttribute("tmpfreedomDeleteDTO") FreedomBoardDTO tmpfreedomDeleteDTO,
 * BindingResult result, Model model) {
 * 
 * //데이터 베이스에서 불러오는 비밀번호 String user_pw =
 * freedomBoardService.GetFreedomBoardPassword(content_idx);
 * 
 * //입력받은 비밀번호 String input_pw = tmpfreedomDeleteDTO.getFree_user_pw();
 * 
 * BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
 * 
 * //인코더에 넣어줌(입력받은 비번, 암호와된 유저비번) boolean pwMatchRes = encoder.matches(input_pw,
 * user_pw);
 * 
 * if(input_pw != null && pwMatchRes == true) {
 * freedomBoardService.FreedomBoardDeleteContent(content_idx); return
 * "freedom/delete_success"; } else { model.addAttribute("content_idx",
 * content_idx); return "freedom/delete_fail"; } }
 */
