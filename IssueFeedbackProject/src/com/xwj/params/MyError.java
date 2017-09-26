package com.xwj.params;

import java.io.Serializable;

public class MyError implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4792046695605437693L;
	private String msg;
	private int errorCode;
	private String backAddr;
	
	public String getBackAddr() {
		return backAddr;
	}
	public void setBackAddr(String backAddr) {
		this.backAddr = backAddr;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}
	public MyError(String msg, int errorCode, String backAddr) {
		super();
		this.msg = msg;
		this.errorCode = errorCode;
		this.backAddr = backAddr;
	}
	
	

}
