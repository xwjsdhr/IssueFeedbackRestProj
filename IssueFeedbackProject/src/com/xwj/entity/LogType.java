package com.xwj.entity;

import java.io.Serializable;

public class LogType implements Serializable{

	
	public LogType() {
		super();
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1063213947030180570L;

	private Integer id;
	
	private String typeName;

	public Integer getId() {
		return id;
	}
	

	public LogType(Integer id) {
		super();
		this.id = id;
	}


	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	
}
