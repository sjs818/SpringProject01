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

import com.adregamdi.dto.FreedomBoardDTO;
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
	public String BoardList(Model model) {
		List<FreedomBoardDTO> contentList = freedomBoardService.getFreedomBoardList();
		model.addAttribute("loginUserDTO", loginUserDTO);
		model.addAttribute("contentList", contentList);
		return "freedom/list";
	}

	@GetMapping("/delete")
	public String BoardDelete() {
		return "freedom/delete";
	}

	@GetMapping("/read")
	public String BoardRead(@RequestParam("content_idx") int content_idx, Model model) {
		FreedomBoardDTO readContentDTO = freedomBoardService.getFreedomBoardContent(content_idx);
		model.addAttribute("loginUserDTO", loginUserDTO);
		model.addAttribute("readContentDTO", readContentDTO);
		return "freedom/read";
	}

	@GetMapping("/write")
	public String BoardWrite(@ModelAttribute("freedomWriteDTO") FreedomBoardDTO freedomWriteDTO) {
		return "freedom/write";
	}

	@PostMapping("/writeProc")
	public String BoardWrite_Proc(@Valid @ModelAttribute("FreedomWriteDTO") FreedomBoardDTO freedomWriteDTO,
			BindingResult result) {
		if (result.hasErrors())
			return "freedom/write";

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

		return "freedom/modify";
	}

	@PostMapping("/modifyProc")
	public String BoardModify_Proc(@Valid @ModelAttribute("freedomModifyDTO") FreedomBoardDTO freedomModifyDTO,
			BindingResult result) {

		freedomBoardService.ModifyFreedomBoardContent(freedomModifyDTO);

		return "freedom/modify_success";
	}
}
