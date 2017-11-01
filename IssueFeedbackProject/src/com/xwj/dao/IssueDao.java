package com.xwj.dao;

import java.util.List;
import java.util.Map;

import com.xwj.entity.Comment;
import com.xwj.entity.Issue;
import com.xwj.entity.IssuePage;

/**
 * 问题数据库dao
 * @author 夏伟佳
 *
 */
public interface IssueDao {

	/**
	 * 获取全部问题
	 * @return 全部问题列表
	 */
	List<Issue> getAllIssues(int deptId);

	/**
	 * 添加问题
	 * @param 新增问题
	 * @return 影响的行数
	 */
	int insertIssue(Issue issue);
	/**
	 * 根据id删除指定问题
	 * @param id 要删除的问题的id
	 * @return 影响的行数
	 */
	int deleteIssue(int id);
	/**
	 * 根据指定id获取指定的问题
	 * @param id 问题id
	 * @return 指定的问题
	 */
	Issue getById(int id);

	/**
	 * 根据指定的问题id获取问题下的评论。
	 * @param id 问题id
	 * @return 评论列表
	 */
	List<Comment> getCommentsByIssueId(int id);

	/**
	 * 为指定的问题添加一条评论
	 * @param issueId 问题id
	 * @param comment 新增评论
	 * @return
	 */
	int addCommentToIssue(int issueId, Comment comment);
	
	/**
	 * 修改问题的指定状态。
	 * @param issueId 问题id
	 * @param statusId 状态id
	 * @return 影响的行数
	 */
	int updateIssueStatusById(int issueId, int statusId);

	/**
	 * 获取指定状态的问题
	 * @param statusId 状态id
	 * @return 问题列表
	 */
	List<Issue> getIssueByStatusId(Integer statusId);

	/**
	 * 获取指定部门发布的问题
	 * @param deptId 部门id
	 * @return 问题列表
	 */
	List<Issue> getIssueByDeptId(Integer deptId);

	/**
	 * 获取包含指定关键字的问题列表
	 * @param keyword 关键字
	 * @return 问题列表
	 */
	List<Issue> getIssueByKeyword(String keyword);

	/**
	 * 获取指定用户发布的问题
	 * @param userId 用户id
	 * @return 问题列表
	 */
	List<Issue> getIssuesByUserId(Integer userId);
	
	/**
	 * 根据指定的页数和页面大小获取问题并封装到IssuePage 对象中
	 * @param pageNum 页数
	 * @param pageSize 页面包含记录的数量
	 * @return 
	 */
	IssuePage getAllByPageNum(Integer pageNum, Integer pageSize);
	
	/**
	 * 获取全部已经被删除的问题
	 * @return 问题列表
	 */
	List<Issue> getAllDeletedIssues();

	/**
	 * 根据指定的复合条件查询指定问题
	 * @param userId 用户id
	 * @param deptId 部门id
	 * @param statusId 状态id
	 * @param order 按什么排序
	 * @param orderType 正序 倒序？
	 * @return
	 */
	List<Issue> getIssuesByConditions(int userId, int deptId, int statusId, String order, String orderType);
	
	List<Issue> getAllIssuesByConditions(int deptId, int statusId, String order, String orderType);
	
	/**
	 * 恢复指定被删除的问题
	 * @param id 问题id
	 * @return 被影响的行数
	 */
	int restoreIssue(Integer id);

	/**
	 * 获取指定范围内的问题
	 * @param list 问题id列表
	 * @return 问题列表
	 */
	List<Issue> getIssuesInRange(List<Integer> list);

	/**
	 * 根据指定的排序条件和排序类型对问题进行排序
	 * @param order 排序条件
	 * @param desc 排序类型
	 * @return
	 */
	List<Issue> orderIssues(String order, String desc);

	Map<Integer, String> getColumns();
	/**
	 * 置顶
	 * @param issueId
	 * @param cancel
	 * @return
	 */
	int stickTop(int issueId, Integer cancel);

}