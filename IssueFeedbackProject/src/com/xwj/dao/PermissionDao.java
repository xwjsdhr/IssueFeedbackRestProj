package com.xwj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.xwj.entity.Permission;
import com.xwj.util.DbUtils;

public class PermissionDao {
	
	
	private DbUtils dbUtils;
	public PermissionDao() {
		dbUtils = DbUtils.newInstance();
	}
	
	public List<Permission> getAllPermissons(){
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<Permission> permissions = session.selectList("selectAllPermissions");
		session.close();
		return permissions;
	}
	

}
