package com.xwj.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 部门实体类
 * @author Administrator
 *
 */
public class Dept implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6148741875700909204L;
	private Integer id;
	private String deptName;
	private User leader;
	private Boolean isEmbbed;
	private String description;
	private List<Project> projects;
	
	public List<Project> getProjects() {
		return projects;
	}
	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Boolean getIsEmbbed() {
		return isEmbbed;
	}
	public void setIsEmbbed(Boolean isEmbbed) {
		this.isEmbbed = isEmbbed;
	}
	private List<String> permissions;
	
	private List<Permission> permissionsList;

	public List<Permission> getPermissionsList() {
		return permissionsList;
	}
	public void setPermissionsList(List<Permission> permissionsList) {
		this.permissionsList = permissionsList;
	}
	public List<String> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<String> permissions) {
		this.permissions = permissions;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public User getLeader() {
		return leader;
	}
	public void setLeader(User leader) {
		this.leader = leader;
	}
	@Override
	public String toString() {
		return "Dept [id=" + id + ", deptName=" + deptName + ", leader=" + leader + ", permissions=" + permissions
				+ "]";
	}
	
	
	
}
