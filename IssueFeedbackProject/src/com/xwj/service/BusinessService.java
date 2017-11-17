package com.xwj.service;

import java.util.List;
import java.util.Map;

import com.xwj.entity.Comment;
import com.xwj.entity.Dept;
import com.xwj.entity.Issue;
import com.xwj.entity.IssueCount;
import com.xwj.entity.IssuePage;
import com.xwj.entity.LogType;
import com.xwj.entity.Permission;
import com.xwj.entity.Project;
import com.xwj.entity.ProjectModule;
import com.xwj.entity.Status;
import com.xwj.entity.TrainingRecord;
import com.xwj.entity.User;
import com.xwj.entity.UserLog;
import com.xwj.params.SearchCondition;

public interface BusinessService {

	/**
	 * 用户登录
	 * @param username 用户名
	 * @param password 密码
	 * @return 登录用户，如果登录失败 则返回null
	 */
	User login(String username, String password);

	/**
	 * 获取全部问题
	 * @return 问题列表
	 */
	List<Issue> getAllIssues(int deptId);

	/**
	 * 添加问题
	 * @param issue 新增问题
	 * @return 影响的行数
	 */
	int addIssue(Issue issue);
	/**
	 * 获取指定的问题
	 * @param id 问题id
	 * @return 指定的问题
	 */
	Issue getById(int id);
	/**
	 * 获取指定问题的评论
	 * @param issueid 问题id
	 * @return 评论列表
	 */
	List<Comment> getCommentsById(int issueid);

	/**
	 * 为指定评论增加评论
	 * @param issueId 问题id
	 * @param comment 评论
	 * @return 
	 */
	int addCommentToIssue(int issueId, Comment comment);
	
	/**
	 * 获取全部部门
	 * @return
	 */
	List<Dept> getAllDepts();
	/**
	 * 注册用户
	 * @param user
	 * @return
	 */
	int registerUser(User user);

	List<Status> getAllStatus();

	List<Issue> getIssueByStatusId(Integer statusId);

	List<Issue> getIssueByDeptId(Integer deptId);

	List<Issue> getIssueByKeyword(String keyword);

	List<User> getAllUsers();

	List<Issue> getIssuesByUserId(Integer userId);

	IssuePage getAllByPageNum(Integer pageNum, Integer pageSize);

	int deleteIssue(int issueId);

	List<Issue> getAllDeletedIssues();

	List<Issue> getIssuesByConditions(int userId, int deptId, int statusId, String order, String orderType);

	List<User> getUsersByDeptId(Integer id);

	int addDept(String deptName);

	int restoreIssue(Integer id);

	List<Issue> getIssuesInRange(List<Integer> list);

	List<Issue> orderIssueByType(String order, String desc);

	Map<Integer, String> getColumns();


	boolean checkUserName(String username);

	int stickTop(Integer issueId, Integer cancel);

	User getUserById(int userId);

	List<Project> getAllProject();

	List<Issue> getIssueWithSearchCondition(SearchCondition sc);

	List<Issue> getAllIssuesWithoutDept();

	Dept getDeptById(Integer id);

	List<Permission> getAllPermissions();

	boolean updatePermission2Dept(Integer deptId, List<Integer> permissionIdList);

	User loginBCrypt(String username, String rawPassword);

	Boolean disableOrEnableUser(Integer userId, boolean b);

	Boolean resetPwd(Integer userId);

	Boolean checkOldPassword(String string, String password);

	List<IssueCount> countIssue(Integer year ,String type);

	Boolean updateUser(User user);

	Boolean updateUserPassword(Integer id, String password);

	Boolean addProject(Project project);

	Boolean updateProject(Project project);

	void logUser(User user, String remoteAddr, LogType logType);
	
	
	List<TrainingRecord> getAllTrainingRecords();
	
	List<UserLog> getAllUserLogs();

	List<ProjectModule> getModuleByProjectId(Integer projectId);

	Boolean addModuleToProject(Integer projectId, String moduleName);

}