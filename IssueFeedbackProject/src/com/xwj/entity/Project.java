package com.xwj.entity;

import java.io.Serializable;
import java.util.List;

public class Project implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8127948124459012270L;

	private String projectName;
	private String projectDesc;
	private Integer id;
	private Dept dept;
	private String description;
	private List<ProjectModule> projectModules;
	
	
	public List<ProjectModule> getProjectModules() {
		return projectModules;
	}
	public void setProjectModules(List<ProjectModule> projectModules) {
		this.projectModules = projectModules;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectDesc() {
		return projectDesc;
	}
	public void setProjectDesc(String projectDesc) {
		this.projectDesc = projectDesc;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Project [projectName=" + projectName + ", projectDesc=" + projectDesc + ", id=" + id + ", dept=" + dept
				+ "]";
	}
	
	
}
