package com.adregamdi.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.adregamdi.dto.SpotDTO;

public interface SpotMapper {

	// 여행지 등록하기
	@SelectKey(statement="SELECT SPOT_SEQ.NEXTVAL FROM DUAL", keyProperty="spot_idx", before=true, resultType=int.class)
	
	@Insert("INSERT INTO SPOT_INFO VALUES ( #{spot_idx}, #{spot_name}, #{local_no}, #{thema_no}, #{spot_content}, 1, #{spot_addr})")
	 void addSpotInfo(SpotDTO writeSpotDTO);
	
	// 1개의 데이터 읽어오기
	@Select("SELECT * FROM spot_info WHERE spot_idx=#{spot_idx}")
	SpotDTO getSpotInfo(int spot_idx);
}
