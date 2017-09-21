package com.xwj.entity;

import java.io.Serializable;
import java.util.List;

public class Comment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4032233724648024513L;
	private int id;
	private String content;
	private User user;
	private String createTime;
	private int isResovleIssue = 0;
	private List<String> imagePaths;
	private int isProblem = 0;
	
	public int getIsProblem() {
		return isProblem;
	}
	public void setIsProblem(int isProblem) {
		this.isProblem = isProblem;
	}
	public List<String> getImagePaths() {
		return imagePaths;
	}
	public void setImagePaths(List<String> imagePaths) {
		this.imagePaths = imagePaths;
	}
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
