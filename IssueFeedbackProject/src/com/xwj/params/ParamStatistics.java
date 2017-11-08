package com.xwj.params;

import java.io.Serializable;

public class ParamStatistics implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 964912516103295798L;
	private Integer year;
	private String type;
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public ParamStatistics(Integer year, String type) {
		super();
		this.year = year;
		this.type = type;
	}
	public ParamStatistics() {
		super();
	}
	
}
