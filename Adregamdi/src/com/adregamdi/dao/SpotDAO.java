package com.adregamdi.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adregamdi.mapper.SpotMapper;

@Repository
public class SpotDAO {

	@Autowired
	SpotMapper spotMapper;
	
	public void inputContentId(SpotDTO likeDTO) {
		spotMapper.inputContentId(likeDTO);
	}
	
	public void plusLikeCnt(String content_id) {
		spotMapper.plusLikeCnt(content_id);
	}
	
	public ArrayList<SpotDTO> getSpotInfo() {
		return spotMapper.getSpotInfo();
	}
	
	public ArrayList<String> getBestSpotInfo(int range_min, int range_max) {
		return spotMapper.getBestSpotInfo(range_min, range_max);
	}
	
	
	/*
	public ArrayList<ReviewDTO> getReviewInfo(String content_id) {
		System.out.println("result : " + spotMapper.getReviewInfo(content_id).size());
		return spotMapper.getReviewInfo(content_id);
	}
	
	public void inputReview(ReviewDTO reviewDTO) {
		spotMapper.inputReview(reviewDTO);
	}*/
}
