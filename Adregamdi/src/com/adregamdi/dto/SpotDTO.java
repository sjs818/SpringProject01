package com.adregamdi.dto;

import org.springframework.web.multipart.MultipartFile;

public class SpotDTO {
	
	private int spot_idx;
    private String spot_name;
    private int local_no;
    private int thema_no;
    private String spot_content;
    private int spot_writer;
    private String spot_addr;
    private MultipartFile upload_file;
    private int spot_cnt;
    
    private int check;				// 어떤 페이지에서 넘어왔는지 확인하기(1:지역, 2:테마)
    private String content_file;

	public String getContent_file() {
		return content_file;
	}

	public void setContent_file(String content_file) {
		this.content_file = content_file;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	public int getSpot_idx() {
		return spot_idx;
	}

	public void setSpot_idx(int spot_idx) {
		this.spot_idx = spot_idx;
	}

	public String getSpot_name() {
		return spot_name;
	}

	public void setSpot_name(String spot_name) {
		this.spot_name = spot_name;
	}

	public int getLocal_no() {
		return local_no;
	}

	public void setLocal_no(int local_no) {
		this.local_no = local_no;
	}

	public int getThema_no() {
		return thema_no;
	}

	public void setThema_no(int thema_no) {
		this.thema_no = thema_no;
	}

	public String getSpot_content() {
		return spot_content;
	}

	public void setSpot_content(String spot_content) {
		this.spot_content = spot_content;
	}

	public int getSpot_writer() {
		return spot_writer;
	}

	public void setSpot_writer(int spot_writer) {
		this.spot_writer = spot_writer;
	}

	public String getSpot_addr() {
		return spot_addr;
	}

	public void setSpot_addr(String spot_addr) {
		this.spot_addr = spot_addr;
	}

	public MultipartFile getUpload_file() {
		return upload_file;
	}

	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}

	public int getSpot_cnt() {
		return spot_cnt;
	}

	public void setSpot_cnt(int spot_cnt) {
		this.spot_cnt = spot_cnt;
	}
}
