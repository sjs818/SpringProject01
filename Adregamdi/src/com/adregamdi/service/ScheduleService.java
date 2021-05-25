package com.adregamdi.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.adregamdi.dao.ScheduleDAO;
import com.adregamdi.dto.PageDTO;
import com.adregamdi.dto.PlanDTO;
import com.adregamdi.dto.PlanImgDTO;
import com.adregamdi.dto.UserPlanDTO;

@Service
@PropertySource("/WEB-INF/properties/options.properties")
public class ScheduleService {
	
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	@Value("${path.plan_img}")
	private String path_plan_img;
	
	public PageDTO getContentCnt(int currentPage, int listCnt, int pagination) {
		int contentCnt = 10;
		PageDTO pageDTO = new PageDTO(contentCnt, currentPage, listCnt, pagination);
		return pageDTO;
	}
	
	public boolean createPlan(PlanDTO planDTO) {
		return scheduleDAO.createPlan(planDTO) > 0;
	}
	
	public int getPlanNo() {
		return scheduleDAO.getPlanNo();
	}
	
	public List<UserPlanDTO> convertSchedule(String data) throws ParseException {
		List<UserPlanDTO> schedule = new ArrayList<UserPlanDTO>();
		JSONParser parser = new JSONParser();
		JSONObject object = (JSONObject) parser.parse(data);
		JSONArray arr = (JSONArray) object.get("data");
		for(int i = 0; i < arr.size(); i++) {
			UserPlanDTO plan = new UserPlanDTO();
			JSONObject obj = (JSONObject) arr.get(i);
			plan.setPlan_no(Integer.parseInt(obj.get("planNo").toString()));
			plan.setTitle(obj.get("title").toString());
			plan.setPlanDate(obj.get("planDate").toString());
			plan.setPlanDay(obj.get("planDay").toString());
			plan.setPlanTotalDate(obj.get("planTotalDate").toString());
			if(obj.get("descript") != null) {
        plan.setDescript(obj.get("descript").toString());
			} else {
				plan.setDescript("");
			}
			plan.setStartDate(obj.get("startDate").toString());
			plan.setEndDate(obj.get("endDate").toString());
			plan.setIs_insertAfter(obj.get("is_insertAfter").toString());
			schedule.add(plan);
		}
		return schedule;
	}
	
	public List<UserPlanDTO> convertUserPlan(String data) throws ParseException {
		List<UserPlanDTO> list = new ArrayList<UserPlanDTO>();
		JSONParser parser = new JSONParser();
		JSONObject object = (JSONObject) parser.parse(data);
		JSONArray arr = (JSONArray) object.get("data");
		for(int i = 0; i < arr.size(); i++) {
			UserPlanDTO plan = new UserPlanDTO();
			JSONObject obj = (JSONObject) arr.get(i);
			plan.setPlan_no(Integer.parseInt((String)obj.get("planno")));
			plan.setTitle((String)obj.get("title"));
			plan.setContentId((String)obj.get("contentId"));
			plan.setContentTypeId((String)obj.get("contentTypeId"));
			plan.setAddr((String)obj.get("addr"));
			plan.setImg_src((String)obj.get("img"));
			JSONObject lonlat = (JSONObject) obj.get("lonlat");
			plan.setMapX(lonlat.get("_lng").toString());
			plan.setMapY(lonlat.get("_lat").toString());
			plan.setPlanDate((String)obj.get("planDate"));
			plan.setPlanDay((String)obj.get("planDay"));
			plan.setPlanTotalDate((String)obj.get("planTotalDate"));
			list.add(plan);
		}
		return list;
	}
	
	public boolean insertUserPlan(UserPlanDTO userPlanDTO) {
		return scheduleDAO.insertUserPlan(userPlanDTO) > 0;
	}
	
	public PlanDTO getPlan(int plan_no) {
		return scheduleDAO.getPlan(plan_no);
	}
	
	public List<UserPlanDTO> getUserPlanCreate(int plan_no) {
		return scheduleDAO.getUserPlanCreate(plan_no);
	}
	
	private String saveUploadFile(MultipartFile upload_img) throws IllegalStateException, IOException {
		String file_name = System.currentTimeMillis() + "_" + upload_img.getOriginalFilename();
		upload_img.transferTo(new File(path_plan_img + "/" + file_name));
		
		return file_name;
	}
	
	public void uploadPlanImg(PlanImgDTO planImgDTO) throws IllegalStateException, IOException {
		
		MultipartFile upload_img = planImgDTO.getUpload_img();
		
		if(upload_img.getSize() > 0) {
			String file_name = saveUploadFile(upload_img);
			planImgDTO.setPlan_img("/images/schedule/" + file_name);
		}
		
		scheduleDAO.uploadPlanImg(planImgDTO);
	}
	
	public void updatePlanImg(PlanImgDTO planImgDTO) {
		scheduleDAO.updatePlanImg(planImgDTO);
	}
	
	public boolean updatePlan(PlanDTO planDTO) {
		return scheduleDAO.updatePlan(planDTO) > 0;
	}
	
	public boolean deleteSchedule(UserPlanDTO userPlanDTO) {
		return scheduleDAO.deleteSchedule(userPlanDTO) > 0;
	}
	
	public boolean updateSchedule(UserPlanDTO userPlanDTO) {
		return scheduleDAO.updateSchedule(userPlanDTO) > 0;
	}
}