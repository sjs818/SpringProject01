package com.adregamdi.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.dto.FreedomBoardDTO;
import com.adregamdi.mapper.FreedomBoardMapper;

@Repository
public class FreedomBoardDAO {
	
	@Autowired
	FreedomBoardMapper freedomBoardMapper;
	
	public List<FreedomBoardDTO> getFreedomBoardList() {
		List<FreedomBoardDTO> contentList = freedomBoardMapper.getFreedomBoardList();
		System.out.println(contentList);
		return contentList;
	}
	
	public FreedomBoardDTO getFreedomBoardContent(int content_idx) {
		FreedomBoardDTO content = freedomBoardMapper.getFreedomBoardContent(content_idx);
		return content;
	}
	
	public void InsertFreedomBoardContent(FreedomBoardDTO freedomBoardDTO) {
		freedomBoardMapper.InsertFreedomBoardContent(freedomBoardDTO);
	}
	
	public void ModifyFreedomBoardContent(FreedomBoardDTO freedomModifyDTO) {
		freedomBoardMapper.modifyFreedomBoardContent(freedomModifyDTO);
	}
}
