package com.xwj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xwj.entity.Status;
import com.xwj.util.DbUtils;

public class StatusDao {

	private DbUtils dbUtils;
	public StatusDao() {
		dbUtils = DbUtils.newInstance();
	}
	
	public List<Status> getAllStatus(){
		String selectSql = "select * from t_status";
		List<Status> list = new ArrayList<>();
		ResultSet rs = dbUtils.executeQuery(selectSql, null);
		try {
			while(rs.next()) {
				Status status = new Status();
				status.setId(rs.getInt("id"));
				status.setStatusName(rs.getString("status_name"));
				list.add(status);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
}
