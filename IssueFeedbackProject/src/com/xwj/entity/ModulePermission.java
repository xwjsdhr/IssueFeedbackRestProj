package com.xwj.entity;

import java.io.Serializable;
import java.util.List;

public class ModulePermission implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3621977506636232392L;
	private Integer id ;
	private String modulePermissionName;
	private List<Permission> permissions;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getModulePermissionName() {
		return modulePermissionName;
	}
	public void setModulePermissionName(String modulePermissionName) {
		this.modulePermissionName = modulePermissionName;
	}
	public List<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
	
	
}
