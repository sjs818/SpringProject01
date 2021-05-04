package com.adregamdi.mapper;

import org.apache.ibatis.annotations.Insert;

import com.adregamdi.dto.ScheduleDTO;

public interface ScheduleMapper {
	
	@Insert("INSERT INTO schedule VALUES(SCHEDULE_SEQ.NEXTVAL, 1, #{schedule_start}, #{schedule_end}, #{schedule_title}, #{schedule_content}, SYSDATE)")
	void writeSchedule(ScheduleDTO writeScheduleDTO);
}
