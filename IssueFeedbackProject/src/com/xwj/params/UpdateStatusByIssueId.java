package com.xwj.params;

import java.io.Serializable;

public class UpdateStatusByIssueId implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1332785425543818602L;
	
	private Integer statusId;
	private Integer issueId;
	
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	public Integer getIssueId() {
		return issueId;
	}
	public void setIssueId(Integer issueId) {
		this.issueId = issueId;
	}
	public UpdateStatusByIssueId() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UpdateStatusByIssueId(Integer statusId, Integer issueId) {
		super();
		this.statusId = statusId;
		this.issueId = issueId;
	}
	
}
