package com.adregamdi.dto;

import lombok.Data;

@Data
public class SpotDTO {
	// 게시글 별 좋아요, 리뷰 버튼.....
	String contentId;
	
	// 좋아요 수
	int like_cnt;
	
	boolean like_check;
	
	// 리뷰 수
	int review_cnt;
	
	// 리뷰 내용
	String review;
	
	public SpotDTO() {
		like_cnt = 0;
		like_check = false;
		review_cnt = 0;
	}
}
