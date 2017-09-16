package com.xwj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xwj.entity.Dept;
import com.xwj.entity.User;
import com.xwj.util.DbUtils;

public class DeptDao {

	private DbUtils dbUtils;
	public DeptDao() {
		dbUtils = DbUtils.newInstance();
	}
	
	public List<Dept> getAllDepts(){
		List<Dept> list = new ArrayList<>();
		String querySql = "select td.id ,td.dept_name from t_dept td ";
		ResultSet rs = dbUtils.executeQuery(querySql, null);
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public int addDept(String deptName) {
		String insertSql ="insert into t_dept(dept_name) values(?)";
		Object [] objects = new Object[] {
				deptName
		};
		
		return dbUtils.executeUpdate(insertSql, objects);
	}
}
