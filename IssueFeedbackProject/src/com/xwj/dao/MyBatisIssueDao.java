package com.xwj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.xwj.entity.Comment;
import com.xwj.entity.Issue;
import com.xwj.entity.IssuePage;
import com.xwj.util.DbUtils;

public class MyBatisIssueDao implements IssueDao{
	private DbUtils dbUtils;
	MyBatisIssueDao(){
		dbUtils = DbUtils.newInstance();
	}
	
	@Override
	public List<Issue> getAllIssues() {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<Issue> issues = session.selectList("selectAllIssue");
		
		return issues;
	}

	@Override
	public int insertIssue(Issue issue) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteIssue(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Issue getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> getCommentsByIssueId(int id) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
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
