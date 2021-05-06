package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.adregamdi.dto.ScheduleDTO;

public interface ScheduleMapper {
	
	@Insert("INSERT INTO schedule VALUES(SCHEDULE_SEQ.NEXTVAL, 1, #{schedule_start}, #{schedule_end}, #{schedule_title}, #{schedule_content}, SYSDATE)")
	void writeSchedule(ScheduleDTO writeScheduleDTO);
	
	@Select("SELECT ROWNUM SCHEDULT_ROWNO, SCHEDULE_NO, SCHEDULE_WRITER, SCHEDULE_START, SCHEDULE_END, SCHEDULE_TITLE, SCHEDULE_CONTENT, TO_CHAR(SCHEDULE_DATE, 'YYYY-MM-DD') SCHEDULE_DATE FROM (SELECT * FROM SCHEDULE ORDER BY schedule_date DESC)")
	List<ScheduleDTO> getScheduleList(RowBounds rowBounds);
	
	@Select("SELECT COUNT(*) FROM SCHEDULE")
	int getContentCnt();
}
