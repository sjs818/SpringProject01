package com.adregamdi.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.dto.TogetherDTO;
import com.adregamdi.dto.UserDTO;
import com.adregamdi.mapper.TogetherMapper;

@Repository
public class TogetherDAO {
	
	@Autowired
  TogetherMapper togetherMapper;
	
	@Resource(name="loginUserDTO")
	private UserDTO loginUserDTO;

	
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
		togetherDTO.setTo_writer(loginUserDTO.getUser_no());
		togetherMapper.InsertTogetherContent(togetherDTO);
	}
	
	public void ModifyTogetherContent(TogetherDTO togetherModifyDTO) {
		togetherMapper.ModifyTogetherContent(togetherModifyDTO);
	}
	public void DeleteTogetherContent(int content_idx) {
		togetherMapper.DeleteTogetherContent(content_idx);
	}
}