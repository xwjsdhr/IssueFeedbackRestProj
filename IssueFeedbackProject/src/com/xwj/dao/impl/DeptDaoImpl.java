package com.xwj.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.xwj.dao.DeptDao;
import com.xwj.entity.Dept;
import com.xwj.util.DbUtils;

public class DeptDaoImpl implements DeptDao {

	private DbUtils dbUtils;
	public DeptDaoImpl() {
		dbUtils = DbUtils.newInstance();
	}
	
	/* (non-Javadoc)
	 * @see com.xwj.dao.DeptDao#getAllDepts()
	 */
	@Override
	public List<Dept> getAllDepts(){		
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<Dept> deptList = session.selectList("selectAllDept");
		session.close();
		return deptList;
	}

	/* (non-Javadoc)
	 * @see com.xwj.dao.DeptDao#addDept(java.lang.String)
	 */
	@Override
	public int addDept(String deptName) {
		String insertSql ="insert into t_dept(dept_name) values(?)";
		Object [] objects = new Object[] {
				deptName
		};
		
		return dbUtils.executeUpdate(insertSql, objects);
	}

	/* (non-Javadoc)
	 * @see com.xwj.dao.DeptDao#getDeptById(java.lang.Integer)
	 */
	@Override
	public Dept getDeptById(Integer id) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		Dept dept = session.selectOne("selectDeptById", id);
		session.close();
		return dept;
	}
}
