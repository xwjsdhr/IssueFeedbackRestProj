package com.xwj.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xwj.dao.DeptDao;
import com.xwj.entity.Dept;
import com.xwj.util.DbUtils;

@Component
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
		SqlSession session = dbUtils.getSessionFactory().openSession();
		int i = session.insert("addDept",deptName);
		session.commit();
		session.close();
		return i;
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

	@Override
	public Boolean delDeptById(Integer id) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		int i = session.delete("delDeptById", id);
		session.delete("delDeptPermissionsById",id);
		session.commit(true);
		session.close();
		return i > 0 ;
	}
}
