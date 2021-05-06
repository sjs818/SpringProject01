package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.adregamdi.dto.FreedomBoardDTO;

public interface FreedomBoardMapper {

	@Select("SELECT FREE_NO, FREE_WRITER, FREE_TITLE, FREE_CNT, FREE_DATE, FREE_CONTENT " + 
			"FROM FREEDOMBOARD")
	List<FreedomBoardDTO> getFreedomBoardList();
	
	@Insert("INSERT INTO FREEDOMBOARD VALUES(CONTENT_CNT_SEQ.nextval, " +
			"#{content_writer_idx}, #{content_subject}, #{content_view_count}, SYSDATE, #{content_text} ")
	List<FreedomBoardDTO> InsertFreedomBoardContent(); 
}
