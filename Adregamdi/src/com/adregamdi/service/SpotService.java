package com.adregamdi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.SpotDAO;

@Service
@PropertySource("/WEB-INF/properties/options.properties")
public class SpotService {

	@Autowired
	SpotDAO spotDAO;
}
