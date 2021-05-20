package com.adregamdi.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.adregamdi.dto.FreedomReplyDTO;
import com.adregamdi.service.FreedomBoardService;

@RestController
@RequestMapping("/freedomReply")
public class FreedomBoardReplyController {
	
	@Autowired
	FreedomBoardService freedomBoardService; 
	
	@PostMapping("/replyWriteProc")
	public List<FreedomReplyDTO> BoardReply_Proc
	(@Valid @ModelAttribute("replyWriteDTO") FreedomReplyDTO replyWriteDTO, @RequestParam("freedom_num")int freedom_num, BindingResult result) {
		List<FreedomReplyDTO> replyList = freedomBoardService.getFreedomReplyList(freedom_num);
		System.out.println("통신함");
		return replyList;
	}
}
