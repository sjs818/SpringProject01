package com.adregamdi.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.mapper.SpotMapper;

@Repository
public class SpotDAO {

	@Autowired
	SpotMapper spotMapper;
}
