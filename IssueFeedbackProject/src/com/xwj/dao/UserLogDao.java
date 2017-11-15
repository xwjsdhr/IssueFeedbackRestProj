package com.xwj.dao;

import com.xwj.entity.User;

public interface UserLogDao {

	void logUser(User user, String remoteAddr);

	
}
