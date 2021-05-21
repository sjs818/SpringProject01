package com.adregamdi.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.SelectKey;

import com.adregamdi.dto.SpotLikeDTO;

public interface SpotMapper {
	
	@SelectKey(statement="select spot_like_seq.nextval from dual", keyProperty="like_idx", before=true, resultType=int.class)
	//@SelectKey(statement="select content_seq.nextval from dual", keyProperty="content_idx", before=true, resultType=int.class)
	
	@Insert("INSERT INTO SPOT_LIKE_INFO VALUES ( #{like_idx}, #{content_id}, #{like_cnt})")
	void inputContentId(SpotLikeDTO likeDTO);
}
