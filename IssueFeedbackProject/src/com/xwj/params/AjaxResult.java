package com.xwj.params;

import java.io.Serializable;

public class AjaxResult<T> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 658284297552522900L;

	private T result;
	
	private String msg;
	private Integer errorCode;
	public T getResult() {
		return result;
	}
	public void setResult(T result) {
		this.result = result;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(Integer errorCode) {
		this.errorCode = errorCode;
	}
	
	
}
