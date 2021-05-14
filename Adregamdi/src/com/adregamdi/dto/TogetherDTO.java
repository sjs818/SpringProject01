package com.adregamdi.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter @Data @Getter
public class TogetherDTO {
	
	// 글번호
	private int to_no;
	// 작성자
	private int to_writer;
	// 글 제목
	private String to_title;
	// 조회수
	private int to_cnt;
	// 작성날짜
	private String to_date;
	// 글 내용
	private String to_content;
}
