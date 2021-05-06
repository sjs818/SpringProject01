package com.adregamdi.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.dto.TogetherDTO;
import com.adregamdi.mapper.TogetherMapper;

@Repository
public class TogetherDAO {
	
	@Autowired
	private TogetherMapper togetherMapper;
	
	public void writeTogether(TogetherDTO writeTogetherDTO)	{
		
	}
	
	

}
