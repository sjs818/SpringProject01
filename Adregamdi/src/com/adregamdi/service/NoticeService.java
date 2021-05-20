package com.adregamdi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.NoticeDAO;
import com.adregamdi.dto.NoticeDTO;

@Service
public class NoticeService {

	@Autowired
	NoticeDAO noticeDAO;

	public List<NoticeDTO> getNoticeList() {
		List<NoticeDTO> contentList = noticeDAO.getNoticeList();
		return contentList;
	}

	public NoticeDTO getNoticeContent(int content_idx) {
		NoticeDTO content = noticeDAO.getNoticeContent(content_idx);
		return content;
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

}
