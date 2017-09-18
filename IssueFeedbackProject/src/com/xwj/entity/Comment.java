package com.xwj.entity;

public class Comment {

	private int id;
	private String content;
	private User user;
	private String createTime;
	private int isResovleIssue = 0;
	
	public int getIsResovleIssue() {
		return isResovleIssue;
	}
	public void setIsResovleIssue(int isResovleIssue) {
		this.isResovleIssue = isResovleIssue;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", user=" + user + ", createTime=" + createTime
				+ ", isResovleIssue=" + isResovleIssue + "]";
	}
	
	
}
