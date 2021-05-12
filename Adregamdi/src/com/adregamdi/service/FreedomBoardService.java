package com.adregamdi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.FreedomBoardDAO;
import com.adregamdi.dto.FreedomBoardDTO;

@Service
public class FreedomBoardService {
	
	@Autowired
	FreedomBoardDAO freedomBoardDAO;
	
	public List<FreedomBoardDTO> getFreedomBoardList(){
		List<FreedomBoardDTO> contentList = freedomBoardDAO.getFreedomBoardList();
		return contentList;
	}
	
	// 크으... 미련하게 List<FreedomBoardDTO>로 받고 있었어....
	public FreedomBoardDTO getFreedomBoardContent(int content_idx) {
		FreedomBoardDTO content = freedomBoardDAO.getFreedomBoardContent(content_idx);
		return content;
	}
	
	public void InsertFreedomBoardContent(FreedomBoardDTO freedomBoardDTO) {
		freedomBoardDAO.InsertFreedomBoardContent(freedomBoardDTO);
	}
	
	public void ModifyFreedomBoardContent(FreedomBoardDTO freedomModifyDTO) {
		freedomBoardDAO.ModifyFreedomBoardContent(freedomModifyDTO);
	}
	
	public String GetFreedomBoardPassword(int content_idx) {
		String password = freedomBoardDAO.GetFreedomBoardPassword(content_idx);
		return password;
	}
	
	public void FreedomBoardDeleteContent(int content_idx) {
		freedomBoardDAO.FreedomBoardDeleteContent(content_idx);
	}
}
