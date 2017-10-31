package com.xwj.params;

import java.io.Serializable;
import java.util.List;

public class UpdatePerParam implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5105261679977107483L;
	private Integer deptId;
	private List<Integer> permissionIdList;
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public List<Integer> getPermissionIdList() {
		return permissionIdList;
	}
	public void setPermissionIdList(List<Integer> permissionIdList) {
		this.permissionIdList = permissionIdList;
	}
	
	
	

}
