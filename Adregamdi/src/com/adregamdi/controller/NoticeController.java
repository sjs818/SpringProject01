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

import com.adregamdi.dto.NoticeDTO;
import com.adregamdi.dto.PageDTO;
import com.adregamdi.dto.UserDTO;
import com.adregamdi.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	@Resource(name = "loginUserDTO")
	private UserDTO loginUserDTO;

	@GetMapping("/list")
	public String BoardList(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		List<NoticeDTO> contentList = noticeService.getNoticeList(page);
		model.addAttribute("loginUserDTO", loginUserDTO);
		model.addAttribute("contentList", contentList);
		
		PageDTO pageDTO = noticeService.getContentCnt(page);
		model.addAttribute("pageDTO", pageDTO);
		
		return "notice/list";
	}

	@GetMapping("/read")
	public String NoticeRead(@RequestParam("content_idx") int content_idx, Model model) {
		noticeService.viewCount(content_idx);
		NoticeDTO readContentDTO = noticeService.getNoticeContent(content_idx);
		if(content_idx != 1) {
			NoticeDTO prevContentDTO = noticeService.getNoticeContent(content_idx - 1);
			model.addAttribute("prevContentDTO", prevContentDTO);
		}
		
		NoticeDTO nextContentDTO = noticeService.getNoticeContent(content_idx + 1);
		
		System.out.println(readContentDTO.getNotice_content());
		model.addAttribute("loginUserDTO", loginUserDTO);
		model.addAttribute("readContentDTO", readContentDTO);
		model.addAttribute("nextContentDTO", nextContentDTO);
		
		return "notice/read";

	}

	@GetMapping("/write")
	public String BoardWrite(@ModelAttribute("noticeWriteDTO") NoticeDTO noticeWriteDTO) {
		return "notice/write";
	}

	@PostMapping("/writeProc")
	public String BoardWrite_Proc(@Valid @ModelAttribute("NoticeWriteDTO") NoticeDTO noticeWriteDTO,
			BindingResult result) {
		if (result.hasErrors())
			return "notice/write";

		noticeService.InsertNoticeContent(noticeWriteDTO);

		return "notice/write_success";
	}

	@GetMapping("/modify")
	public String NoticeModify(@ModelAttribute("noticeModifyDTO") NoticeDTO noticeModifyDTO,

			@RequestParam("content_idx") int content_idx, Model model) {

		NoticeDTO noticeContentDTO = noticeService.getNoticeContent(content_idx);

		noticeModifyDTO.setNotice_no(noticeContentDTO.getNotice_no());
		noticeModifyDTO.setNotice_title(noticeContentDTO.getNotice_title());
		noticeModifyDTO.setNotice_content(noticeContentDTO.getNotice_content());
		noticeModifyDTO.setNotice_cnt(noticeContentDTO.getNotice_cnt());
		noticeModifyDTO.setContent_notice_user_no(noticeContentDTO.getContent_notice_user_no());
		noticeModifyDTO.setNotice_date(noticeContentDTO.getNotice_date());

		return "notice/modify";
	}

	@PostMapping("/modifyProc")
	public String BoardModify_Proc(@Valid @ModelAttribute("noticeModifyDTO") NoticeDTO noticeModifyDTO,
			BindingResult result) {

		noticeService.ModifyNoticeContent(noticeModifyDTO);

		return "notice/modify_success";
	}

	@GetMapping("/delete")
	public String NoticeDelete(@RequestParam("content_idx") int content_idx) {
		noticeService.DeleteNoticeContent(content_idx);
		return "notice/delete_success";
	}

}
