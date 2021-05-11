package com.adregamdi.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.adregamdi.dto.TogetherDTO;

public interface TogetherMapper {
	
	@Insert("INSERT INTO COMMUNITY_TO(TO_NO, TO_WRITHER, TO_TITLE, TO_CNT, TO_DATE, TO_CONTENT)" +
			"VALUES(CONTENT_CNT_SEQ*nextval, 1, #{to_title}, 0, SYSDATE, #{to_content})" )
	void InsertTogetherContent(TogetherDTO togetherDTO);
	
	@Select(" SELECT T.TO_NO, U.USER_ID CONTENT_WRITER_ID, T.TO_TITLE, T.TO_CNT, "
				+ " 			 TO_CHAR(T.TO_DATE, 'YYYY-MM-DD HH24:MI:SS') CONTENT_DATE " 
			  + " 	FROM COMMUNITY_TO C, USER_INFO U " 
				+ " WHERE T.TO_WRITER =  U.USER_NO "
			  + " ORDER BY T.TO_NO DESC")
	List<TogetherDTO> getTogetherList();
	
	@Select("SELECT T.TO_NO, U.USER_ID CONTENT_WRITER_ID, "
				+ "TO_CHAR(T.TO_DATE, 'YYYY-MM-DD HH24:MI:SS') CONTENT_DATE, "
			  + "T.TO_TITLE, T.TO_CONTENT, T.TO_CNT "
				+ "FROM USER_INFO U, COMMUNITY_TO  "
			  + "WHERE T.TO_WRITER = U.USER_NO "
				+ "AND T.TO_NO = #{content_idx}")
	TogetherDTO getTogetherContent(int content_idx);
	
	@update("UPDATE COMMUNITY_TO SET TO_TITLE=#{to_title}, "
			  +"TO_CONTENT=#{to_content}, to_date=SYSDATE "
			  +"WHERE TO_NO = #{to_no}")
	void modifyTogetherContent(TogetherDTO togetherDTO);

}
