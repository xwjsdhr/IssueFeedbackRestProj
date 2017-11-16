package com.xwj.entity;

import java.io.Serializable;
import java.util.List;

public class Role implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1697642738340018785L;
	private Integer id;
	private String roleName;
	
	private List<ModulePermission> modulePermissions;
	private List<Permission> permissions;
	
	
	public List<ModulePermission> getModulePermissions() {
		return modulePermissions;
	}
	public void setModulePermissions(List<ModulePermission> modulePermissions) {
		this.modulePermissions = modulePermissions;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public List<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
	
	
	
}
