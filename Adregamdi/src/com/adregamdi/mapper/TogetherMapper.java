package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.adregamdi.dto.TogetherDTO;
import com.adregamdi.dto.TogetherReplyDTO;

public interface TogetherMapper {
	
	@Insert("INSERT INTO TOGETHER(TO_NO, TO_WRITER, TO_TITLE, TO_PLACE, TO_CONTENT, TO_DATE, TO_CURR, TO_TOTAL, TO_MEET, TO_STATE) "
			+ "VALUES(TOGETHER_SEQ.nextval, #{to_writer}, #{to_title}, #{to_place}, #{to_content}, SYSDATE, 0, #{to_total}, #{to_meet}, #{to_state}) ") 
	void InsertTogetherContent(TogetherDTO togetherDTO);
	
	@Select("SELECT T.TO_NO, U.USER_ID TO_WRITER, T.TO_TITLE, T.TO_PLACE, T.TO_CURR, T.TO_TOTAL, T.TO_STATE, T.TO_MEET, "
			+ "TO_CHAR(T.TO_DATE, 'YYYY-MM-DD HH24:MI') TO_DATE "
			+ "FROM TOGETHER T, USER_INFO U WHERE T.TO_WRITER = U.USER_NO "
			+ "ORDER BY T.TO_NO DESC")
	List<TogetherDTO> getTogetherList(RowBounds rowBounds);
	
	@Select("SELECT T.TO_NO, U.USER_NO TO_WRITER, U.USER_ID TO_ID, TO_CHAR(T.TO_DATE, 'YYYY-MM-DD HH24:MI:SS') TO_DATE, T.TO_TITLE, T.TO_CONTENT, T.TO_PLACE, T.TO_CURR, T.TO_TOTAL, T.TO_MEET, T.TO_STATE FROM USER_INFO U, TOGETHER T WHERE U.USER_NO = T.TO_WRITER AND T.TO_NO = #{content_idx}")
	TogetherDTO getTogetherContent(int content_idx);
	
	@Select("SELECT U.USER_PW " 
			  + "FROM TOGETHER T, USER_INFO U "
			  + "WHERE U.USER_NO = T.TO_WRITER "
			  + "AND T.TO_NO = #{content_idx}")
	String GetTogetherPassword(int content_idx);
	
	@Select("SELECT COUNT(*)" + 
			"FROM TOGETHER ")
	int GetTogetherContentCount();
	
	@Delete("DELETE FROM TOGETHER WHERE TO_NO = #{content_idx}")
	void DeleteTogetherContent(int content_idx);
	
	@Delete("DELETE FROM TOGETHERREPLY WHERE TOGETHER_NUM = #{content_idx}")
	void DeleteTogetherComment(int content_idx);
	
	@Update("UPDATE TOGETHER SET TO_TITLE=#{to_title}, "
			  +"TO_CONTENT=#{to_content}, to_date=SYSDATE "
			  +"WHERE TO_NO = #{to_no}")
	void ModifyTogetherContent(TogetherDTO togetherModifyDTO);
	
	@Update("UPDATE TOGETHER SET TO_CNT=to_cnt+1 "
			  + "WHERE TO_NO = #{to_no}")
  void viewCount(int content_idx);
	
	
// 댓글 관련 Mapper================================================================================================================================
	
	@Select("SELECT REPLY_NUM, TOGETHER_NUM, REPLY_WRITER, REPLY_CONTENT, REPLY_DATE " + 
			"FROM TOGETHERREPLY " +
			"WHERE TOGETHER_NUM = #{together_num}" +
			"ORDER BY TOGETHER_NUM DESC")
	List<TogetherReplyDTO> getTogetherReplyList(int together_num);
	
	//댓글 작성
	@Insert("INSERT INTO TOGETHERREPLY(reply_num, together_num, reply_writer, reply_content, reply_date) " +
			"VALUES (together_reply_SEQ.nextval, #{together_num}, #{reply_writer}, #{reply_content}, sysdate) ")
	void InsertTogetherReply(TogetherReplyDTO replyWriteDTO);
	
	//댓글 수정
	@Update("UPDATE TOGETHERREPLY SET reply_content = #{reply_content}, reply_date = SYSDATE WHERE together_num = #{together_num} and reply_num = #{reply_num}")
	void ModifyTogetherReply(TogetherReplyDTO replyWriteDTO);
	
	//댓글 삭제
	@Delete("DELETE FROM TOGETHERREPLY WHERE TOGETHER_NUM=#{together_num} AND REPLY_NUM=#{reply_num}")
	void DeleteTogetherReply(TogetherReplyDTO replyWriteDTO);
	
	//댓글 갯수 조회
	@Select("SELECT COUNT(*) FROM TOGETHERREPLY WHERE TOGETHER_NUM=#{together_num}")
	int GetTogetherReplyCount(int together_num);
}
