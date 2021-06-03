package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.adregamdi.dto.TogetherDTO;

public interface TogetherMapper {
	
	@Insert("INSERT INTO TOGETHER(TO_NO, TO_WRITER_NO, TO_WRITER, TO_TITLE, TO_PLACE, TO_PLACE_NAME, TO_CONTENT, TO_DATE, TO_CURR, TO_TOTAL, TO_MEET, TO_STATE) "
			+ "VALUES(TOGETHER_SEQ.nextval, #{to_writer_no}, #{to_writer}, #{to_title}, #{to_place}, #{to_place_name}, #{to_content}, SYSDATE, 1, #{to_total}, #{to_meet}, #{to_state})") 
	void InsertTogetherContent(TogetherDTO togetherDTO);
	
	//@Select("SELECT * FROM TOGETHER ORDER BY TO_NO DESC")
	//List<TogetherDTO> getTogetherList(RowBounds rowBounds);
	
	@Select("SELECT T.TO_NO, U.USER_ID TO_WRITER, T.TO_TITLE, T.TO_PLACE_NAME, T.TO_CURR, T.TO_TOTAL, T.TO_STATE, T.TO_MEET, "
	         + "TO_CHAR(T.TO_DATE, 'YYYY-MM-DD HH24:MI') TO_DATE "
	         + "FROM TOGETHER T, USER_INFO U WHERE T.TO_WRITER = U.USER_ID "
	         + "ORDER BY T.TO_NO DESC")
	List<TogetherDTO> getTogetherList(RowBounds rowBounds);
	
	@Select("SELECT TO_NO, TO_WRITER_NO, TO_WRITER, TO_TITLE, TO_PLACE, TO_PLACE_NAME, TO_CONTENT, TO_CHAR(TO_DATE, 'YYYY-MM-DD HH24:MI') TO_DATE, TO_CURR, TO_TOTAL, TO_MEET, TO_STATE FROM TOGETHER WHERE TO_NO = #{content_idx}")
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
	
	@Update("UPDATE TOGETHER SET TO_TITLE=#{to_title}, TO_CONTENT=#{to_content}, to_date=SYSDATE, TO_TOTAL=#{to_total}, TO_MEET = #{to_meet} "
      + "WHERE TO_NO = #{to_no}")
	void ModifyTogetherContent(TogetherDTO togetherModifyDTO);
	
	@Update("UPDATE TOGETHER SET TO_CNT=to_cnt+1 "
			  + "WHERE TO_NO = #{to_no}")
	void viewCount(int content_idx);
	
	
}
