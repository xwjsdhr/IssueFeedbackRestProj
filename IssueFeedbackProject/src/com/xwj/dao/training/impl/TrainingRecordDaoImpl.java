package com.xwj.dao.training.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.xwj.dao.training.TrainingRecordDao;
import com.xwj.entity.TrainingRecord;
import com.xwj.util.DbUtils;

public class TrainingRecordDaoImpl  implements TrainingRecordDao{

	private DbUtils dbUtils;
	public TrainingRecordDaoImpl() {
		dbUtils = DbUtils.newInstance();
	}
	
	@Override
	public List<TrainingRecord> getAll() {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<TrainingRecord> trainingRecords = session.selectList("selectAllRecord");
		session.close();
		return trainingRecords;
	}

}
