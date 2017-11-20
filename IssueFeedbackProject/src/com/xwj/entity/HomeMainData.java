package com.xwj.entity;

import java.io.Serializable;

public class HomeMainData  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6849569816133776851L;
	private Integer issueCount;
	private Integer statusCount;
	private Integer userCount;
	private Integer projectCount;
	private Integer DeptCount;
	public Integer getIssueCount() {
		return issueCount;
	}
	public void setIssueCount(Integer issueCount) {
		this.issueCount = issueCount;
	}
	public Integer getStatusCount() {
		return statusCount;
	}
	public void setStatusCount(Integer statusCount) {
		this.statusCount = statusCount;
	}
	public Integer getUserCount() {
		return userCount;
	}
	public void setUserCount(Integer userCount) {
		this.userCount = userCount;
	}
	public Integer getProjectCount() {
		return projectCount;
	}
	public void setProjectCount(Integer projectCount) {
		this.projectCount = projectCount;
	}
	public Integer getDeptCount() {
		return DeptCount;
	}
	public void setDeptCount(Integer deptCount) {
		DeptCount = deptCount;
	}
	
}
