package com.xwj.params;

public class ProjectWithModules {

	private Integer projectId;
	private Integer lastInsertedId;
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public Integer getLastInsertedId() {
		return lastInsertedId;
	}
	public void setLastInsertedId(Integer lastInsertedId) {
		this.lastInsertedId = lastInsertedId;
	}
	public ProjectWithModules(Integer projectId, Integer lastInsertedId) {
		super();
		this.projectId = projectId;
		this.lastInsertedId = lastInsertedId;
	}
	public ProjectWithModules() {
		super();
	}
	
	

}
