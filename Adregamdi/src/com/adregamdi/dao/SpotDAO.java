package com.adregamdi.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.dto.SpotDTO;
import com.adregamdi.mapper.SpotMapper;

@Repository
public class SpotDAO {

	@Autowired
	SpotMapper spotMapper;
	
	public void addSpotInfo(SpotDTO writeSpotDTO) {
		spotMapper.addSpotInfo(writeSpotDTO);
	}
	
	public SpotDTO getSpotInfo(int spot_idx) {
		return spotMapper.getSpotInfo(spot_idx);
	}
	
	public void updateSpotInfo(SpotDTO modifySpotDTO) {
		spotMapper.updateSpotInfo(modifySpotDTO);
	}
	
	public void deleteSpotInfo(int spot_idx) {
		spotMapper.deleteSpotInfo(spot_idx);
	}
}
