package com.xwj.params;

import java.io.Serializable;

public class SearchCondition implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -215593645465296543L;
	private Integer id;
	private Integer statusId;
	private Integer year;
	private Integer week;
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getWeek() {
		return week;
	}
	public void setWeek(Integer week) {
		this.week = week;
	}
	@Override
	public String toString() {
		return "SearchCondition [statusId=" + statusId + ", year=" + year + ", week=" + week + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	
	
	
}