package com.xwj.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.xwj.dao.UserLogDao;
import com.xwj.entity.LogType;
import com.xwj.entity.User;
import com.xwj.entity.UserLog;
import com.xwj.util.DbUtils;

public class UserLogDaoImpl implements UserLogDao{

	private DbUtils dbUtils;
	public UserLogDaoImpl() {
		dbUtils = DbUtils.newInstance();
	}
	
	@Override
	public void logUser(User user, String remoteAddr,LogType logType) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		UserLog log = new UserLog();
		log.setIpAddr(remoteAddr);
		log.setUser(user);
		log.setLogType(logType);
		session.insert("logUserLogin",log);
		session.commit();
		session.close();
	}

	@Override
	public List<UserLog> getAllUserLog() {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<UserLog> userLogs = session.selectList("selectAllUserLogs");
		session.close();
		return userLogs;
	}

}
