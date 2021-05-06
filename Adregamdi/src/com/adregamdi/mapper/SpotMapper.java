package com.adregamdi.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.SelectKey;

import com.adregamdi.dto.SpotDTO;

public interface SpotMapper {

	// 여행지 등록하기
	@SelectKey(statement="select spot_idx_seq.nextval from dual", keyProperty="spot_idx", before=true, resultType=int.class)
	
	@Insert("insert into spot_info values (#{spot_idx}, #{spot_name}, #{local_no}, #{thema_no}, #{spot_content}, 1, #{spot_addr}, #{spot_cnt})")
	 void addSpotInfo(SpotDTO writeSpotDTO);
}
