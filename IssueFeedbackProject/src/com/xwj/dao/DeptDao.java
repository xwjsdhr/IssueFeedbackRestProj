package com.xwj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xwj.entity.Dept;
import com.xwj.util.DbUtils;

public class DeptDao {

	private DbUtils dbUtils;
	public DeptDao() {
		dbUtils = DbUtils.newInstance();
	}
	
	public List<Dept> getAllDepts(){
		List<Dept> list = new ArrayList<>();
		String querySql = "select * from t_dept";
		ResultSet rs = dbUtils.executeQuery(querySql, null);
		try {
			while(rs.next()) {
				Dept dept = new Dept();
				dept.setDeptName(rs.getString("dept_name"));
				dept.setId(rs.getInt("id"));
				list.add(dept);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
