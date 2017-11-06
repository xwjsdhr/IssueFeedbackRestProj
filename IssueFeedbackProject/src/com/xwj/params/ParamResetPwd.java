package com.xwj.params;

public class ParamResetPwd {

	private Integer userId;
	private String pwd;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public ParamResetPwd(Integer userId, String pwd) {
		super();
		this.userId = userId;
		this.pwd = pwd;
	}
	
	
}
