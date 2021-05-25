package com.adregamdi.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.NoticeDAO;
import com.adregamdi.dto.NoticeDTO;
import com.adregamdi.dto.PageDTO;

@Service
public class NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
	// 한페이지당 보여주는 글의 개수
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	// 한 페이지당 보여주는 페이지의 개수
	@Value("${page.pagination}")
	private int page_pagination;
	
	// 페이징 작업
	public List<NoticeDTO> getNoticeList(int page) {
		int start = (page - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		List<NoticeDTO> contentList = noticeDAO.getNoticeList(rowBounds);
		return contentList;
	}
	
	public NoticeDTO getNextPrev(int content_idx) {
		NoticeDTO getNextPrev = noticeDAO.getNextPrev(content_idx);
		return getNextPrev;
	}

	public NoticeDTO getNoticeContent(int content_idx) {
		NoticeDTO content = noticeDAO.getNoticeContent(content_idx);
		return content;
	}
	
	public int GetNoticeContentCount() {
		int contentCount = noticeDAO.GetNoticeContentCount();
		return contentCount;
	}

	public void InsertNoticeContent(NoticeDTO noticeDTO) {
		noticeDAO.InsertNoticeContent(noticeDTO);
	}

	public void ModifyNoticeContent(NoticeDTO noticeModifyDTO) {
		noticeDAO.ModifyNoticeContent(noticeModifyDTO);
	}

	public void DeleteNoticeContent(int content_idx) {
		noticeDAO.DeleteNoticeContent(content_idx);
	}
	
	public PageDTO getContentCnt(int currPage) {
		int contentCnt = noticeDAO.GetNoticeContentCount();
		PageDTO tumpPageDTO = new PageDTO(contentCnt, currPage, page_listcnt, page_pagination);
		return tumpPageDTO;
	}
	
	public void viewCount(int content_idx) {
		noticeDAO.viewCount(content_idx);
	}

}
