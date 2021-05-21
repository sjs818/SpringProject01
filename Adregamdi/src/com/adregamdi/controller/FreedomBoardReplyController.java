package com.adregamdi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/replyWriteProc")
	public List<FreedomReplyDTO> BoardReply_Proc(@RequestParam("freedom_num")int freedom_num){
		List<FreedomReplyDTO> replyList = freedomBoardService.getFreedomReplyList(freedom_num);
		return replyList;
	}
}
