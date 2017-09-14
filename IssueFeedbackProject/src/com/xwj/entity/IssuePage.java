package com.xwj.entity;

import java.util.List;

public class IssuePage {

	private int pageNum;
	private int pageSize = 5;
	private List<Issue> issues;
	private List<Integer> pageItems;
	private int maxPageNum;
	
	
	public int getMaxPageNum() {
		return maxPageNum;
	}
	public void setMaxPageNum(int maxPageNum) {
		this.maxPageNum = maxPageNum;
	}
	public List<Integer> getPageItems() {
		return pageItems;
	}
	public void setPageItems(List<Integer> pageItems) {
		this.pageItems = pageItems;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<Issue> getIssues() {
		return issues;
	}
	public void setIssues(List<Issue> issues) {
		this.issues = issues;
	}
	
}
