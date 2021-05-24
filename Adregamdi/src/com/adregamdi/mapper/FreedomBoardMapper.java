package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.adregamdi.dto.FreedomBoardDTO;
import com.adregamdi.dto.FreedomReplyDTO;

public interface FreedomBoardMapper {

	@Select(" SELECT F.FREE_NO, U.USER_ID CONTENT_WRITER_ID, F.FREE_TITLE, F.FREE_CNT, " +
			" TO_CHAR(F.FREE_DATE, 'YYYY-MM-DD HH24:MI:SS') CONTENT_DATE " + 
			" FROM FREEDOMBOARD F, USER_INFO U " +
			" WHERE F.FREE_WRITER = U.USER_NO " + 
			" ORDER BY F.FREE_NO DESC ")
	List<FreedomBoardDTO> getFreedomBoardList(RowBounds rowBounds);
	
	@Select("SELECT F.FREE_NO, U.USER_NO FREE_CONTENT_WRITER_IDX, U.USER_ID CONTENT_WRITER_ID, TO_CHAR(F.FREE_DATE, 'YYYY-MM-DD HH24:MI:SS') CONTENT_DATE, " + 
			"F.FREE_TITLE, F.FREE_CONTENT, F.FREE_CNT " + 
			"FROM USER_INFO U, FREEDOMBOARD F " +
			"WHERE U.USER_NO = F.FREE_WRITER " +
			"AND F.FREE_NO = #{content_idx}")
	FreedomBoardDTO getFreedomBoardContent(int content_idx);
	
	@Select("SELECT U.USER_PW " + 
			"FROM FREEDOMBOARD F, USER_INFO U " + 
			"WHERE U.USER_NO = F.FREE_WRITER " + 
			"AND F.FREE_NO = #{content_idx}")
	String GetFreedomBoardPassword(int content_idx);
	
	@Select("SELECT COUNT(*)" + 
			"FROM FREEDOMBOARD ")
	int GetFreedomBoardContentCount();
	
	@Delete("DELETE FROM FREEDOMBOARD WHERE FREE_NO = #{content_idx}")
	void FreedomBoardDeleteContent(int content_idx);
	
	@Insert("INSERT INTO FREEDOMBOARD(FREE_NO, FREE_WRITER, FREE_TITLE, FREE_CNT, FREE_DATE, FREE_CONTENT) " + 
			"VALUES(CONTENT_CNT_SEQ.nextval, #{free_content_writer_idx}, #{free_title}, 0, SYSDATE, #{free_content}) ")
	void InsertFreedomBoardContent(FreedomBoardDTO freedomBoardDTO);
	
	@Update("UPDATE FREEDOMBOARD SET FREE_TITLE=#{free_title}, FREE_CONTENT=#{free_content}, free_date=SYSDATE " + 
			"WHERE FREE_NO = #{free_no}")
	void modifyFreedomBoardContent(FreedomBoardDTO freedomModifyDTO);
	
	// ===============================================================================================================================
	// 댓글 관련 Mapper
	
	@Select("SELECT REPLY_NUM, FREEDOM_NUM, REPLY_WRITER, REPLY_CONTENT, REPLY_DATE " + 
			"FROM FREEDOMREPLY " +
			"WHERE FREEDOM_NUM = #{freedom_num}" +
			"ORDER BY FREEDOM_NUM DESC")
	List<FreedomReplyDTO> getFreedomReplyList(int freedom_num);
	
	@Insert("INSERT INTO FREEDOMREPLY(reply_num, freedom_num, reply_writer, reply_content, reply_date) " +
			"VALUES (freedom_reply_SEQ.nextval, #{freedom_num}, #{reply_writer}, #{reply_content}, sysdate) ")
	void InsertFreedomBoardReply(FreedomReplyDTO replyWriteDTO);
	
	@Update("UPDATE FREEDOMREPLY SET reply_content = #{reply_content}, reply_date = SYSDATE WHERE freedom_num = #{freedom_num} and reply_num = #{reply_num}")
	boolean ModifyFreedomBoardReply(FreedomReplyDTO replyWriteDTO);
}