package com.xwj.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNull;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.xwj.dao.DeptDao;
import com.xwj.dao.IssueDao;
import com.xwj.dao.PermissionDao;
import com.xwj.dao.ProjectDao;
import com.xwj.dao.StatusDao;
import com.xwj.dao.UserDao;
import com.xwj.dao.UserLogDao;
import com.xwj.dao.training.TrainingRecordDao;
import com.xwj.entity.Comment;
import com.xwj.entity.Dept;
import com.xwj.entity.Issue;
import com.xwj.entity.IssueCount;
import com.xwj.entity.IssuePage;
import com.xwj.entity.Permission;
import com.xwj.entity.Project;
import com.xwj.entity.Status;
import com.xwj.entity.TrainingRecord;
import com.xwj.entity.User;
import com.xwj.params.SearchCondition;

/**
 * 业务逻辑实现类
 * @author 夏伟佳
 * @createTime 上午9:12:30
 */
@Component
public class BusinessServiceImpl implements BusinessService {

	@NonNull
	@Autowired(required=true)
	private UserDao userDao;
	@NonNull
	@Autowired(required=true)
	private DeptDao deptDao;
	
	@NonNull
	@Autowired(required=true)
	private StatusDao statusDao;
	
	@NonNull
	@Autowired(required=true)
	private IssueDao myBatisIssueDao;
	
	@NonNull
	@Autowired(required=true)
	private ProjectDao projectDao;
	
	@NonNull
	@Autowired(required=true)
	private PermissionDao permissionDao;
	
	private static BusinessServiceImpl instance;
	
	@NonNull
	@Autowired(required=true)
	private PasswordEncoder passwordEncoder;
	
	@NonNull
	@Autowired(required=true)
	private UserLogDao userLogDao;
	
	
	@NonNull
	@Autowired(required=true)
	private TrainingRecordDao trainingRecordDao;

	
	private BusinessServiceImpl() {
		
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
		return myBatisIssueDao.getCommentsByIssueId(issueid);
	}

	@Override
	public int addCommentToIssue(int issueId, Comment comment) {
		return myBatisIssueDao.addCommentToIssue(issueId, comment);
	}

	@Override
	public List<Dept> getAllDepts() {
		return deptDao.getAllDepts();
	}

	@Override
	public int registerUser(User user) {
		String rawPassword = user.getPassword();
		String encodedPassword = passwordEncoder.encode(rawPassword);
		user.setPassword(encodedPassword);
		return userDao.addUser(user);
	}

	@Override
	public List<Status> getAllStatus() {
		return statusDao.getAllStatus();
	}

	@Override
	public List<Issue> getIssueByStatusId(Integer statusId) {

		return myBatisIssueDao.getIssueByStatusId(statusId);
	}

	@Override
	public List<Issue> getIssueByDeptId(Integer deptId) {
		return myBatisIssueDao.getIssueByDeptId(deptId);
	}

	@Override
	public List<Issue> getIssueByKeyword(String keyword) {
		return myBatisIssueDao.getIssueByKeyword(keyword);
	}

	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Override
	public List<Issue> getIssuesByUserId(Integer userId) {
		return myBatisIssueDao.getIssuesByUserId(userId);
	}

	@Override
	public IssuePage getAllByPageNum(Integer pageNum, Integer pageSize) {
		return myBatisIssueDao.getAllByPageNum(pageNum, pageSize);
	}

	@Override
	public int deleteIssue(int issueId) {
		return myBatisIssueDao.deleteIssue(issueId);
	}

	@Override
	public List<Issue> getAllDeletedIssues() {
		return myBatisIssueDao.getAllDeletedIssues();
	}

	@Override
	public List<Issue> getIssuesByConditions(int userId, int deptId, int statusId, String order, String orderType) {
		return myBatisIssueDao.getIssuesByConditions(userId, deptId, statusId, order, orderType);
	}

	@Override
	public List<User> getUsersByDeptId(Integer id) {
		return null;
	}

	@Override
	public int addDept(String deptName) {
		return deptDao.addDept(deptName);
	}

	@Override
	public int restoreIssue(Integer id) {
		return myBatisIssueDao.restoreIssue(id);
	}

	@Override
	public List<Issue> getIssuesInRange(List<Integer> list) {
		return myBatisIssueDao.getIssuesInRange(list);
	}

	@Override
	public List<Issue> orderIssueByType(String order, String desc) {
		return myBatisIssueDao.orderIssues(order, desc);
	}

	@Override
	public Map<Integer, String> getColumns() {
		return myBatisIssueDao.getColumns();
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
		return userDao.getUserById(userId);
	}

	@Override
	public List<Project> getAllProject() {
		return projectDao.getAll();
	}
	@Override
	public List<Issue> getIssueWithSearchCondition(SearchCondition sc) {
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
		return permissionDao.getAllPermissons();
	}
	@Override
	public boolean updatePermission2Dept(Integer deptId, List<Integer> permissionIdList) {
		return myBatisIssueDao.updatePermission2Dept(deptId,permissionIdList);
	}
	@Override
	public User loginBCrypt(String username, String rawPassword) {
		User user = userDao.getPasswordByUserName(username);
		if(user != null && passwordEncoder.matches(rawPassword, user.getPassword())) {
			return user;
		}
		return null;
	}
	@Override
	public Boolean disableOrEnableUser(Integer userId, boolean b) {
		return userDao.disableOrEnableUser(userId,b);
	}
	@Override
	public Boolean resetPwd(Integer userId) {
		return userDao.resetPwd(userId,passwordEncoder.encode("123"));
	}
	@Override
	public Boolean checkOldPassword(String str, String password) {
		return passwordEncoder.matches(password, str);
	}
	@Override
	public List<IssueCount> countIssue(Integer year ,String type) {
		return myBatisIssueDao.countIssue(year,type);
	}
	@Override
	public Boolean updateUser(User user) {
		return userDao.updateUser(user);
	}
	@Override
	public Boolean updateUserPassword(Integer id, String password) {
		// TODO Auto-generated method stub
		return userDao.updateUserPassword(id,passwordEncoder.encode(password));
	}
	@Override
	public Boolean addProject(Project project) {
		// TODO Auto-generated method stub
		return projectDao.addProject(project);
	}
	@Override
	public Boolean updateProject(Project project) {
		return projectDao.updateProject(project);
	}

	@Override
	public void logUser(User user, String remoteAddr) {
		userLogDao.logUser(user,remoteAddr);
	}

	@Override
	public List<TrainingRecord> getAllTrainingRecords() {
		return trainingRecordDao.getAll();
	}
}
