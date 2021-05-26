package com.adregamdi.dto;

import lombok.Data;

@Data
public class TogetherReplyDTO {
	private int reply_num;
	private int together_num;
	private String reply_writer;
	private String reply_content;
	private String reply_date;
}
