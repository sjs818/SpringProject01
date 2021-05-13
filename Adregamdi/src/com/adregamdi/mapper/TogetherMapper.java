package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.adregamdi.dto.TogetherDTO;

public interface TogetherMapper {
	
	@Insert("INSERT INTO TOGETHER(TO_NO, TO_WRITHER, TO_TITLE, TO_CNT, TO_DATE, TO_CONTENT)" +
			"VALUES(TO_CNT_SEQ.nextval,#{to_writer}, #{to_title}, 0, SYSDATE, #{to_content})" )
	void InsertTogetherContent(TogetherDTO togetherDTO);
	
	@Select(" SELECT T.TO_NO, U.USER_ID TO_WRITER, T.TO_TITLE, T.TO_CNT, "
				+ "TO_CHAR(T.TO_DATE, 'YYYY-MM-DD HH24:MI:SS') TO_DATE " 
			  + "FROM TOGETHER T, USER_INFO U " 
				+ "WHERE T.TO_WRITER =  U.USER_NO "
			  + "ORDER BY T.TO_NO DESC")
	List<TogetherDTO> getTogetherList();
	
	@Select("SELECT T.TO_NO, U.USER_ID TO_WRITER, "
				+ "TO_CHAR(T.TO_DATE, 'YYYY-MM-DD HH24:MI:SS') TO_DATE, "
			  + "T.TO_TITLE, T.TO_CONTENT, T.TO_CNT "
				+ "FROM USER_INFO U, TOGETHER T "
			  + "WHERE U.USER_NO = T.TO_WRITHER "
				+ "AND T.TO_NO = #{content_idx}")
	TogetherDTO getTogetherContent(int content_idx);
	
	@Update("UPDATE TOGETHER SET TO_TITLE=#{to_title}, "
			  +"TO_CONTENT=#{to_content}, to_date=SYSDATE "
			  +"WHERE TO_NO = #{to_no}")
	void modifyTogetherContent(TogetherDTO togetherDTO);

}
