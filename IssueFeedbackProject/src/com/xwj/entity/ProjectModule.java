package com.xwj.entity;

import java.io.Serializable;

public class ProjectModule implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3732146518732360537L;

	private Integer id;
	private String projectModuleName;
	private String desc;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProjectModuleName() {
		return projectModuleName;
	}
	public void setProjectModuleName(String projectModuleName) {
		this.projectModuleName = projectModuleName;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
