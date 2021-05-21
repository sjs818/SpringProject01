package com.adregamdi.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.dto.SpotLikeDTO;
import com.adregamdi.mapper.SpotMapper;

@Repository
public class SpotDAO {

	@Autowired
	SpotMapper spotMapper;
	
	public void inputContentId(SpotLikeDTO likeDTO) {
		spotMapper.inputContentId(likeDTO);
	}
	
	public void plusLikeCnt(String content_id) {
		spotMapper.plusLikeCnt(content_id);
	}
	
	public ArrayList<SpotLikeDTO> getLikeInfo() {
		return spotMapper.getLikeInfo();
	}
}
