package com.xwj.dao;

import java.util.List;

import com.xwj.entity.Project;
import com.xwj.entity.ProjectModule;

public interface ProjectDao {

	List<Project> getAll();

	Boolean addProject(Project project);

	Boolean updateProject(Project project);

	List<ProjectModule> getModuleByProjectId(Integer projectId);

	Boolean addModuleToProject(Integer projectId, String moduleName);
	
}
