package com.xwj.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xwj.dao.PermissionDao;
import com.xwj.entity.Permission;
import com.xwj.util.DbUtils;

@Component
public class PermissionDaoImpl implements PermissionDao {
	
	
	private DbUtils dbUtils;
	public PermissionDaoImpl() {
		dbUtils = DbUtils.newInstance();
	}
	
	/* (non-Javadoc)
	 * @see com.xwj.dao.PermissionDao#getAllPermissons()
	 */
	@Override
	public List<Permission> getAllPermissons(){
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<Permission> permissions = session.selectList("selectAllPermissions");
		session.close();
		return permissions;
	}
	

}
