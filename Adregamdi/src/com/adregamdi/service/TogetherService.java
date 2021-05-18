package com.adregamdi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.TogetherDAO;
import com.adregamdi.dto.TogetherDTO;

@Service
public class TogetherService {
	
	@Autowired
	TogetherDAO togetherDAO;
	
	public List<TogetherDTO> getTogetherList(){
		List<TogetherDTO> contentList = togetherDAO.getTogetherList();
		return contentList;
	}
	public TogetherDTO getTogetherContent(int content_idx) {
		TogetherDTO content = togetherDAO.getTogetherContent(content_idx);
		return content;
	}
	public void InsertTogetherContent(TogetherDTO togetherDTO) {
		togetherDAO.InsertTogetherContent(togetherDTO);
	}	
	public void ModifyTogetherContent(TogetherDTO togetherModifyDTO) {
		togetherDAO.ModifyTogetherContent(togetherModifyDTO);
	}
	public void DeleteTogetherContent(int content_idx) {
		togetherDAO.DeleteTogetherContent(content_idx);
	}
}