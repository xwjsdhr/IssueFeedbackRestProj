package com.xwj.dao;

import java.util.List;

import com.xwj.entity.Dept;

public interface DeptDao {

	/**
	 * 获取全部部门
	 * @return
	 */
	List<Dept> getAllDepts();

	/**
	 *  添加部门
	 * @param deptName
	 * @return
	 */
	int addDept(String deptName);

	/**
	 * 根据id获取部门
	 * @param id
	 * @return
	 */
	Dept getDeptById(Integer id);

}