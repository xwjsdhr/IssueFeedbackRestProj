package com.xwj.params;

import java.io.Serializable;

public class ParamStatistics implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 964912516103295798L;
	private Integer year,month,week;
	private String type;
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	public Integer getWeek() {
		return week;
	}
	public void setWeek(Integer week) {
		this.week = week;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public ParamStatistics(Integer year, Integer month, Integer week, String type) {
		super();
		this.year = year;
		this.month = month;
		this.week = week;
		this.type = type;
	}
	public ParamStatistics() {
		super();
	}
	
}
