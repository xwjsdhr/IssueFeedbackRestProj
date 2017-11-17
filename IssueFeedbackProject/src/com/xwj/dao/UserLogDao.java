package com.xwj.dao;

import java.util.List;

import com.xwj.entity.LogType;
import com.xwj.entity.User;
import com.xwj.entity.UserLog;

public interface UserLogDao {

	void logUser(User user, String remoteAddr, LogType logType);

	List<UserLog> getAllUserLog();
	
}
