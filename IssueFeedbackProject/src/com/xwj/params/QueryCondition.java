package com.xwj.params;

public class QueryCondition {

	private int userId;
	private int deptId;
	private int statusId;
	private String order;
	private String orderType;
	
	public QueryCondition(int userId, int deptId, int statusId, String order, String orderType) {
		super();
		this.userId = userId;
		this.deptId = deptId;
		this.statusId = statusId;
		this.order = order;
		this.orderType = orderType;
	}
	public QueryCondition() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	
}
