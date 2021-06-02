package com.adregamdi.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter @Data @Getter
public class TogetherDTO {
	
	// 게시글번호
	private int to_no;

	// 회원번호
	private String to_writer;
	// 공고제목
	private String to_title;
	// 여행장소
	private String to_place;
	// 공고문
	private String to_content;
	// 작성날짜
	private String to_date;
	// 현재인원
	private int to_curr;
	// 모집인원
	private int to_total;
	// 여행날짜
	private String to_meet;
	// 공고현황
	private int to_state;
	
	// 유저 비밀번호
	private String to_user_pw;
	// 유저 ID
	private String to_id;
	
}
