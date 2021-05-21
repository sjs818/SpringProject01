package com.adregamdi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.SpotDAO;
import com.adregamdi.dto.SpotLikeDTO;

@Service
@PropertySource("/WEB-INF/properties/options.properties")
public class SpotService {

	@Autowired
	SpotDAO spotDAO;
	
	public void inputContentId(SpotLikeDTO likeDTO) {
		spotDAO.inputContentId(likeDTO);
	}
}
