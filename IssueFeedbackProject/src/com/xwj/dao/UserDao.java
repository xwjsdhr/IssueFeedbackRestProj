package com.xwj.dao;

import java.util.List;

import com.xwj.entity.User;

public interface UserDao {

	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * @return
	 */
	User login(String username, String password);

	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	int addUser(User user);
	
	/**
	 * 获取全部用户
	 * @return 用户列表
	 */
	List<User> getAllUsers();
	
	/**
	 * 检查用户名是否存在
	 * @param username 用户名
	 * @return 
	 */
	boolean checkUserName(String username);
	
	/**
	 * 根据id获取用户
	 * @param userId 用户id
	 * @return
	 */
	User getUserById(int userId);

	User getPasswordByUserName(String username);

	Boolean disableOrEnableUser(Integer userId, boolean b);

	Boolean resetPwd(Integer userId, String pwd);

	Boolean updateUser(User user);

	Boolean updateUserPassword(Integer id, String password);

	Boolean updateUserInfo(User updateUser);

}