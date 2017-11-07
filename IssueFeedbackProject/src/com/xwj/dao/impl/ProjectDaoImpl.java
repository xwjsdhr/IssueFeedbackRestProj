package com.xwj.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xwj.dao.ProjectDao;
import com.xwj.entity.Project;
import com.xwj.util.DbUtils;

@Component
public class ProjectDaoImpl implements ProjectDao {

	private DbUtils dbUtils ;
	
	public ProjectDaoImpl() {
		dbUtils = DbUtils.newInstance();
		
	}
	@Override
	public List<Project> getAll() {
		SqlSession openSession = dbUtils.getSessionFactory().openSession();
		List<Project> projectList = openSession.selectList("selectAllProjects");
		openSession.close();
		return projectList;
	}
	@Override
	public Boolean addProject(String projectName) {
		SqlSession openSession = dbUtils.getSessionFactory().openSession();
		int i = openSession.insert("addProject",projectName);
		openSession.commit();
		openSession.close();
		return i>0;
	}

}
