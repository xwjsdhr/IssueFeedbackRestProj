package com.xwj.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xwj.dao.StatusDao;
import com.xwj.entity.Status;
import com.xwj.util.DbUtils;

@Component
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
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<Status> list = session.selectList("getAllStatus");
		session.close();
		return list;
	}
	
}
