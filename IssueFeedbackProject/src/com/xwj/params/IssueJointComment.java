package com.xwj.params;

public class IssueJointComment {

	private int issueId;
	private int commentId;
	
	public IssueJointComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getIssueId() {
		return issueId;
	}

	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public IssueJointComment(int issueId, int commentId) {
		super();
		this.issueId = issueId;
		this.commentId = commentId;
	}
	
	
	
}
