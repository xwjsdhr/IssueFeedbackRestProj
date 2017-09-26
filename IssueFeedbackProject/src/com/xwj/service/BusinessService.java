package com.xwj.service;

import java.util.List;
import java.util.Map;

import com.xwj.dao.DeptDao;
import com.xwj.dao.IssueDao;
import com.xwj.dao.IssueDaoImpl;
import com.xwj.dao.IssueStatisticsDao;
import com.xwj.dao.MyBatisIssueDao;
import com.xwj.dao.StatusDao;
import com.xwj.dao.UserDao;
import com.xwj.entity.Comment;
import com.xwj.entity.Dept;
import com.xwj.entity.Issue;
import com.xwj.entity.IssuePage;
import com.xwj.entity.IssueStatistics;
import com.xwj.entity.Status;
import com.xwj.entity.User;

public class BusinessService {

	private UserDao userDao;
	private IssueDao issueDao;
	private DeptDao deptDao;
	private StatusDao statusDao;
	private IssueStatisticsDao issueStatisticsDao;
	private MyBatisIssueDao myBatisIssueDao;

	public BusinessService() {
		userDao = new UserDao();
		issueDao = new IssueDaoImpl();
		deptDao = new DeptDao();
		statusDao = new StatusDao();
		issueStatisticsDao = new IssueStatisticsDao();
		myBatisIssueDao = new MyBatisIssueDao();
	}

	public User login(String username, String password) {
		return userDao.login(username, password);
	}

	public List<Issue> getAllIssues() {
		return myBatisIssueDao.getAllIssues();
	}

	public int addIssue(Issue issue) {
		return myBatisIssueDao.insertIssue(issue);
	}

	public Issue getById(int id) {
		return myBatisIssueDao.getById(id);
	}

	public List<Comment> getCommentsById(int issueid) {
		return issueDao.getCommentsByIssueId(issueid);
	}

	public int addCommentToIssue(int issueId, Comment comment) {
		return issueDao.addCommentToIssue(issueId, comment);
	}

	public List<Dept> getAllDepts() {
		return deptDao.getAllDepts();
	}

	public int registerUser(User user) {
		return userDao.addUser(user);
	}

	public List<Status> getAllStatus() {
		return statusDao.getAllStatus();
	}

	public List<Issue> getIssueByStatusId(Integer statusId) {

		return issueDao.getIssueByStatusId(statusId);
	}

	public List<Issue> getIssueByDeptId(Integer deptId) {
		return issueDao.getIssueByDeptId(deptId);
	}

	public List<Issue> getIssueByKeyword(String keyword) {
		return issueDao.getIssueByKeyword(keyword);
	}

	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	public List<Issue> getIssuesByUserId(Integer userId) {
		return issueDao.getIssuesByUserId(userId);
	}

	public IssuePage getAllByPageNum(Integer pageNum, Integer pageSize) {
		return issueDao.getAllByPageNum(pageNum, pageSize);
	}

	public int deleteIssue(int issueId) {
		return issueDao.deleteIssue(issueId);
	}

	public List<Issue> getAllDeletedIssues() {
		return issueDao.getAllDeletedIssues();
	}

	public List<Issue> getIssuesByConditions(int userId, int deptId, int statusId, String order, String orderType) {
		return issueDao.getIssuesByConditions(userId, deptId, statusId, order, orderType);
	}

	public List<User> getUsersByDeptId(Integer id) {
		return userDao.getUsersByDeptId(id);
	}

	public int addDept(String deptName) {
		return deptDao.addDept(deptName);
	}

	public int restoreIssue(Integer id) {
		return issueDao.restoreIssue(id);
	}

	public List<Issue> getIssuesInRange(List<Integer> list) {
		return issueDao.getIssuesInRange(list);
	}

	public List<Issue> orderIssueByType(String order, String desc) {
		return issueDao.orderIssues(order, desc);
	}

	public Map<Integer, String> getColumns() {
		return issueDao.getColumns();
	}

	public void statisticsIssue() {
		issueStatisticsDao.statisticsIssue();
	}

	public IssueStatistics getByWeekOfYear(int weekOfYear) {
		return issueStatisticsDao.getByWeekOfYear(weekOfYear);
	}
	
	public List<Integer> getAllYears(){
		return issueStatisticsDao.getAllYears();
	}

	public List<Integer> getWeeksByYear(Integer year) {
		return issueStatisticsDao.getWeeksByYear(year);
	}

	public boolean checkUserName(String username) {
		return userDao.checkUserName(username);
	}
}
