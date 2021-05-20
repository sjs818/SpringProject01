package com.adregamdi.dto;

import lombok.Data;

@Data
public class SpotReviewDTO {
	// 게시글 별 좋아요, 리뷰 버튼.....
	String contentId;
	
	// 리뷰 내용
	String review;
	
}
