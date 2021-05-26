package com.adregamdi.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.TogetherDAO;
import com.adregamdi.dto.TogetherDTO;
import com.adregamdi.dto.TogetherReplyDTO;
import com.adregamdi.dto.PageDTO;

@Service
public class TogetherService {
	
	@Autowired
	TogetherDAO togetherDAO;
	
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.pagination}")
	private int page_pagination;
	
	public List<TogetherDTO> getTogetherList(int page){
		int start = (page - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		List<TogetherDTO> contentList = togetherDAO.getTogetherList(rowBounds);
		return contentList;
	}
	public TogetherDTO getTogetherContent(int content_idx) {
		TogetherDTO content = togetherDAO.getTogetherContent(content_idx);
		return content;
	}
	public int GetTogetherContentCount() {
		int contentCount = togetherDAO.GetTogetherContentCount();
		return contentCount;
	}
	public void InsertTogetherContent(TogetherDTO togetherDTO) {
		togetherDAO.InsertTogetherContent(togetherDTO);
	}	
	public void ModifyTogetherContent(TogetherDTO togetherModifyDTO) {
		togetherDAO.ModifyTogetherContent(togetherModifyDTO);
	}
	public String GetTogetherPassword(int content_idx) {
		String password = togetherDAO.GetTogetherPassword(content_idx);
		return password;
	}
	public void DeleteTogetherContent(int content_idx) {
		togetherDAO.DeleteTogetherContent(content_idx);
	}
	public PageDTO getContentCnt(int currPage) {
		int contentCnt = togetherDAO.GetTogetherContentCount();
		PageDTO tumpPageDTO = new PageDTO(contentCnt, currPage, page_listcnt, page_pagination);
		return tumpPageDTO;
	}
	public void viewCount(int content_idx ) {
		togetherDAO.viewCount(content_idx);
	}	
	
	//===================================== 댓글 관련 컨트롤러 =======================
		// 댓글 리스트 불러오기
		public List<TogetherReplyDTO> getTogetherReplyList(int to_num){
			List<TogetherReplyDTO> replyList = togetherDAO.getTogetherReplyList(to_num);
			return replyList;
		}
		
		//댓글 입력
		public void InsertTogetherReply(TogetherReplyDTO replyWriteDTO) {
			togetherDAO.InsertTogetherReply(replyWriteDTO);
		}
		
		//댓글 수정
		public void ModifyTogetherReply(TogetherReplyDTO replyWriteDTO) {
			togetherDAO.ModifyTogetherReply(replyWriteDTO);
		}
		
		//댓글 삭제
		public void DeleteTogetherReply(TogetherReplyDTO replyWriteDTO) {
			togetherDAO.DeleteTogetherReply(replyWriteDTO);
		}				
}