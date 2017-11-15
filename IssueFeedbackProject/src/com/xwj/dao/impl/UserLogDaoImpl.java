package com.xwj.dao.impl;

import org.apache.ibatis.session.SqlSession;

import com.xwj.dao.UserLogDao;
import com.xwj.entity.User;
import com.xwj.entity.UserLog;
import com.xwj.util.DbUtils;

public class UserLogDaoImpl implements UserLogDao{

	private DbUtils dbUtils;
	public UserLogDaoImpl() {
		dbUtils = DbUtils.newInstance();
	}
	
	@Override
	public void logUser(User user, String remoteAddr) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		UserLog log = new UserLog();
		log.setIpAddr(remoteAddr);
		log.setUser(user);
		session.insert("logUserLogin",log);
		session.commit();
		session.close();
	}

}
