package com.adregamdi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.adregamdi.dto.PlanDTO;
import com.adregamdi.dto.UserDTO;

public interface UserMapper {
	
	
	@Select("SELECT USER_NAME FROM USER_INFO WHERE USER_ID = #{user_id}")
	String checkID(String user_id);
	
	@Select("SELECT USER_NO FROM USER_INFO WHERE USER_PHONE = #{user_phone}")
	Integer checkPhone(String user_phone);
	
	@Insert("INSERT INTO USER_INFO VALUES(USER_INFO_SEQ.NEXTVAL, #{user_name}, #{user_id},  #{user_pw},  #{user_email},  #{user_phone}, #{user_provider})")
	void addUserInfo(UserDTO joinUserDTO);

	@Select("SELECT USER_ID, USER_NO, USER_NAME, USER_EMAIL, USER_PHONE, USER_PROVIDER FROM USER_INFO WHERE USER_ID=#{user_id}")
	UserDTO getLoginUser(UserDTO tmpLoginUserDTO);
	
	@Select("SELECT USER_PW FROM USER_INFO WHERE USER_ID=#{user_id}")
	String getPw(String user_id);
	
	@Select("SELECT USER_ID, USER_NAME, USER_EMAIL, USER_PHONE FROM USER_INFO WHERE USER_NO=#{user_no}")
	UserDTO getModifyUserDTO(int user_idx);

	@Update("UPDATE USER_INFO SET USER_PW=#{user_pw}, USER_EMAIL=#{user_email}, USER_PHONE=#{user_phone} WHERE USER_NO=#{user_no}")
	void modifyUserInfo(UserDTO modifyUserDTO);
	
	@Delete("DELETE FROM USER_INFO WHERE user_no in(SELECT user_no FROM user_info WHERE user_id=#{user_id} AND user_pw=#{user_pw})")
	void deleteUserInfo(UserDTO deleteUserDTO);

	@Delete("DELETE FROM USER_INFO WHERE user_no in(SELECT user_no FROM user_info WHERE user_email=#{user_email} AND user_phone=#{user_phone})")
	void deleteNaverInfo(UserDTO deleteUserDTO);
	
	
	
	@Select("SELECT A.PLAN_NO, A.USER_NO, A.PLAN_TITLE, A.PLAN_INFO, A.PLAN_IMG, B.PLANTOTALDATE PLAN_TERM FROM PLAN A JOIN (SELECT PLAN_NO, AVG(PLANTOTALDATE) PLANTOTALDATE FROM USER_PLAN GROUP BY PLAN_NO) B ON A.PLAN_NO = B.PLAN_NO WHERE A.PLAN_PRIVATE = 'N' ORDER BY PLAN_NO DESC AND A.USER_NO=#{user_no}")
	List<PlanDTO> getMyPlan(int user_no);
	
	@Select("SELECT COUNT(*) FROM PLAN A JOIN (SELECT PLAN_NO, AVG(PLANTOTALDATE) PLANTOTALDATE FROM USER_PLAN GROUP BY PLAN_NO) B ON A.PLAN_NO = B.PLAN_NO WHERE A.PLAN_PRIVATE = 'N' AND A.USER_NO=#{user_no})")
	String getPlanCount(int user_no);
	
}
