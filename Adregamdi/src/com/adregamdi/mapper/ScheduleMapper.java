 package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.adregamdi.dto.PlanDTO;
import com.adregamdi.dto.PlanImgDTO;
import com.adregamdi.dto.UserPlanDTO;

public interface ScheduleMapper {

	@Insert("INSERT INTO PLAN VALUES(PLAN_SEQ.NEXTVAL, 1, #{plan_title}, #{plan_info}, #{plan_img}, #{plan_private})")
	int createPlan(PlanDTO planDTO);

	@Select("SELECT PLAN_SEQ.CURRVAL FROM DUAL")
	int getPlanNo();
	
	@Select("SELECT ROWNUM, A.PLAN_NO, A.USER_NO, A.PLAN_TITLE, A.PLAN_INFO, A.PLAN_IMG, B.PLANTOTALDATE FROM (SELECT * FROM PLAN WHERE PLAN_PRIVATE = #{plan_private} ORDER BY PLAN_NO DESC) A, USER_PLAN B WHERE A.PLAN_NO = B.PLAN_NO")
	List<PlanDTO> getPlanList(String plan_private, RowBounds rowbounds);
	
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
	
	@Delete("DELETE FROM USER_PLAN WHERE PLAN_NO = #{plan_no } AND IS_INSERTAFTER = 'Y'")
	int deleteSchedule(UserPlanDTO userPlanDTO);
	
	@Update("MERGE INTO USER_PLAN USING DUAL ON (PLAN_NO = #{plan_no } AND TITLE = #{title }) WHEN MATCHED THEN UPDATE SET PLANDAY = #{planDay }, PLANDATE = #{planDate }, PLANTOTALDATE = #{planTotalDate }, STARTDATE = #{startDate }, ENDDATE = #{endDate }, DESCRIPT = #{descript } WHEN NOT MATCHED THEN INSERT (PLAN_NO, USER_NO, TITLE, PLANDATE, PLANDAY, PLANTOTALDATE, STARTDATE, ENDDATE, DESCRIPT, IS_INSERTAFTER) VALUES (#{plan_no }, 1, #{title }, #{planDate }, #{planDay }, #{planTotalDate }, #{startDate }, #{endDate }, #{descript }, #{is_insertAfter })")
	int updateSchedule(UserPlanDTO userPlanDTO);
}