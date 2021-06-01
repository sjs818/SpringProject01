package com.adregamdi.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SubscriptionDTO {
	private int sub_no;
	private int to_no;
	private int to_writer;
	private String sub_message;
	private int sub_writer;
	private String sub_status;
	private Date sub_date;
	private String notifi_writer;
}
