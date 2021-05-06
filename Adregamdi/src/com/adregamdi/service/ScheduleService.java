package com.adregamdi.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adregamdi.dao.ScheduleDAO;
import com.adregamdi.dto.PageDTO;
import com.adregamdi.dto.ScheduleDTO;

@Service
public class ScheduleService {
	
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	public void writeSchedule(ScheduleDTO writeScheduleDTO) {
		scheduleDAO.writeSchedule(writeScheduleDTO);
	}
	
	public List<ScheduleDTO> getScheduleList(int page, int listCnt) {
		int start = (page-1) * listCnt;
		RowBounds rowBounds = new RowBounds(start, listCnt);
		return scheduleDAO.getScheduleList(rowBounds);
	}
	
	public PageDTO getContentCnt(int currentPage, int listCnt) {
		int contentCnt = scheduleDAO.getContentCnt();
		PageDTO pageDTO = new PageDTO(contentCnt, currentPage, listCnt);
		return pageDTO;
	}
}
