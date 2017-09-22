package com.xwj.entity;

import java.io.Serializable;

public class Status implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7173807477593194299L;
	private Integer id;
	private String statusName;
	
	public Status() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Status(Integer id, String statusName) {
		super();
		this.id = id;
		this.statusName = statusName;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	@Override
	public String toString() {
		return "Status [id=" + id + ", statusName=" + statusName + "]";
	}
	
	
}
