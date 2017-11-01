package com.xwj.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.xwj.dao.DeptDao;
import com.xwj.entity.Dept;
import com.xwj.entity.User;
import com.xwj.util.DbUtils;

public class DeptDaoImpl implements DeptDao {

	private DbUtils dbUtils;
	public DeptDaoImpl() {
		dbUtils = DbUtils.newInstance();
	}
	
	/* (non-Javadoc)
	 * @see com.xwj.dao.DeptDao#getAllDepts()
	 */
	@Override
	public List<Dept> getAllDepts(){
		List<Dept> list = new ArrayList<>();
		String querySql = "select td.id ,td.dept_name from t_dept td ";
		Object params [] = new Object[] {};
		ResultSet rs = dbUtils.executeQuery(querySql, params);
		try {
			while(rs.next()) {
				User user = new User();
				Dept dept = new Dept();
				dept.setDeptName(rs.getString("td.dept_name"));
				dept.setId(rs.getInt("td.id"));
				
				dept.setLeader(user);
				list.add(dept);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/* (non-Javadoc)
	 * @see com.xwj.dao.DeptDao#addDept(java.lang.String)
	 */
	@Override
	public int addDept(String deptName) {
		String insertSql ="insert into t_dept(dept_name) values(?)";
		Object [] objects = new Object[] {
				deptName
		};
		
		return dbUtils.executeUpdate(insertSql, objects);
	}

	/* (non-Javadoc)
	 * @see com.xwj.dao.DeptDao#getDeptById(java.lang.Integer)
	 */
	@Override
	public Dept getDeptById(Integer id) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		Dept dept = session.selectOne("selectDeptById", id);
		session.close();
		return dept;
	}
}
