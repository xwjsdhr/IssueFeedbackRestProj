package com.xwj.entity;

import java.io.Serializable;

public class Permission implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5771746346974092429L;
	
	
	private String permissionName;
	private Integer id;
	public String getPermissionName() {
		return permissionName;
	}
	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Permission [permissionName=" + permissionName + ", id=" + id + "]";
	}
	
	

}
