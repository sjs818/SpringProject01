package com.adregamdi.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.adregamdi.dto.SpotDTO;

public interface SpotMapper {

	// 여행지 등록하기
	@SelectKey(statement="SELECT SPOT_SEQ.NEXTVAL FROM DUAL", keyProperty="spot_idx", before=true, resultType=int.class)
	
	@Insert("INSERT INTO SPOT_INFO (spot_idx, spot_name, local_no, thema_no, spot_content, spot_writer, spot_addr, spot_file) VALUES ( #{spot_idx}, #{spot_name}, #{local_no}, #{thema_no}, #{spot_content}, 1, #{spot_addr}, #{spot_file, jdbcType=VARCHAR})")
	 void addSpotInfo(SpotDTO writeSpotDTO);
	
	// 1개의 데이터 읽어오기
	@Select("SELECT * FROM spot_info WHERE spot_idx=#{spot_idx}")
	SpotDTO getSpotInfo(int spot_idx);
	
	// 수정하기
	@Update("UPDATE SPOT_INFO SET spot_name = #{spot_name}, local_no = #{local_no}, thema_no = #{thema_no}, spot_content = #{spot_content}, spot_writer = #{spot_writer}, spot_addr = #{spot_addr}, spot_file = #{spot_file, jdbcType=VARCHAR} WHERE spot_idx = #{spot_idx}")
	void updateSpotInfo(SpotDTO modifySpotDTO);
	
	// 삭제하기
	@Delete("DELETE FROM SPOT_INFO WHERE spot_idx = #{spot_idx}")
	void deleteSpotInfo(int spot_idx);
	
	
}
