package com.xwj.entity;

import java.io.Serializable;
/**
 * 用户实体类
 * @author Administrator
 *
 */
public class User  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2191696781409941829L;
	private Integer id;
	private String username;
	private String password;
	
	private Dept dept;
	private String realName;
	private Boolean status;
	
	private String email;
	private String telephone;
	private String token ;
	
	
	
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public User(String username, String password, String realName) {
		super();
		this.username = username;
		this.password = password;
		this.realName = realName;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", dept=" + dept + ", realName="
				+ realName + ", status=" + status + "]";
	}
	
	
	
	
}
