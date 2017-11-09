package com.xwj.entity;

import java.io.Serializable;
/**
 * 数据统计实体类
 * @author xia weijia
 * @createTime 下午4:06:40
 */
public class IssueCount  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5297630331753285645L;

	
	private String year;
	private String  week;
	private Integer count;
	
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
	
}
