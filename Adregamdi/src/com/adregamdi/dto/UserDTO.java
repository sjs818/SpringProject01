package com.adregamdi.dto;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserDTO {
	
	private int 	user_no;
	
	@Size(min=1, max=6)
	@Pattern(regexp = "[가-힣]*")
	private String  user_name; 
	
	@Size(min=3, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String  user_id;
	
	@Size(min=7, max=20)
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d$@$!%*#?&]{7,}$")
	private String  user_pw;
	
	@Size(min=2, max=50)
	@Pattern(regexp = "^[a-zA-Z0-9]+@[a-z.-]+\\.[a-z]{2,6}$")
	private String  user_email;
	
	@Size(min=10, max=12)
	@Pattern(regexp = "[0-9]*")
	private String 	user_phone;
	
	
	private boolean inputUserID;
	private boolean userLogin;
	private boolean checkBox;
	

	
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	
	public UserDTO() {
		this.setInputUserID(false);
		this.setUserLogin(false);
		this.setCheckBox(false);
	}
	
	public boolean isInputUserID() {
		return inputUserID;
	}
	public void setInputUserID(boolean inputUserID) {
		this.inputUserID = inputUserID;
	}
	public boolean isUserLogin() {
		return userLogin;
	}
	public void setUserLogin(boolean userLogin) {
		this.userLogin = userLogin;
	}
	public boolean isCheckBox() {
		return checkBox;
	}
	public void setCheckBox(boolean checkBox) {
		this.checkBox = checkBox;
	}
	


	
}
