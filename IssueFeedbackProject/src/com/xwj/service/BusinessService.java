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
	 * �û���¼
	 * @param username �û���
	 * @param password ����
	 * @return ��¼�û��������¼ʧ�� �򷵻�null
	 */
	User login(String username, String password);

	/**
	 * ��ȡȫ������
	 * @return �����б�
	 */
	List<Issue> getAllIssues(int deptId);

	/**
	 * �������
	 * @param issue ��������
	 * @return Ӱ�������
	 */
	int addIssue(Issue issue);
	/**
	 * ��ȡָ��������
	 * @param id ����id
	 * @return ָ��������
	 */
	Issue getById(int id);
	/**
	 * ��ȡָ�����������
	 * @param issueid ����id
	 * @return �����б�
	 */
	List<Comment> getCommentsById(int issueid);

	/**
	 * Ϊָ��������������
	 * @param issueId ����id
	 * @param comment ����
	 * @return 
	 */
	int addCommentToIssue(int issueId, Comment comment);
	
	/**
	 * ��ȡȫ������
	 * @return
	 */
	List<Dept> getAllDepts();
	/**
	 * ע���û�
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