package com.adregamdi.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.adregamdi.dao.SpotDAO;
import com.adregamdi.dto.SpotDTO;

@Service
@PropertySource("/WEB-INF/properties/options.properties")
public class SpotService {

	@Autowired
	SpotDAO spotDAO;
}
