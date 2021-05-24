package com.adregamdi.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.SpotDAO;
import com.adregamdi.dto.SpotDTO;

@Service
@PropertySource("/WEB-INF/properties/options.properties")
public class SpotService {

	@Autowired
	SpotDAO spotDAO;
	
	public void inputContentId(SpotDTO spotDTO) {
		spotDAO.inputContentId(spotDTO);
	}
	
	public void plusLikeCnt(String content_id) {
		spotDAO.plusLikeCnt(content_id);
	}
	
	public ArrayList<SpotDTO> getSpotInfo() {
		return spotDAO.getSpotInfo();
	}
	
	public ArrayList<String> getBestSpotInfo(int range_min, int range_max) {
		System.out.println("Service");
		return spotDAO.getBestSpotInfo(range_min, range_max);
	}
}
