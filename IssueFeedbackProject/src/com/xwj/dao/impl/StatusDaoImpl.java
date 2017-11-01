package com.xwj.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xwj.dao.StatusDao;
import com.xwj.entity.Status;
import com.xwj.util.DbUtils;

public class StatusDaoImpl implements StatusDao {

	private DbUtils dbUtils;
	public StatusDaoImpl() {
		dbUtils = DbUtils.newInstance();
	}
	
	/* (non-Javadoc)
	 * @see com.xwj.dao.StatusDao#getAllStatus()
	 */
	@Override
	public List<Status> getAllStatus(){
		String selectSql = "select * from t_status";
		List<Status> list = new ArrayList<>();
		Object [] params = new Object[] {};
		ResultSet rs = dbUtils.executeQuery(selectSql, params);
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
