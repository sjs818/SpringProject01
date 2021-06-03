package com.adregamdi.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
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
    
	// 게시글 리스트
	public List<NoticeDTO> getNoticeList(RowBounds rowBounds) {
		List<NoticeDTO> contentList = noticeMapper.getNoticeList(rowBounds);
		return contentList;
	}
	
	// 게시글 이전글, 다음글
	public NoticeDTO getNextPrev(int content_idx) {
		NoticeDTO getNextPrev = noticeMapper.getNextPrev(content_idx);
		return getNextPrev;
	}
	
    // 게시글 본문 내용
	public NoticeDTO getNoticeContent(int content_idx) {
		NoticeDTO content = noticeMapper.getNoticeContent(content_idx);
		return content;
	}
	
	// 게시글 페이징
	public int GetNoticeContentCount() {
		int contentCount = noticeMapper.GetNoticeContentCount();
		return contentCount;
	}
	
	// 게시글 글쓰기
	public void InsertNoticeContent(NoticeDTO noticeDTO) {
		noticeDTO.setNotice_user_no(loginUserDTO.getUser_no());
		noticeMapper.InsertNoticeContent(noticeDTO);
	}

	// 게시글 수정
	public void ModifyNoticeContent(NoticeDTO noticeModifyDTO) {
		noticeMapper.modifyNoticeContent(noticeModifyDTO);
	}

	// 게시글 삭제
	public void DeleteNoticeContent(int content_idx) {
		noticeMapper.deleteNoticeContent(content_idx);
	}
	
	// 게시글 조회수
	public void viewCount(int content_idx) {
		noticeMapper.viewCount(content_idx);
	}
	
	//게시글 제목으로 검색해서 가져오는 함수
	public List<NoticeDTO> getSearchKeyObjectNoticeList(RowBounds rowBounds, String keywords){
		List<NoticeDTO> contentList = noticeMapper.getSearchKeyObejctNoticeList(rowBounds, keywords);
		return contentList;
	}
	
	//게시글 제목 + 내용으로 검색해서 가져오는 함수
	public List<NoticeDTO> getSearchKeyObejctContentNoticeBoardList(RowBounds rowBounds, String keywords){
		List<NoticeDTO> contentList = noticeMapper.getSearchKeyObejctContentNoticeList(rowBounds, keywords);
		return contentList;
	}
	
	//게시판 제목으로 검색한 카운트
	public int getSearchKeyObjectCount(String keywords) {
		int contentCount = noticeMapper.getSearchKeyObjectCount(keywords);
		return contentCount;
	}
	
	//게시판 제목 + 내용으로 검색한 카운트
	public int getSearchKeyObjectContent(String keywords) {
		int contentCount = noticeMapper.getSearchKeyObjectContent(keywords);
		return contentCount;
	}
	
	// 게시글 제목으로 검색시 게시물 개수
	
	// 게시글 제목 + 내용으로 검색시 게시물 개수
	

}
