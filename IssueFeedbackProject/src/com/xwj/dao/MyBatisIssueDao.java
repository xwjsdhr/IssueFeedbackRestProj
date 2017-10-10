package com.xwj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.xwj.entity.Comment;
import com.xwj.entity.Issue;
import com.xwj.entity.IssuePage;
import com.xwj.entity.User;
import com.xwj.params.IssueJointComment;
import com.xwj.params.QueryCondition;
import com.xwj.params.UpdateStatusByIssueId;
import com.xwj.util.DbUtils;
/**
 * 使用Mybatis实现数据股操作的实现类。
 * @author Administrator
 *
 */
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
		int i = session.insert("insertIssue",issue);
		session.commit();
		session.close();
		return i;
	}

	@Override
	public int deleteIssue(int id) {
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
		SqlSession session = dbUtils.getSessionFactory().openSession();
		Issue issue = session.selectOne("selectById",issueId);
		int commentId = session.insert("insertComment",comment);
		session.commit();
		System.out.println("commentId:   " + commentId);
		
		IssueJointComment ic = new IssueJointComment(issueId,commentId);
		int res = session.insert("insertIssueJointComment",ic);
		if(issue.getComments().size() == 0) {
			if(res >0 ) {
				updateIssueStatusById(issueId, 2);
			}
		}else {
			if(comment.getIsResovleIssue() == 1 && issue.getStatus().getId() != 3) {
				session.update("resolveIssueByComment",issueId);
			}else if(comment.getIsProblem() == 1 && issue.getStatus().getId() != 4){
				updateIssueStatusById(issueId, 4);
			}
		}
		
		session.update("updateLastTime", issueId);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int updateIssueStatusById(int issueId, int statusId) {
		SqlSession openSession = dbUtils.getSessionFactory().openSession();
		UpdateStatusByIssueId byIssueId = new UpdateStatusByIssueId(issueId, statusId);
		int res = openSession.update("updateStatusById",byIssueId);
		openSession.commit();
		openSession.close();
		return res;
	}

	@Override
	public List<Issue> getIssueByStatusId(Integer statusId) {
		return null;
	}

	@Override
	public List<Issue> getIssueByDeptId(Integer deptId) {
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
		return null;
	}

	@Override
	public IssuePage getAllByPageNum(Integer pageNum, Integer pageSize) {
		return null;
	}

	@Override
	public List<Issue> getAllDeletedIssues() {
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
		return 0;
	}

	@Override
	public List<Issue> getIssuesInRange(List<Integer> list) {
		return null;
	}

	@Override
	public List<Issue> orderIssues(String order, String desc) {
		return null;
	}

	@Override
	public Map<Integer, String> getColumns() {
		return null;
	}

	@Override
	public int stickTop(int issueId, Integer cancel) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		int res = 0;
		if(cancel == 0) {
			res = session.update("updateIssueTop",issueId);
		}else {
			res = session.update("cancelIssueTop",issueId);
		}
		session.commit();
		session.close();
		return res;
	}

	public User getUserById(int userId) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		User user = session.selectOne("getUserById" ,userId);
		session.close();
		return user;
	}

}
