package com.adregamdi.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.adregamdi.dto.SpotDTO;

public interface SpotMapper {
	
	@SelectKey(statement="select spot_seq.nextval from dual", keyProperty="like_idx", before=true, resultType=int.class)
	
	@Insert("INSERT INTO SPOT_INFO VALUES ( #{like_idx}, #{content_id}, #{like_cnt}, #{review_cnt})")
	void inputContentId(SpotDTO spotDTO);
	
	@Update("UPDATE SPOT_INFO SET LIKE_CNT = LIKE_CNT + 1 WHERE CONTENT_ID= #{content_id}")
	void plusLikeCnt(String content_id);
	
	@Select("SELECT * FROM SPOT_INFO")
	ArrayList<SpotDTO> getSpotInfo();
	
	@Select("SELECT CONTENT_ID FROM  (SELECT *  FROM SPOT_INFO WHERE LIKE_IDX>=#{range_min} AND LIKE_IDX<=#{range_max} ORDER BY LIKE_CNT DESC) WHERE ROWNUM<=3")
	ArrayList<String> getBestSpotInfo(@Param("range_min")int range_min, @Param("range_max")int range_max);
	
	
	/*
	@Select("SELECT * FROM REVIEW WHERE CONTENT_ID = #{ content_id} ")
	ArrayList<ReviewDTO> getReviewInfo(@Param("content_id")String content_id);
	
	
	@SelectKey(statement="select REVIEW_SEQ.NEXTVAL from dual", keyProperty="review_idx", before=true, resultType=int.class)
	
	@Insert("INSERT INTO REVIEW VALUES (review_idx, #{content_id} , #{user_no}, to_char(SYSDATE, 'YYYY.MM.DD HH:MI'), #{review_content})")
	void inputReview(ReviewDTO reviewDTO);
	*/
}
