package com.xwj.entity;

import java.io.Serializable;
import java.util.List;

public class IssueStatistics implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9055407387966329744L;

	private int id;
	private Integer year;
	private Integer numOfWeek;
	private List<IssueStatisticsItem> items;
	
	public List<IssueStatisticsItem> getItems() {
		return items;
	}
	public void setItems(List<IssueStatisticsItem> items) {
		this.items = items;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getNumOfWeek() {
		return numOfWeek;
	}
	public void setNumOfWeek(Integer numOfWeek) {
		this.numOfWeek = numOfWeek;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
