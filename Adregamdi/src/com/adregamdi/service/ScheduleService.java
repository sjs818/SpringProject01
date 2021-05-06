package com.adregamdi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.ScheduleDAO;
import com.adregamdi.dto.ScheduleDTO;

@Service
public class ScheduleService {
	
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	public void writeSchedule(ScheduleDTO writeScheduleDTO) {
		scheduleDAO.writeSchedule(writeScheduleDTO);
	}
}
