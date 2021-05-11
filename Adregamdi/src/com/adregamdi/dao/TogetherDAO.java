package com.adregamdi.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.dto.TogetherDTO;
import com.adregamdi.mapper.TogetherMapper;

@Repository
public class TogetherDAO {
	
	@Autowired
  TogetherMapper togetherMapper;
	
	public List<TogetherDTO> getTogetherList() {
		List<TogetherDTO> contentList
		  = togetherMapper.getTogetherList();
		return contentList;
	}
	
	public TogetherDTO getTogetherContent(int content_idx)	{
		TogetherDTO content
		  = togetherMapper.getTogetherContent(content_idx);
		return content;
	}
	public void InsertTogetherContent(TogetherDTO togetherDTO) {
		togetherMapper.InsertTogetherContent(togetherDTO);
	}
	
	public void ModifyTogetherContent(TogetherDTO togetherModifyDTO) {
		togetherMapper.modifyTogetherContent(togetherModifyDTO);
	}
}