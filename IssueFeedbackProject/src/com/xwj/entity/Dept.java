package com.xwj.entity;

import java.io.Serializable;

public class Dept implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6148741875700909204L;
	private Integer id;
	private String deptName;
	private User leader;
	
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
		return "Dept [id=" + id + ", deptName=" + deptName + ", leader=" + leader + "]";
	}
	
	
}
