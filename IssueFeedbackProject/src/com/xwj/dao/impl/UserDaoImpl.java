package com.xwj.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.xwj.dao.UserDao;
import com.xwj.entity.Dept;
import com.xwj.entity.User;
import com.xwj.params.ParamUpdateUserStatus;
import com.xwj.util.DbUtils;

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
		return returnUser;
	}

	/* (non-Javadoc)
	 * @see com.xwj.dao.UserDao#addUser(com.xwj.entity.User)
	 */
	@Override
	public int addUser(User user) {
		String insertSql = "insert into t_user(user_name,password,dept_id,real_name) values(?,?,?,?)";
		Object[] objs = new Object[] { user.getUsername(), user.getPassword(), user.getDept().getId(),
				user.getRealName() };
			
		int res = dbUtils.executeUpdate(insertSql, objs);
//		SqlSession session = dbUtils.getSessionFactory().openSession();
//		int i =  session.insert("insertUser",user);
//		session.commit(true);
		return res;
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
	 * @see com.xwj.dao.UserDao#getUsersByDeptId(int)
	 */
	@Override
	public List<User> getUsersByDeptId(int deptId){
		String querySql ="select u.id, u.user_name,u.password,u.real_name,d.id,d.dept_name from t_user u, t_dept d where u.dept_id = d.id and d.id=?";
		Object [] objects = new Object[] {
				deptId
		};
		List<User> users = new ArrayList<>();
		ResultSet resultSet = dbUtils.executeQuery(querySql, objects);
		try {
			while (resultSet.next()) {
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setUsername(resultSet.getString("user_name"));
				user.setPassword(resultSet.getString("password"));
				user.setRealName(resultSet.getString("real_name"));
				Dept dept = new Dept();
				dept.setId(resultSet.getInt("d.id"));
				dept.setDeptName(resultSet.getString("dept_name"));
				user.setDept(dept);
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;			
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
		// TODO Auto-generated method stub
		return null;
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
}
