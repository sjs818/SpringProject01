package com.adregamdi.dto;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private int review_idx;
	private String content_id;
	private int user_no;
	private String review_date;
	private String review_content;
	private String user_name;
}
