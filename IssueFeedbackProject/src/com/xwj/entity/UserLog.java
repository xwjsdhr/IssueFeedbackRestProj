package com.xwj.entity;

import java.io.Serializable;

public class UserLog implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 139941674675496314L;
	
	private Integer id;
	
	private User user;
	
//	private LogType logType;
	
	private String logTime;
	
	private String ipAddr;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

//	public LogType getLogType() {
//		return logType;
//	}
//
//	public void setLogType(LogType logType) {
//		this.logType = logType;
//	}

	public String getLogTime() {
		return logTime;
	}

	public void setLogTime(String logTime) {
		this.logTime = logTime;
	}

	public String getIpAddr() {
		return ipAddr;
	}

	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
