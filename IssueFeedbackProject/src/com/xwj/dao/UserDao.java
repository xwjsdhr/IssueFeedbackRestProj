package com.xwj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.xwj.entity.Dept;
import com.xwj.entity.User;
import com.xwj.util.DbUtils;

public class UserDao {

	private DbUtils dbUtils;

	public UserDao() {
		dbUtils = DbUtils.newInstance();
	}

	public User login(String username, String password) {

		String loginSql = "select u.id, u.user_name,u.password,u.real_name,d.id,d.dept_name from t_user u, t_dept d where user_name = ? and password = ? and u.dept_id = d.id";
		Object[] objects = new Object[] { username, password };
		ResultSet resultSet = dbUtils.executeQuery(loginSql, objects);

		User user = new User();
		System.out.println(username);
		System.out.println(password);
		try {
			if (resultSet.next()) {
				user.setId(resultSet.getInt("id"));
				user.setUsername(resultSet.getString("user_name"));
				user.setPassword(resultSet.getString("password"));
				user.setRealName(resultSet.getString("real_name"));
				Dept dept = new Dept();
				dept.setId(resultSet.getInt("d.id"));
				dept.setDeptName(resultSet.getString("dept_name"));
				user.setDept(dept);
				return user;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int addUser(User user) {

		String insertSql = "insert into t_user(user_name,password,dept_id,real_name) values(?,?,?,?)";
		Object[] objs = new Object[] { user.getUsername(), user.getPassword(), user.getDept().getId(),
				user.getRealName() };

		int res = dbUtils.executeUpdate(insertSql, objs);
		return res;
	}
	public List<User> getAllUsers(){
		
		String loginSql = "select u.id, u.user_name,u.password,u.real_name,d.id,d.dept_name from t_user u, t_dept d where u.dept_id = d.id";
		Object[] objects = new Object[] {};
		ResultSet resultSet = dbUtils.executeQuery(loginSql, objects);
		List<User> users = new ArrayList<>();
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

	public boolean checkUserName(String username) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		User user = session.selectOne("checkUsername",username);
		session.close();
		return user == null;
	}
}
