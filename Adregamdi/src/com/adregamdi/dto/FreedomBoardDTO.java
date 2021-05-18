package com.adregamdi.dto;

import lombok.Data;

@Data
public class FreedomBoardDTO {
	private int free_no;
	private int free_content_writer_idx;
	private String content_writer_id;
	private String free_title;
	private int free_cnt;
	private String content_date;
	private String free_content;
	private String free_user_pw;
}