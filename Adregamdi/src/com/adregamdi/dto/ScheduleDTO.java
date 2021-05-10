package com.adregamdi.dto;


import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ScheduleDTO {
	private int    schedule_rowno;
	private int    schedule_no;
	private int    schedule_writer;
	private String schedule_start;
	private String schedule_end;
	private String schedule_title;
	private String schedule_content;
	private String schedule_date;
	public int getSchedule_rowno() {
		return schedule_rowno;
	}
	public void setSchedule_rowno(int schedule_rowno) {
		this.schedule_rowno = schedule_rowno;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public int getSchedule_writer() {
		return schedule_writer;
	}
	public void setSchedule_writer(int schedule_writer) {
		this.schedule_writer = schedule_writer;
	}
	public String getSchedule_start() {
		return schedule_start;
	}
	public void setSchedule_start(String schedule_start) {
		this.schedule_start = schedule_start;
	}
	public String getSchedule_end() {
		return schedule_end;
	}
	public void setSchedule_end(String schedule_end) {
		this.schedule_end = schedule_end;
	}
	public String getSchedule_title() {
		return schedule_title;
	}
	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}
	public String getSchedule_content() {
		return schedule_content;
	}
	public void setSchedule_content(String schedule_content) {
		this.schedule_content = schedule_content;
	}
	public String getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}
	
}