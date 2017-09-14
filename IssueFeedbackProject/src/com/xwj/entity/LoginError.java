package com.xwj.entity;

import java.io.Serializable;

public class LoginError implements Serializable{
	
	private String errorMsg;
	private int errorCode;
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public int getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}
	

}
