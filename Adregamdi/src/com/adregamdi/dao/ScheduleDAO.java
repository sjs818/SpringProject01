package com.adregamdi.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.dto.ScheduleDTO;
import com.adregamdi.mapper.ScheduleMapper;

@Repository
public class ScheduleDAO {
	
	@Autowired
	private ScheduleMapper scheduleMapper;
	
	public void writeSchedule(ScheduleDTO writeScheduleDTO) {
		scheduleMapper.writeSchedule(writeScheduleDTO);
	}
}