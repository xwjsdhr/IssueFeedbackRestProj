package com.xwj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.xwj.entity.Comment;
import com.xwj.entity.Issue;
import com.xwj.entity.IssuePage;
import com.xwj.entity.QueryCondition;
import com.xwj.util.DbUtils;

public class MyBatisIssueDao implements IssueDao{
	private DbUtils dbUtils;
	public MyBatisIssueDao(){
		dbUtils = DbUtils.newInstance();
	}
	
	@Override
	public List<Issue> getAllIssues() {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<Issue> issues = session.selectList("selectAllIssues");
		session.close();
		return issues;
	}

	@Override
	public int insertIssue(Issue issue) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		int i = session.insert("insertIssue", issue);
		session.commit();
		session.close();
		return i;
	}

	@Override
	public int deleteIssue(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Issue getById(int id) {
		SqlSession session =dbUtils.getSessionFactory().openSession();
		Issue issue = (Issue) session.selectOne("selectById",id);
		session.close();
		return issue;
	}

	@Override
	public List<Comment> getCommentsByIssueId(int id) {
		SqlSession openSession = dbUtils.getSessionFactory().openSession();
		List<Comment> comments = openSession.selectList("selectCommentsByIssueId", id);
		openSession.close();
		return comments;
	}

	@Override
	public int addCommentToIssue(int issueId, Comment comment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateIssueStatusById(int issueId, int statusId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Issue> getIssueByStatusId(Integer statusId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Issue> getIssueByDeptId(Integer deptId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Issue> getIssueByKeyword(String keyword) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<Issue> selectList = session.selectList("selectIssueByKeyword", keyword);
		session.close();
		
		return selectList;
	}

	@Override
	public List<Issue> getIssuesByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public IssuePage getAllByPageNum(Integer pageNum, Integer pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Issue> getAllDeletedIssues() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Issue> getIssuesByConditions(int userId, int deptId, int statusId, String order, String orderType) {
		QueryCondition condition = new QueryCondition(userId,deptId,statusId,order,orderType);
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<Issue> issues = session.selectList("selectIssueByCondition",condition);
		return issues;
	}

	@Override
	public int restoreIssue(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Issue> getIssuesInRange(List<Integer> list) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Issue> orderIssues(String order, String desc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<Integer, String> getColumns() {
		// TODO Auto-generated method stub
		return null;
	}

}
