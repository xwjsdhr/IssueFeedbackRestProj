package com.xwj.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xwj.dao.ProjectDao;
import com.xwj.entity.Project;
import com.xwj.entity.ProjectModule;
import com.xwj.params.ProjectWithModules;
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
	public Boolean addProject(Project project) {
		SqlSession openSession = dbUtils.getSessionFactory().openSession();
		int i = openSession.insert("addProject",project);
		openSession.commit();
		openSession.close();
		return i>0;
	}
	@Override
	public Boolean updateProject(Project project) {
		SqlSession openSession = dbUtils.getSessionFactory().openSession();
		int i = openSession.insert("updateProject",project);
		openSession.commit();
		openSession.close();
		return i>0;
	}
	
	@Override
	public List<ProjectModule> getModuleByProjectId(Integer projectId) {
		SqlSession openSession = dbUtils.getSessionFactory().openSession();
		List<ProjectModule> projectModules = openSession.selectList("getModuleByProjectId",projectId);
		openSession.close();
		return projectModules;
	}
	@Override
	public Boolean addModuleToProject(Integer projectId, String moduleName) {
		SqlSession openSession = dbUtils.getSessionFactory().openSession();
		int i = openSession.insert("addModule",moduleName);
		openSession.commit();
		int lastInsertedId  = openSession.selectOne("lastInsertedId");
		
		int res = openSession.insert("insertJointProjectModule",new ProjectWithModules(projectId,lastInsertedId));
		openSession.commit();
		openSession.close();
		return i>0 && res>0;
	}

}
