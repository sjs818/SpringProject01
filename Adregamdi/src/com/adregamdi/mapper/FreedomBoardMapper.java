package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.adregamdi.dto.FreedomBoardDTO;

public interface FreedomBoardMapper {

	@Select(" SELECT F.FREE_NO, U.USER_ID CONTENT_WRITER_ID, F.FREE_TITLE, F.FREE_CNT, " +
			" TO_CHAR(F.FREE_DATE, 'YYYY-MM-DD HH24:MI:SS') CONTENT_DATE " + 
			" FROM FREEDOMBOARD F, USER_INFO U " +
			" WHERE F.FREE_WRITER = U.USER_NO " + 
			" ORDER BY F.FREE_NO DESC ")
	List<FreedomBoardDTO> getFreedomBoardList();
	
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
	
	@Delete("DELETE FROM FREEDOMBOARD WHERE FREE_NO = #{content_idx}")
	void FreedomBoardDeleteContent(int content_idx);
	
	@Insert("INSERT INTO FREEDOMBOARD(FREE_NO, FREE_WRITER, FREE_TITLE, FREE_CNT, FREE_DATE, FREE_CONTENT) " + 
			"VALUES(CONTENT_CNT_SEQ.nextval, #{free_content_writer_idx}, #{free_title}, 0, SYSDATE, #{free_content}) ")
	void InsertFreedomBoardContent(FreedomBoardDTO freedomBoardDTO);
	
	@Update("UPDATE FREEDOMBOARD SET FREE_TITLE=#{free_title}, FREE_CONTENT=#{free_content}, free_date=SYSDATE " + 
			"WHERE FREE_NO = #{free_no}")
	void modifyFreedomBoardContent(FreedomBoardDTO freedomModifyDTO);
}