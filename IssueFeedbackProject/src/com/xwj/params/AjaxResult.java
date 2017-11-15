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


	private AjaxResult(T result, String msg, Integer errorCode) {
		super();
		this.result = result;
		this.msg = msg;
		this.errorCode = errorCode;
	}


	public static class Builder<T>{
		private T nestedResult;
		
		private String nestedMsg;
		private Integer nestedErrorCode;
		
		
		public Builder<T> result(T result){
			this.nestedResult = result;
			return this;
		}
		public Builder<T> message(String msg){
			this.nestedMsg = msg;
			return this;
		}
		public Builder<T> errorCode(Integer errorCode){
			this.nestedErrorCode = errorCode;
			return this;
		}
		
		public AjaxResult<T> build(){
			return new AjaxResult<T>(nestedResult, nestedMsg, nestedErrorCode);
		}
	}
	
	
	public static final class ErrorCode{
		
		public static final Integer ERRORCODE_SUCCESS = -1;
		public static final Integer ERRORCODE_USER_LOGINED = 1;
		public static final Integer ERRORCODE_NO_USER = 2;
		public static final Integer ERRORCODE_NO_SUCH_PERMISSION = 3;
		
		public static final Integer ERRORCODE_NO_CONTENT = 4;
		
	}
}
