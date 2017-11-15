package com.xwj.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 评论实体类
 * @author Administrator
 *
 */
public class Comment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4032233724648024513L;
	private Integer id;
	private String content;//评论内容
	private User user;//用户
	private String createTime;//创建时间
	private int isResovleIssue = 0;//是否解决问题
	private List<String> imagePaths;//图片路径
	private int isProblem = 0;//是否是疑难问题
	
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
