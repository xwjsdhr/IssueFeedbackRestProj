package com.xwj.entity;

import java.io.Serializable;

public class IssueCount  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5297630331753285645L;

	
	private Integer year;
	private Integer week;
	private Integer count;
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
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
	
}
