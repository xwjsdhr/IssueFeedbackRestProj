package com.xwj.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xwj.dao.UserDao;
import com.xwj.entity.User;
import com.xwj.params.ParamResetPwd;
import com.xwj.params.ParamUpdateUserStatus;
import com.xwj.util.DbUtils;

@Component
public class UserDaoImpl implements UserDao {

	private DbUtils dbUtils;

	public UserDaoImpl() {
		dbUtils = DbUtils.newInstance();
	}

	/* (non-Javadoc)
	 * @see com.xwj.dao.UserDao#login(java.lang.String, java.lang.String)
	 */
	@Override
	public User login(String username, String password) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		User returnUser = session.selectOne("login",user);
		session.close();
		return returnUser;
	}

	/* (non-Javadoc)
	 * @see com.xwj.dao.UserDao#addUser(com.xwj.entity.User)
	 */
	@Override
	public int addUser(User user) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		int i =  session.insert("insertUser",user);
		session.commit(true);
		session.close();
		return i;
	}
	/* (non-Javadoc)
	 * @see com.xwj.dao.UserDao#getAllUsers()
	 */
	@Override
	public List<User> getAllUsers(){
		
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<User> userList = session.selectList("getAllUsers");
		session.close();
		return userList;
	}
	

	/* (non-Javadoc)
	 * @see com.xwj.dao.UserDao#checkUserName(java.lang.String)
	 */
	@Override
	public boolean checkUserName(String username) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		User user = session.selectOne("checkUsername",username);
		session.close();
		return user == null;
	}

	/* (non-Javadoc)
	 * @see com.xwj.dao.UserDao#getUserById(int)
	 */
	@Override
	public User getUserById(int userId) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		User user = session.selectOne("getUserById",userId);
		session.close();
		return user;
	}

	@Override
	public User getPasswordByUserName(String username) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		User user = session.selectOne("getUserByUsername",username);
		session.close();
		return user;
	}

	@Override
	public Boolean disableOrEnableUser(Integer userId, boolean b) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		int i  = session.update("disableOrEnableUser",new ParamUpdateUserStatus(userId,b));
		session.commit(true);
		session.close();
		return i>0;
	}

	@Override
	public Boolean resetPwd(Integer userId, String pwd) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		int i  = session.update("resetPwd",new ParamResetPwd(userId, pwd));
		session.commit(true);
		session.close();
		return i>0;
	}

	@Override
	public Boolean updateUser(User user) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		int i  = session.update("updateUser",user);
		session.commit(true);
		session.close();
		return i>0;
	}

	@Override
	public Boolean updateUserPassword(Integer id, String password) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		User user = new User();
		user.setId(id);
		user.setPassword(password);
		int i  = session.update("updateUserPassword",user);
		session.commit(true);
		session.close();
		return i>0;
	}

	
}
