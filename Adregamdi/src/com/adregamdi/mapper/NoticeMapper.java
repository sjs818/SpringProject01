package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.adregamdi.dto.NoticeDTO;

public interface NoticeMapper {

	@Select("SELECT N.NOTICE_NO, U.USER_ID CONTENT_NOTICE_USER_NO, N.NOTICE_TITLE, N.NOTICE_CNT, "
			+ " TO_CHAR(N.NOTICE_DATE, 'YYYY-MM-DD HH24:MI:SS') NOTICE_DATE " + " FROM NOTICE N, USER_INFO U "
			+ " WHERE N.NOTICE_USER_NO = U.USER_NO " + " ORDER BY N.NOTICE_NO DESC")
	List<NoticeDTO> getNoticeList();

	@Select("SELECT N.NOTICE_NO, U.USER_NO NOTICE_USER_NO, U.USER_ID CONTENT_NOTICE_USER_NO, TO_CHAR(N.NOTICE_DATE, 'YYYY-MM-DD HH24:MI:SS') NOTICE_DATE, "
			+ "N.NOTICE_TITLE, N.NOTICE_CONTENT, N.NOTICE_CNT " + "FROM USER_INFO U, NOTICE N "
			+ "WHERE U.USER_NO = N.NOTICE_USER_NO " + "AND N.NOTICE_NO = #{content_idx}")
	NoticeDTO getNoticeContent(int content_idx);

	@Insert("INSERT INTO NOTICE(NOTICE_NO, NOTICE_USER_NO, NOTICE_TITLE, NOTICE_CNT, NOTICE_DATE, NOTICE_CONTENT) "
			+ "VALUES(NOTICE_SEQ.nextval, #{notice_user_no}, #{notice_title}, 0, SYSDATE, #{notice_content}) ")
	void InsertNoticeContent(NoticeDTO noticeDTO);

	@Update("UPDATE NOTICE SET NOTICE_TITLE=#{notice_title}, NOTICE_CONTENT=#{notice_content}, notice_date=SYSDATE "
			+ "WHERE NOTICE_NO = #{notice_no}")
	void modifyNoticeContent(NoticeDTO noticeModifyDTO);
	
	@Delete("DELETE FROM NOTICE WHERE NOTICE_NO=#{content_idx}")
	void deleteNoticeContent(int content_idx);
	
	}