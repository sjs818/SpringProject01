package com.adregamdi.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.dto.FreedomBoardDTO;
import com.adregamdi.dto.NoticeDTO;
import com.adregamdi.dto.UserDTO;
import com.adregamdi.mapper.NoticeMapper;

@Repository
public class NoticeDAO {

	@Autowired
	NoticeMapper noticeMapper;

	@Resource(name = "loginUserDTO")
	private UserDTO loginUserDTO;

	public List<NoticeDTO> getNoticeList() {
		List<NoticeDTO> contentList = noticeMapper.getNoticeList();
		System.out.println(contentList);
		return contentList;
	}

	public NoticeDTO getNoticeContent(int content_idx) {
		NoticeDTO content = noticeMapper.getNoticeContent(content_idx);
		return content;
	}

	public void InsertNoticeContent(NoticeDTO noticeDTO) {
		noticeDTO.setNotice_user_no(loginUserDTO.getUser_no());
		noticeMapper.InsertNoticeContent(noticeDTO);
	}

	public void ModifyNoticeContent(NoticeDTO noticeModifyDTO) {
		noticeMapper.modifyNoticeContent(noticeModifyDTO);
	}
	
	public void DeleteNoticeContent(int content_idx) {
		noticeMapper.deleteNoticeContent(content_idx);
	}

}
