package com.xwj.dao;

import java.util.List;
import java.util.Map;

import com.xwj.entity.Comment;
import com.xwj.entity.Issue;
import com.xwj.entity.IssuePage;

public interface IssueDao {

	List<Issue> getAllIssues();

	int insertIssue(Issue issue);

	int deleteIssue(int id);

	Issue getById(int id);

	List<Comment> getCommentsByIssueId(int id);

	int addCommentToIssue(int issueId, Comment comment);

	int updateIssueStatusById(int issueId, int statusId);

	List<Issue> getIssueByStatusId(Integer statusId);

	List<Issue> getIssueByDeptId(Integer deptId);

	List<Issue> getIssueByKeyword(String keyword);

	List<Issue> getIssuesByUserId(Integer userId);

	IssuePage getAllByPageNum(Integer pageNum, Integer pageSize);

	List<Issue> getAllDeletedIssues();

	List<Issue> getIssuesByConditions(int userId, int deptId, int statusId, String order, String orderType);

	int restoreIssue(Integer id);

	List<Issue> getIssuesInRange(List<Integer> list);

	List<Issue> orderIssues(String order, String desc);

	Map<Integer, String> getColumns();
	
	int stickTop(int issueId, Integer cancel);

}