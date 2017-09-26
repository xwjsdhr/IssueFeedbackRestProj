package com.xwj.params;

public class UpdateStatusByIssueId {

	private int statusId;
	private int issueId;
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	public int getIssueId() {
		return issueId;
	}
	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}
	public UpdateStatusByIssueId(int statusId, int issueId) {
		super();
		this.statusId = statusId;
		this.issueId = issueId;
	}
	public UpdateStatusByIssueId() {
		super();
	}
}
