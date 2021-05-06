package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.adregamdi.dto.ScheduleDTO;

public interface ScheduleMapper {
	
	@Insert("INSERT INTO schedule VALUES(SCHEDULE_SEQ.NEXTVAL, 1, #{schedule_start}, #{schedule_end}, #{schedule_title}, #{schedule_content}, SYSDATE)")
	void writeSchedule(ScheduleDTO writeScheduleDTO);
	
	@Select("SELECT ROWNUM SCHEDULE_ROWNO, SCHEDULE_NO, SCHEDULE_WRITER, SCHEDULE_TITLE, TO_CHAR(SCHEDULE_DATE, 'YYYY-MM-DD') SCHEDULE_DATE FROM (SELECT * FROM SCHEDULE ORDER BY schedule_date DESC)")
	List<ScheduleDTO> getScheduleList(RowBounds rowBounds);
	
	@Select("SELECT COUNT(*) FROM SCHEDULE")
	int getContentCnt();
	
	@Select("SELECT SCHEDULE_NO, SCHEDULE_WRITER,TO_CHAR(SCHEDULE_START, 'YYYY-MM-DD') SCHEDULE_START, TO_CHAR(SCHEDULE_END, 'YYYY-MM-DD') SCHEDULE_END, SCHEDULE_TITLE, SCHEDULE_CONTENT, SCHEDULE_DATE FROM SCHEDULE WHERE SCHEDULE_NO = #{schedule_no}")
	ScheduleDTO getSchedule(int schedule_no);
	
	@Delete("DELETE FROM SCHEDULE WHERE SCHEDULE_NO = #{schedule_no}")
	void deleteSchedule(int schedule_no);
}
