package com.adregamdi.dto;

import lombok.Data;

@Data
public class SpotLikeDTO {
	
	private int like_idx;
	private String content_id;
	private int like_cnt;
	
	public SpotLikeDTO() {
		like_cnt = 0;
	}
}
