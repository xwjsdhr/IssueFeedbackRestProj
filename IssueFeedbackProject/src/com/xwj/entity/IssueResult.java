package com.xwj.entity;

import java.io.Serializable;
import java.util.List;

public class IssueResult  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7828101130031698084L;
	private List<Issue> issues;

	public List<Issue> getIssues() {
		return issues;
	}

	public void setIssues(List<Issue> issues) {
		this.issues = issues;
	}
	

}
