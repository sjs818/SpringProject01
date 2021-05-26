package com.adregamdi.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.adregamdi.dto.TogetherReplyDTO;
import com.adregamdi.service.TogetherService;

@RestController
@RequestMapping("/togetherReply")
public class TogetherReplyController {
	
	@Autowired
	TogetherService togetherService; 
	
	//댓글 리스트 가져오기
	@PostMapping("/replyGetList")
	public List<TogetherReplyDTO> BoardReplyGetList(@RequestParam("together_num")int together_num){
		List<TogetherReplyDTO> replyList = togetherService.getTogetherReplyList(together_num);
		return replyList;
	}
	
	//댓글 작성
	@PostMapping("/replyWriteProc")
	public Map<String,Object> BoardReplyWriteProc(@RequestBody TogetherReplyDTO replyWriteDTO) {
		Map<String,Object> result = new HashMap<>();
		
		try {
			togetherService.InsertTogetherReply(replyWriteDTO);
			result.put("status", "True");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}
	
	//댓글 수정
	@PostMapping("/replyModifyProc")
	public Map<String,Object> BoardReplyModifyProc(@RequestBody TogetherReplyDTO replyWriteDTO) {
		Map<String, Object> result = new HashMap<>();
		try {
			togetherService.ModifyTogetherReply(replyWriteDTO);
			result.put("status", "True");
		}catch(Exception e){
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}
	
	//댓글 삭제
	@PostMapping("/replyDeleteProc")
	public Map<String, Object> BoardReplyDeleteProc(@RequestBody TogetherReplyDTO replyWriteDTO){
		Map<String, Object> result = new HashMap<>();
		
		try {
			togetherService.DeleteTogetherReply(replyWriteDTO);
			result.put("status", "True");
		} catch(Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}
}
