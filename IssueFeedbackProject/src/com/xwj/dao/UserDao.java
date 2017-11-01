package com.xwj.dao;

import java.util.List;

import com.xwj.entity.User;

public interface UserDao {

	/**
	 * �û���¼
	 * @param username
	 * @param password
	 * @return
	 */
	User login(String username, String password);

	/**
	 * ����û�
	 * @param user
	 * @return
	 */
	int addUser(User user);
	
	/**
	 * ��ȡȫ���û�
	 * @return �û��б�
	 */
	List<User> getAllUsers();
	
	/**
	 * ���ݲ��Ż�ȡ�û�
	 * @param deptId
	 * @return
	 */
	List<User> getUsersByDeptId(int deptId);
	
	/**
	 * ����û����Ƿ����
	 * @param username �û���
	 * @return 
	 */
	boolean checkUserName(String username);
	
	/**
	 * ����id��ȡ�û�
	 * @param userId �û�id
	 * @return
	 */
	User getUserById(int userId);

}