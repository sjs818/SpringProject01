package com.adregamdi.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.dto.FreedomBoardDTO;
import com.adregamdi.dto.FreedomReplyDTO;
import com.adregamdi.dto.UserDTO;
import com.adregamdi.mapper.FreedomBoardMapper;

@Repository
public class FreedomBoardDAO {
	
	@Autowired
	FreedomBoardMapper freedomBoardMapper;
	
	@Resource(name="loginUserDTO")
	private UserDTO loginUserDTO;
	
	public List<FreedomBoardDTO> getFreedomBoardList(RowBounds rowBounds) {
		List<FreedomBoardDTO> contentList = freedomBoardMapper.getFreedomBoardList(rowBounds);
		return contentList;
	}
	
	public FreedomBoardDTO getFreedomBoardContent(int content_idx) {
		FreedomBoardDTO content = freedomBoardMapper.getFreedomBoardContent(content_idx);
		return content;
	}
	
	public int GetFreedomBoardContentCount() {
		int contentCount = freedomBoardMapper.GetFreedomBoardContentCount();
		return contentCount;
	}
	
	public void InsertFreedomBoardContent(FreedomBoardDTO freedomBoardDTO) {
		freedomBoardDTO.setFree_content_writer_idx(loginUserDTO.getUser_no());
		freedomBoardMapper.InsertFreedomBoardContent(freedomBoardDTO);
	}
	
	public void ModifyFreedomBoardContent(FreedomBoardDTO freedomModifyDTO) {
		freedomBoardMapper.modifyFreedomBoardContent(freedomModifyDTO);
	}
	
	public String GetFreedomBoardPassword(int content_idx) {
		String password = freedomBoardMapper.GetFreedomBoardPassword(content_idx);
		return password;
	}
	
	public void FreedomBoardDeleteContent(int content_idx) {
		freedomBoardMapper.FreedomBoardDeleteContent(content_idx);
	}
	
	// ============================================ 댓글 관련 컨트롤러 ==========================
	// 댓글 리스트 불러오기
	public List<FreedomReplyDTO> getFreedomReplyList(int free_num) {
		List<FreedomReplyDTO> replyList = freedomBoardMapper.getFreedomReplyList(free_num);
		return replyList;
	}
	
	//댓글 입력
	public void InsertFreedomBoardReply(FreedomReplyDTO replyWriteDTO) {
		freedomBoardMapper.InsertFreedomBoardReply(replyWriteDTO);
	}
}
