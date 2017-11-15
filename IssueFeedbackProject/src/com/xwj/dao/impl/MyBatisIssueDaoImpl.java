package com.xwj.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xwj.dao.IssueDao;
import com.xwj.entity.Comment;
import com.xwj.entity.Issue;
import com.xwj.entity.IssueCount;
import com.xwj.entity.IssuePage;
import com.xwj.params.IssueJointComment;
import com.xwj.params.ParamStatistics;
import com.xwj.params.QueryCondition;
import com.xwj.params.SearchCondition;
import com.xwj.params.UpdatePerParam;
import com.xwj.params.UpdateStatusByIssueId;
import com.xwj.util.DbUtils;

/**
 * 使用Mybatis实现数据股操作的实现类。
 * 
 * @author Administrator
 *
 */
@Component
public class MyBatisIssueDaoImpl implements IssueDao {
	private DbUtils dbUtils;

	public MyBatisIssueDaoImpl() {
		dbUtils = DbUtils.newInstance();
	}

	@Override
	public List<Issue> getAllIssues(int deptId) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<Issue> issues = session.selectList("selectAllIssues", deptId);
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

	@Deprecated
	@Override
	public int deleteIssue(int id) {
		// SqlSession session = dbUtils.getSessionFactory().openSession();
		// int i = session.insert("deleteIssueById",id);
		// session.commit();
		// session.close();
		return 0;
	}

	@Override
	public Issue getById(int id) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		Issue issue = (Issue) session.selectOne("selectById", id);
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
//		Issue issue = session.selectOne("selectById", issueId);
		session.insert("insertComment", comment);

		Integer id = session.selectOne("selectInsertedKey");
		IssueJointComment ic = new IssueJointComment(issueId, id);
		int res = session.insert("insertIssueJointComment", ic);//添加评论关联
	
		if (comment.getIsResovleIssue() == 1) {
			System.err.println("已解决");
			session.update("resolveIssueByComment", issueId);
		} else if (comment.getIsProblem() == 1) {
			System.err.println("未查出问题");
			session.update("unresolveIssueByComment", issueId);
		} else if(comment.getIsResovleIssue() != 1 
				&& comment.getIsProblem() != 1 ){
			System.err.println("未解决");
			session.update("replyIssueById", issueId);
		}
		session.update("updateLastTime", issueId);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int updateIssueStatusById(int issueId, int statusId) {
		System.err.println(issueId + ":" + statusId);
		SqlSession openSession = dbUtils.getSessionFactory().openSession();
		UpdateStatusByIssueId byIssueId = new UpdateStatusByIssueId(issueId, statusId);
		int res = openSession.update("updateStatusById", byIssueId);
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
		QueryCondition condition = new QueryCondition(userId, deptId, statusId, order, orderType);
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<Issue> issues = session.selectList("selectIssueByCondition", condition);
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
		if (cancel == 0) {
			res = session.update("updateIssueTop", issueId);
		} else {
			res = session.update("cancelIssueTop", issueId);
		}
		session.commit();
		session.close();
		return res;
	}

	@Override
	public List<Issue> getAllIssuesByConditions(int deptId, int statusId, String order, String orderType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Issue> getIssueWithSearchCondition(SearchCondition sc) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<Issue> issues = session.selectList("searchIssue", sc);
		session.close();
		return issues;
	}

	@Override
	public List<Issue> getAllIssuesWithoutDept() {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<Issue> issues = session.selectList("allIssuesList");
		session.close();
		return issues;
	}

	@Override
	public boolean updatePermission2Dept(Integer deptId, List<Integer> permissionIdList) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		UpdatePerParam param = new UpdatePerParam();

		int res = session.delete("deletePermissionByDeptId", deptId);
		int i = 0;
		if (!permissionIdList.isEmpty()) {
			param.setDeptId(deptId);
			param.setPermissionIdList(permissionIdList);
			i = session.insert("updatePermissionsToDept", param);
		}

		session.commit(true);
		session.close();
		return i > 0 || res > 0;
	}

	@Override
	public List<IssueCount> countIssue(Integer year, String type) {
		SqlSession session = dbUtils.getSessionFactory().openSession();
		List<IssueCount> issueCounts = session.selectList("countIssueByYearAndMonth", new ParamStatistics(year, type));
		session.close();
		return issueCounts;
	}

}
