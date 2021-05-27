package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.adregamdi.dto.NoticeDTO;

public interface NoticeMapper {
	
	  // 寃뚯떆湲� 由ъ뒪�듃
	  @Select("SELECT ROWNUM NOTICE_ROWNUM, N.NOTICE_NO, N.NOTICE_TITLE, N.NOTICE_CNT, " + 
	          "TO_CHAR(N.NOTICE_DATE, 'YYYY-MM-DD HH24:MI:SS') NOTICE_DATE, " + 
	          "U.USER_ID CONTENT_NOTICE_USER_NO " +
	          "FROM (SELECT * FROM NOTICE ORDER BY NOTICE_NO ASC) N, USER_INFO U " +
	          "WHERE N.NOTICE_USER_NO = U.USER_NO ORDER BY ROWNUM DESC ")
	  List<NoticeDTO> getNoticeList(RowBounds rowBounds);
	 
	  // 寃뚯떆湲� �씠�쟾湲�, �떎�쓬湲�
	  @Select("SELECT N.* " + 
	  		  "FROM (SELECT NOTICE_NO, TO_CHAR(NOTICE_DATE, 'YYYY-MM-DD HH24:MI:SS') NOTICE_DATE, " + 
	  		  "LEAD(NOTICE_NO, 1) OVER (ORDER BY NOTICE_NO DESC) AS NEXT_NO, " + 
	  		  "LEAD(NOTICE_TITLE, 1, '다음글이 없습니다.') OVER (ORDER BY NOTICE_NO DESC) AS NEXT_TITLE, " + 
	  		  "LAG(NOTICE_NO, 1) OVER (ORDER BY NOTICE_NO DESC) AS PRE_NO, " + 
	  		  "LAG(NOTICE_TITLE, 1, '이전글이 없습니다.') OVER (ORDER BY NOTICE_NO DESC) AS PRE_TITLE " + 
	  		  "FROM NOTICE) N WHERE N.NOTICE_NO = #{content_idx}")
	  NoticeDTO getNextPrev(int content_idx);
	  
    // 寃뚯떆湲� 蹂몃Ц �궡�슜
	@Select("SELECT N.NOTICE_NO, U.USER_NO NOTICE_USER_NO, U.USER_ID CONTENT_NOTICE_USER_NO, " + 
	        "TO_CHAR(N.NOTICE_DATE, 'YYYY-MM-DD HH24:MI:SS') NOTICE_DATE, " + 
			"N.NOTICE_TITLE, N.NOTICE_CONTENT, N.NOTICE_CNT FROM USER_INFO U, NOTICE N " + 
			"WHERE U.USER_NO = N.NOTICE_USER_NO AND N.NOTICE_NO = #{content_idx}")
	NoticeDTO getNoticeContent(int content_idx);
	
	// 寃뚯떆湲� �럹�씠吏�
	@Select("SELECT COUNT(*) FROM NOTICE ")
	int GetNoticeContentCount();
    
	// 寃뚯떆湲� 湲��벐湲�
	@Insert("INSERT INTO NOTICE(NOTICE_NO, NOTICE_USER_NO, NOTICE_TITLE, NOTICE_CNT, NOTICE_DATE, NOTICE_CONTENT) "
			+ "VALUES(NOTICE_SEQ.nextval, #{notice_user_no}, #{notice_title}, 0, SYSDATE, #{notice_content}) ")
	void InsertNoticeContent(NoticeDTO noticeDTO);
    
	// 寃뚯떆湲� �닔�젙
	@Update("UPDATE NOTICE SET NOTICE_TITLE=#{notice_title}, NOTICE_CONTENT=#{notice_content}, " + 
			"notice_date=SYSDATE WHERE NOTICE_NO = #{notice_no}")
	void modifyNoticeContent(NoticeDTO noticeModifyDTO);
	
	// 寃뚯떆湲� �궘�젣
	@Delete("DELETE FROM NOTICE WHERE NOTICE_NO=#{content_idx}")
	void deleteNoticeContent(int content_idx);
	
	// 寃뚯떆湲� 議고쉶�닔
	@Update("UPDATE NOTICE SET notice_cnt = notice_cnt + 1 WHERE notice_no = #{notice_cnt}")
	void viewCount(int content_idx);
	
	}