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
	
	
}
