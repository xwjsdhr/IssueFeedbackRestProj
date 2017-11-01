package com.xwj.dao;

import java.util.List;

import com.xwj.entity.Dept;

public interface DeptDao {

	/**
	 * ��ȡȫ������
	 * @return
	 */
	List<Dept> getAllDepts();

	/**
	 *  ��Ӳ���
	 * @param deptName
	 * @return
	 */
	int addDept(String deptName);

	/**
	 * ����id��ȡ����
	 * @param id
	 * @return
	 */
	Dept getDeptById(Integer id);

}