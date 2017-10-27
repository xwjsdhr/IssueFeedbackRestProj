package com.xwj.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 问题实体类
 * @author Administrator
 *
 */
public class Issue implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1222L;
	private Integer id;
	private String title;
	private String content;
	private User user;
	private String submitTime;
	private Status status;
	private List<Comment> comments;
	private Long createTimestamp;
	private String lastUpdateTime;
	private int isDeleted;
	private String resolvedTime;
	private int weekOfYear;
	private int year;
	private int isTop;
	private Project project;
	
	
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public int getIsTop() {
		return isTop;
	}
	public void setIsTop(int isTop) {
		this.isTop = isTop;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getWeekOfYear() {
		return weekOfYear;
	}
	public void setWeekOfYear(int weekOfYear) {
		this.weekOfYear = weekOfYear;
	}
	public String getResolvedTime() {
		return resolvedTime;
	}
	public void setResolvedTime(String resolvedTime) {
		this.resolvedTime = resolvedTime;
	}
	public int getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(String lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	public Long getCreateTimestamp() {
		return createTimestamp;
	}
	public void setCreateTimestamp(Long createTimestamp) {
		this.createTimestamp = createTimestamp;
	}
	private Integer commentsNum = 0;
	
	public Integer getCommentsNum() {
		return commentsNum;
	}
	public void setCommentsNum(Integer commentsNum) {
		this.commentsNum = commentsNum;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public String getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "Issue [id=" + id + ", title=" + title + ", content=" + content + ", user=" + user + ", submitTime="
				+ submitTime + ", status=" + status + ", comments=" + comments + ", createTimestamp=" + createTimestamp
				+ ", lastUpdateTime=" + lastUpdateTime + ", isDeleted=" + isDeleted + ", resolvedTime=" + resolvedTime
				+ ", weekOfYear=" + weekOfYear + ", year=" + year + ", isTop=" + isTop + ", project=" + project
				+ ", commentsNum=" + commentsNum + "]";
	}
	
	
}
