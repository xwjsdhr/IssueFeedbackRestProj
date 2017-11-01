package com.xwj.dao;

import java.util.List;

import com.xwj.entity.Permission;

public interface PermissionDao {

	/**
	 * 获取全部权限
	 * @return
	 */
	List<Permission> getAllPermissons();

}