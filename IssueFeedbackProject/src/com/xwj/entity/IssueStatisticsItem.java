package com.xwj.entity;

import java.io.Serializable;
import java.util.List;

public class IssueStatisticsItem implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8625972207107348831L;

	private Integer id;
	private Status status;
	private Integer count;
	private List<Issue> issues;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public List<Issue> getIssues() {
		return issues;
	}
	public void setIssues(List<Issue> issues) {
		this.issues = issues;
	}
	
	
}
