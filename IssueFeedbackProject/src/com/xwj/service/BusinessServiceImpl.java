package com.xwj.service;

import java.util.List;
import java.util.Map;

import com.xwj.dao.DeptDao;
import com.xwj.dao.IssueDao;
import com.xwj.dao.IssueStatisticsDao;
import com.xwj.dao.MyBatisIssueDao;
import com.xwj.dao.PermissionDao;
import com.xwj.dao.ProjectDao;
import com.xwj.dao.StatusDao;
import com.xwj.dao.UserDao;
import com.xwj.dao.impl.IssueDaoImpl;
import com.xwj.dao.impl.ProjectDaoImpl;
import com.xwj.entity.Comment;
import com.xwj.entity.Dept;
import com.xwj.entity.Issue;
import com.xwj.entity.IssuePage;
import com.xwj.entity.IssueStatistics;
import com.xwj.entity.Permission;
import com.xwj.entity.Project;
import com.xwj.entity.Status;
import com.xwj.entity.User;
import com.xwj.params.SearchCondition;

/**
 * 业务逻辑实现类
 * @author 夏伟佳
 * @createTime 上午9:12:30
 */
public class BusinessServiceImpl implements BusinessService {

	private UserDao userDao;
	private IssueDao issueDao;
	private DeptDao deptDao;
	private StatusDao statusDao;
	private IssueStatisticsDao issueStatisticsDao;
	private MyBatisIssueDao myBatisIssueDao;
	private ProjectDao projectDao;
	private PermissionDao dao;
	private static BusinessServiceImpl instance;
	private BusinessServiceImpl() {
		userDao = new UserDao();
		issueDao = new IssueDaoImpl();
		deptDao = new DeptDao();
		statusDao = new StatusDao();
		issueStatisticsDao = new IssueStatisticsDao();
		myBatisIssueDao = new MyBatisIssueDao();
		projectDao = new ProjectDaoImpl();
		dao = new PermissionDao();
	}
	public static BusinessServiceImpl newInstance() {
		if(instance == null) {
			instance = new BusinessServiceImpl();
		}
		return instance;
	}

	@Override
	public User login(String username, String password) {
		return userDao.login(username, password);
	}

	@Override
	public List<Issue> getAllIssues(int deptId) {
		return myBatisIssueDao.getAllIssues(deptId);
	}

	@Override
	public int addIssue(Issue issue) {
		return myBatisIssueDao.insertIssue(issue);
	}

	@Override
	public Issue getById(int id) {
		return myBatisIssueDao.getById(id);
	}

	@Override
	public List<Comment> getCommentsById(int issueid) {
		return issueDao.getCommentsByIssueId(issueid);
	}

	@Override
	public int addCommentToIssue(int issueId, Comment comment) {
		return issueDao.addCommentToIssue(issueId, comment);
	}

	@Override
	public List<Dept> getAllDepts() {
		return deptDao.getAllDepts();
	}

	@Override
	public int registerUser(User user) {
		return userDao.addUser(user);
	}

	@Override
	public List<Status> getAllStatus() {
		return statusDao.getAllStatus();
	}

	@Override
	public List<Issue> getIssueByStatusId(Integer statusId) {

		return issueDao.getIssueByStatusId(statusId);
	}

	@Override
	public List<Issue> getIssueByDeptId(Integer deptId) {
		return issueDao.getIssueByDeptId(deptId);
	}

	@Override
	public List<Issue> getIssueByKeyword(String keyword) {
		return issueDao.getIssueByKeyword(keyword);
	}

	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Override
	public List<Issue> getIssuesByUserId(Integer userId) {
		return issueDao.getIssuesByUserId(userId);
	}

	@Override
	public IssuePage getAllByPageNum(Integer pageNum, Integer pageSize) {
		return issueDao.getAllByPageNum(pageNum, pageSize);
	}

	@Override
	public int deleteIssue(int issueId) {
		return issueDao.deleteIssue(issueId);
	}

	@Override
	public List<Issue> getAllDeletedIssues() {
		return issueDao.getAllDeletedIssues();
	}

	@Override
	public List<Issue> getIssuesByConditions(int userId, int deptId, int statusId, String order, String orderType) {
		return issueDao.getIssuesByConditions(userId, deptId, statusId, order, orderType);
	}

	@Override
	public List<User> getUsersByDeptId(Integer id) {
		return userDao.getUsersByDeptId(id);
	}

	@Override
	public int addDept(String deptName) {
		return deptDao.addDept(deptName);
	}

	@Override
	public int restoreIssue(Integer id) {
		return issueDao.restoreIssue(id);
	}

	@Override
	public List<Issue> getIssuesInRange(List<Integer> list) {
		return issueDao.getIssuesInRange(list);
	}

	@Override
	public List<Issue> orderIssueByType(String order, String desc) {
		return issueDao.orderIssues(order, desc);
	}

	@Override
	public Map<Integer, String> getColumns() {
		return issueDao.getColumns();
	}

	@Override
	public void statisticsIssue() {
		issueStatisticsDao.statisticsIssue();
	}

	@Override
	public IssueStatistics getByWeekOfYear(int weekOfYear) {
		return issueStatisticsDao.getByWeekOfYear(weekOfYear);
	}

	@Override
	public List<Integer> getAllYears(){
		return issueStatisticsDao.getAllYears();
	}

	@Override
	public List<Integer> getWeeksByYear(Integer year) {
		return issueStatisticsDao.getWeeksByYear(year);
	}

	@Override
	public boolean checkUserName(String username) {
		return userDao.checkUserName(username);
	}

	
	@Override
	public int stickTop(Integer issueId, Integer cancel) {
		return myBatisIssueDao.stickTop(issueId,cancel);
	}

	@Override
	public User getUserById(int userId) {
		return myBatisIssueDao.getUserById(userId);
	}

	@Override
	public List<Project> getAllProject() {
		return projectDao.getAll();
	}
	@Override
	public List<Issue> getIssueWithSearchCondition( SearchCondition sc) {
		return myBatisIssueDao.getIssueWithSearchCondition(sc);
	}
	@Override
	public List<Issue> getAllIssuesWithoutDept() {
		return myBatisIssueDao.getAllIssuesWithoutDept();
	}
	@Override
	public Dept getDeptById(Integer id) {
		return deptDao.getDeptById(id);
	}
	@Override
	public List<Permission> getAllPermissions() {
		return dao.getAllPermissons();
	}
	@Override
	public boolean updatePermission2Dept(Integer deptId, List<Integer> permissionIdList) {
		return myBatisIssueDao.updatePermission2Dept(deptId,permissionIdList);
	}
}
