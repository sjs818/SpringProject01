package com.adregamdi.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.dto.PlanDTO;
import com.adregamdi.dto.PlanImgDTO;
import com.adregamdi.dto.ScheduleDTO;
import com.adregamdi.dto.UserPlanDTO;
import com.adregamdi.mapper.ScheduleMapper;

@Repository
public class ScheduleDAO {
	
	@Autowired
	private ScheduleMapper scheduleMapper;
	
	public void writeSchedule(ScheduleDTO writeScheduleDTO) {
		scheduleMapper.writeSchedule(writeScheduleDTO);
	}
	
	public List<ScheduleDTO> getScheduleList(RowBounds rowBounds) {
		return scheduleMapper.getScheduleList(rowBounds);
	}
	
	public int getContentCnt() {
		return scheduleMapper.getContentCnt();
	}
	
	public ScheduleDTO getSchedule(int schedule_no) {
		return scheduleMapper.getSchedule(schedule_no);
	}
	
	public void deleteSchedule(int schedule_no) {
		scheduleMapper.deleteSchedule(schedule_no);
	}
	
	public int createPlan(PlanDTO planDTO) {
		return scheduleMapper.createPlan(planDTO);
	}
	
	public int getPlanNo() {
		return scheduleMapper.getPlanNo();
	}
	
	public int insertUserPlan(UserPlanDTO userPlanDTO) {
		return scheduleMapper.insertUserPlan(userPlanDTO);
	}
	
	public PlanDTO getPlan(int plan_no) {
		return scheduleMapper.getPlan(plan_no);
	}
	
	public List<UserPlanDTO> getUserPlanCreate(int plan_no) {
		return scheduleMapper.getUserPlanCreate(plan_no);
	}
	
	public void uploadPlanImg(PlanImgDTO planImgDTO) {
		scheduleMapper.uploadPlanImg(planImgDTO);
	}
	
	public void updatePlanImg(PlanImgDTO planImgDTO) {
		scheduleMapper.updatePlanImg(planImgDTO);
	}
}
