package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.adregamdi.dto.PlanDTO;
import com.adregamdi.dto.PlanImgDTO;
import com.adregamdi.dto.ScheduleDTO;
import com.adregamdi.dto.UserPlanDTO;

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

	@Insert("INSERT INTO PLAN VALUES(PLAN_SEQ.NEXTVAL, 1, #{plan_title}, #{plan_info}, #{plan_img})")
	int createPlan(PlanDTO planDTO);

	@Select("SELECT PLAN_SEQ.CURRVAL FROM DUAL")
	int getPlanNo();
	
	@Insert("INSERT INTO USER_PLAN (PLAN_NO, USER_NO, TITLE, CONTENTID, CONTENTTYPEID, ADDR, IMG_SRC, MAPX, MAPY, PLANDATE, PLANDAY, PLANTOTALDATE) VALUES (#{plan_no}, 1, #{title}, #{contentId}, #{contentTypeId}, #{addr}, #{img_src}, #{mapX}, #{mapY}, #{planDate}, #{planDay}, #{planTotalDate})")
	int insertUserPlan(UserPlanDTO userPlanDTO);
	
	@Select("SELECT * FROM PLAN WHERE PLAN_NO = #{plan_no }")
	PlanDTO getPlan(int plan_no);
	
	@Select("SELECT * FROM USER_PLAN WHERE PLAN_NO = #{plan_no } AND IS_INSERTAFTER = 'N'")
	List<UserPlanDTO> getUserPlanCreate(int plan_no);
	
	@Insert("INSERT INTO PLAN_IMG VALUES(#{plan_no }, 1, #{plan_img }, SYSDATE)")
	void uploadPlanImg(PlanImgDTO planImgDTO);
	
	@Update("UPDATE PLAN SET PLAN_IMG = #{plan_img } WHERE PLAN_NO = #{plan_no }")
	void updatePlanImg(PlanImgDTO planImgDTO);
	
	@Update("UPDATE PLAN SET PLAN_TITLE = #{plan_title }, PLAN_INFO = #{plan_info } WHERE PLAN_NO = #{plan_no }")
	int updatePlan(PlanDTO planDTO);
}