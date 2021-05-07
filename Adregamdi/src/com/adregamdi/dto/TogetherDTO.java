package com.adregamdi.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Setter;

@Setter @Data
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
	// 첨부파일
	private MultipartFile upload_file;
}
