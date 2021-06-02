package com.adregamdi.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter @Data @Getter
public class TogetherDTO {
	
	// 글번호
	private int to_no;
	// 작성자
	private String to_writer;
	// 글 제목
	private String to_title;
	// 장소
	private String to_place;
	// 장소 이름
	private String to_place_name;
	// 공고문
	private String to_content;
    // 작성날짜
	private String to_date;   
    // 현재 인원
	private int to_curr;    
    // 모집 인원
	private int to_total;   
    // 여행 날짜
	private String to_meet;   
    // 공고 현황
	private int to_state;
}
