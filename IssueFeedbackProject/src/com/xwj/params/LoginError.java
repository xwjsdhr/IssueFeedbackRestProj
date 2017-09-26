package com.xwj.params;

import java.io.Serializable;

public class LoginError implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7385027907416104253L;
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
