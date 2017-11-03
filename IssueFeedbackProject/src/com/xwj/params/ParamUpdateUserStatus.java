package com.xwj.params;

public class ParamUpdateUserStatus {
	private Integer userId;
	private Integer userStatus;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public Integer getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}
	public ParamUpdateUserStatus(Integer userId, Boolean userStatus) {
		super();
		this.userId = userId;
		this.userStatus = userStatus ? 1 : 0;
	}
	

}
