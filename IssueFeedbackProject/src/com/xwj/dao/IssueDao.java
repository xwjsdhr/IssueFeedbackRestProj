package com.xwj.dao;

import java.util.List;
import java.util.Map;

import com.xwj.entity.Comment;
import com.xwj.entity.Issue;
import com.xwj.entity.IssuePage;

/**
 * �������ݿ�dao
 * @author ��ΰ��
 *
 */
public interface IssueDao {

	/**
	 * ��ȡȫ������
	 * @return ȫ�������б�
	 */
	List<Issue> getAllIssues(int deptId);

	/**
	 * �������
	 * @param ��������
	 * @return Ӱ�������
	 */
	int insertIssue(Issue issue);
	/**
	 * ����idɾ��ָ������
	 * @param id Ҫɾ���������id
	 * @return Ӱ�������
	 */
	int deleteIssue(int id);
	/**
	 * ����ָ��id��ȡָ��������
	 * @param id ����id
	 * @return ָ��������
	 */
	Issue getById(int id);

	/**
	 * ����ָ��������id��ȡ�����µ����ۡ�
	 * @param id ����id
	 * @return �����б�
	 */
	List<Comment> getCommentsByIssueId(int id);

	/**
	 * Ϊָ�����������һ������
	 * @param issueId ����id
	 * @param comment ��������
	 * @return
	 */
	int addCommentToIssue(int issueId, Comment comment);
	
	/**
	 * �޸������ָ��״̬��
	 * @param issueId ����id
	 * @param statusId ״̬id
	 * @return Ӱ�������
	 */
	int updateIssueStatusById(int issueId, int statusId);

	/**
	 * ��ȡָ��״̬������
	 * @param statusId ״̬id
	 * @return �����б�
	 */
	List<Issue> getIssueByStatusId(Integer statusId);

	/**
	 * ��ȡָ�����ŷ���������
	 * @param deptId ����id
	 * @return �����б�
	 */
	List<Issue> getIssueByDeptId(Integer deptId);

	/**
	 * ��ȡ����ָ���ؼ��ֵ������б�
	 * @param keyword �ؼ���
	 * @return �����б�
	 */
	List<Issue> getIssueByKeyword(String keyword);

	/**
	 * ��ȡָ���û�����������
	 * @param userId �û�id
	 * @return �����б�
	 */
	List<Issue> getIssuesByUserId(Integer userId);
	
	/**
	 * ����ָ����ҳ����ҳ���С��ȡ���Ⲣ��װ��IssuePage ������
	 * @param pageNum ҳ��
	 * @param pageSize ҳ�������¼������
	 * @return 
	 */
	IssuePage getAllByPageNum(Integer pageNum, Integer pageSize);
	
	/**
	 * ��ȡȫ���Ѿ���ɾ��������
	 * @return �����б�
	 */
	List<Issue> getAllDeletedIssues();

	/**
	 * ����ָ���ĸ���������ѯָ������
	 * @param userId �û�id
	 * @param deptId ����id
	 * @param statusId ״̬id
	 * @param order ��ʲô����
	 * @param orderType ���� ����
	 * @return
	 */
	List<Issue> getIssuesByConditions(int userId, int deptId, int statusId, String order, String orderType);
	
	List<Issue> getAllIssuesByConditions(int deptId, int statusId, String order, String orderType);
	
	/**
	 * �ָ�ָ����ɾ��������
	 * @param id ����id
	 * @return ��Ӱ�������
	 */
	int restoreIssue(Integer id);

	/**
	 * ��ȡָ����Χ�ڵ�����
	 * @param list ����id�б�
	 * @return �����б�
	 */
	List<Issue> getIssuesInRange(List<Integer> list);

	/**
	 * ����ָ���������������������Ͷ������������
	 * @param order ��������
	 * @param desc ��������
	 * @return
	 */
	List<Issue> orderIssues(String order, String desc);

	Map<Integer, String> getColumns();
	/**
	 * �ö�
	 * @param issueId
	 * @param cancel
	 * @return
	 */
	int stickTop(int issueId, Integer cancel);

}