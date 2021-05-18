package com.adregamdi.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.FreedomBoardDAO;
import com.adregamdi.dto.FreedomBoardDTO;
import com.adregamdi.dto.PageDTO;

@Service
public class FreedomBoardService {
	
	@Autowired
	FreedomBoardDAO freedomBoardDAO;
	
	// 한페이지당 보여주는 글의 개수
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	// 한 페이지당 보여주는 페이지의 개수
	@Value("${page.pagination}")
	private int page_pagination;
	
	// 페이징 작업
	public List<FreedomBoardDTO> getFreedomBoardList(int page){
		int start = (page - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		List<FreedomBoardDTO> contentList = freedomBoardDAO.getFreedomBoardList(rowBounds);
		return contentList;
	}
	
	// 크으... 미련하게 List<FreedomBoardDTO>로 받고 있었어....
	public FreedomBoardDTO getFreedomBoardContent(int content_idx) {
		FreedomBoardDTO content = freedomBoardDAO.getFreedomBoardContent(content_idx);
		return content;
	}
	
	public int GetFreedomBoardContentCount() {
		int contentCount = freedomBoardDAO.GetFreedomBoardContentCount();
		return contentCount;
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
	
	public PageDTO getContentCnt(int currPage) {
		int contentCnt = freedomBoardDAO.GetFreedomBoardContentCount();
		PageDTO tumpPageDTO = new PageDTO(contentCnt, currPage, page_listcnt, page_pagination);
		return tumpPageDTO;
	}
}
