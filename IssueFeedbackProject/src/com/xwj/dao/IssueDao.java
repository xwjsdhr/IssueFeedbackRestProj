package com.xwj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

import com.xwj.entity.Comment;
import com.xwj.entity.Dept;
import com.xwj.entity.Issue;
import com.xwj.entity.IssuePage;
import com.xwj.entity.Status;
import com.xwj.entity.User;
import com.xwj.util.DbUtils;

public class IssueDao {

	private DbUtils dbUtils;
	private SimpleDateFormat dateFormat;

	public IssueDao() {
		dbUtils = DbUtils.newInstance();
		dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINA);
	}

	public List<Issue> getAllIssues() {
		String allSql = "select ti.id,ti.title,ti.content,ti.submit_time,ti.last_update_time,ts.id,ts.status_name,tu.user_name,tu.password,tu.id,tu.dept_id,tu.real_name,td.id,td.dept_name"
				+ " from t_issue ti , t_status ts, t_user tu , t_dept td  where ti.status_id = ts.id and ti.user_id = tu.id and tu.dept_id = td.id  and ti.is_deleted = 1  order by submit_time desc";

		ResultSet result = dbUtils.executeQuery(allSql, null);
		List<Issue> list = new ArrayList<>();

		try {
			while (result.next()) {
				
				Issue issue = packageIssue(result);

				list.add(issue);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public int insertIssue(Issue issue) {
		String insertSql = "insert into t_issue(title,content,status_id,user_id,submit_time,submit_time_stamp,last_update_time) values(?,?,1,?,now(),now(),now())";
		Object[] objects = new Object[] { issue.getTitle(), issue.getContent(), issue.getUser().getId() };

		int res = dbUtils.executeUpdate(insertSql, objects);
		return res;
	}

	public int deleteIssue(int id) {
		String updateSql = "update t_issue set is_deleted = 0 where id=?";
		Object [] params = new Object[] {
				id
		};
		int res = dbUtils.executeUpdate(updateSql, params);
		return res;
	}
	public Issue getById(int id) {
		String sql = "select ti.id,ti.title,ti.content,ti.submit_time,ti.last_update_time,ts.id,ts.status_name,tu.user_name,tu.password,tu.id,tu.dept_id,tu.real_name,td.id,td.dept_name"
				+ " from t_issue ti , t_status ts, t_user tu , t_dept td  where ti.status_id = ts.id and ti.user_id = tu.id and tu.dept_id = td.id and ti.id=? ";
		Object[] objects = new Object[] { id };
		ResultSet result = dbUtils.executeQuery(sql, objects);
		
		try {
			if (result.next()) {
				Issue issue = packageIssue(result);
				return issue;
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<Comment> getCommentsByIssueId(int id) {
		String allSql = "select ti.id ,  " + "ti.title, " + "ti.content , " + "tc.content, " + "tu.real_name, tc.is_resovled_issue,"
				+ "tu.user_name, " + "ts.status_name,  " + "tc.id , tc.create_time," + "tc.user_id , " + " td.id, "
				+ "td.dept_name," + "tu.id, tu.password " + " from  " + "t_issue ti, " + " t_issue_comments tic, "
				+ " t_comment tc , " + " t_user tu, " + " t_dept td , " + " t_status ts " + "where  "
				+ "ti.id = tic.issue_id and " + " tc.id = tic.comment_id and " + " tc.user_id = tu.id and "
				+ " tu.dept_id = td.id and " + " ti.status_id = ts.id and " + " ti.id = ? order by tc.create_time";
		Object[] objs = new Object[] { id };
		ResultSet result = dbUtils.executeQuery(allSql, objs);

		List<Comment> comments = new ArrayList<>();

		try {
			while (result.next()) {

				User user = new User();
				user.setId(result.getInt("tu.id"));
				user.setUsername(result.getString("tu.user_name"));
				user.setPassword(result.getString("tu.password"));
				user.setRealName(result.getString("tu.real_name"));
				Dept dept = new Dept();
				dept.setDeptName(result.getString("td.dept_name"));
				dept.setId(result.getInt("td.id"));
				user.setDept(dept);

				Comment comment = new Comment();

				comment.setId(result.getInt("tc.id"));
				comment.setCreateTime(result.getString("create_time"));
				comment.setContent(result.getString("tc.content"));
				comment.setUser(user);
				comment.setIsResovleIssue(Integer.parseInt(result.getString("is_resovled_issue")));

				comments.add(comment);
			}
			return comments;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int addCommentToIssue(int issueId, Comment comment) {
		Issue issue = this.getById(issueId);

		String insertSql = "insert into t_comment(content,user_id,create_time,is_resovled_issue) values(?,?,now(),?)";
		Object[] objects = new Object[] { comment.getContent(), comment.getUser().getId() ,comment.getIsResovleIssue()};
		int res = dbUtils.executeUpdate(insertSql, objects);
		Comment comment2 = new Comment();
		if (res != 0) {
			String querySql = "select * from t_comment order by id desc";
			ResultSet rs = dbUtils.executeQuery(querySql, null);
			try {
				if (rs.next()) {
					comment2.setId(rs.getInt("id"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String insertSql2 = "insert into t_issue_comments(issue_id,comment_id) values(?,?)";
		Object[] objects2 = new Object[] { issue.getId(), comment2.getId() };

		int result = dbUtils.executeUpdate(insertSql2, objects2);
		if (issue.getCommentsNum() == 0) {
			if(result > 0 ) {
				updateIssueStatusById(issue.getId(),2);
			}
		}else {
			if(comment.getIsResovleIssue() == 1 &&issue.getStatus().getId() !=3) {
				String updateResovledSql = "update t_issue set status_id = 3 where id = ?";
				Object [] params = new Object[] {
						issue.getId()
				};
				dbUtils.executeUpdate(updateResovledSql, params);
			}
		}
		String updateTimeSql = "update t_issue set last_update_time = now() where id = ?";
		Object [] params = new Object[] {
				issue.getId()
		};
		dbUtils.executeUpdate(updateTimeSql, params);
		
		return result;
	}

	public int updateIssueStatusById(int issueId,int statusId) {
		String updateSql = "update t_issue set status_id = ? where id = ?";
		Object [] params = new Object[] {
				statusId,issueId
		};
		int res = dbUtils.executeUpdate(updateSql, params);
		return res;
	}
	public List<Issue> getIssueByStatusId(Integer statusId) {

		String allSql = "select ti.id,ti.title,ti.content,ti.submit_time,ti.last_update_time,ts.id,ts.status_name,tu.user_name,tu.password,tu.id,tu.dept_id,tu.real_name,td.id,td.dept_name"
				+ " from t_issue ti , t_status ts, t_user tu , t_dept td  where ti.status_id = ts.id and ti.user_id = tu.id and tu.dept_id = td.id and ts.id= ? and ti.is_deleted = 1 order by submit_time desc";
		Object[] objects = new Object[] { statusId };
		ResultSet result = dbUtils.executeQuery(allSql, objects);
		List<Issue> list = new ArrayList<>();

		try {
			while (result.next()) {
				
				Issue issue = packageIssue(result);

				list.add(issue);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<Issue> getIssueByDeptId(Integer deptId) {
		String allSql = "select ti.id,ti.title,ti.content,ti.submit_time,ti.last_update_time,ts.id,ts.status_name,tu.user_name,tu.password,tu.id,tu.dept_id,tu.real_name,td.id,td.dept_name"
				+ " from t_issue ti , t_status ts, t_user tu , t_dept td  where ti.status_id = ts.id and ti.user_id = tu.id and tu.dept_id = td.id and td.id= ?  and ti.is_deleted = 1  order by submit_time desc ";
		Object[] objects = new Object[] { deptId };
		ResultSet result = dbUtils.executeQuery(allSql, objects);
		List<Issue> list = new ArrayList<>();

		try {
			while (result.next()) {
				
				Issue issue = packageIssue(result);
				list.add(issue);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	private int getCommentsNumByIssueId(int issueId) throws SQLException {
		int res = 0;
		Object[] objs = new Object[] { issueId };
		String selectCommentsSql = "select count(*) " + " from t_issue ti, t_issue_comments tic, t_comment tc  "
				+ " where ti.id = tic.issue_id and " + " tc.id = tic.comment_id and " + " ti.id = ?";

		ResultSet rs = dbUtils.executeQuery(selectCommentsSql, objs);
		if (rs.next()) {
			res = rs.getInt(1);
		}
		return res;
	}

	public List<Issue> getIssueByKeyword(String keyword) {
		String allSql = "select ti.id,ti.title,ti.content,ti.submit_time,ti.last_update_time,ts.id,ts.status_name,tu.user_name,tu.password,tu.id,tu.dept_id,tu.real_name,td.id,td.dept_name"
				+ " from t_issue ti , t_status ts, t_user tu , t_dept td  where ti.status_id = ts.id and ti.user_id = tu.id and tu.dept_id = td.id and "
				+ " (ti.content like ? or ti.title like ?)  and ti.is_deleted = 1  order by submit_time desc";
		Object[] objects = new Object[] { "%" + keyword + "%", "%" + keyword + "%" };
		ResultSet result = dbUtils.executeQuery(allSql, objects);
		List<Issue> list = new ArrayList<>();
		System.out.println(allSql);
		try {
			while (result.next()) {
				
				Issue issue = packageIssue(result);

				list.add(issue);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<Issue> getIssuesByUserId(Integer userId) {
		String allSql = "select ti.id,ti.title,ti.content,ti.submit_time,ti.last_update_time,ts.id,ts.status_name,tu.user_name,tu.password,tu.id,tu.dept_id,tu.real_name,td.id,td.dept_name"
				+ " from t_issue ti , t_status ts, t_user tu , t_dept td  where ti.status_id = ts.id and ti.user_id = tu.id and tu.dept_id = td.id and ti.user_id= ?  and ti.is_deleted = 1 order by submit_time desc";
		Object[] objects = new Object[] { userId };
		ResultSet result = dbUtils.executeQuery(allSql, objects);
		List<Issue> list = new ArrayList<>();

		try {
			while (result.next()) {
				
				Issue issue = packageIssue(result);
				list.add(issue);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public IssuePage getAllByPageNum(Integer pageNum, Integer pageSize) {
		String countSql = "select count(*) " + " from t_issue";
		ResultSet rs = dbUtils.executeQuery(countSql, null);
		int issueTotal = 0;
		try {
			if (rs.next()) {
				issueTotal = rs.getInt(1);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		int totalpage = issueTotal % pageSize == 0 ? issueTotal / pageSize : issueTotal / pageSize + 1;
		List<Integer> pageItems = new ArrayList<>();
		for (int i = 1; i <= totalpage; i++) {
			pageItems.add(i);
		}

		String allSql = "select ti.id,ti.title,ti.content,ti.submit_time,ts.id,ts.status_name,tu.user_name,tu.password,tu.id,tu.dept_id,tu.real_name,td.id,td.dept_name"
				+ " from t_issue ti , t_status ts, t_user tu , t_dept td  where ti.status_id = ts.id and ti.user_id = tu.id and tu.dept_id = td.id limit ? offset ?";
		IssuePage issuePage = new IssuePage();
		issuePage.setPageNum(pageNum);
		issuePage.setPageItems(pageItems);
		issuePage.setMaxPageNum(totalpage);

		Object[] param = new Object[] { pageSize, (pageNum - 1) * pageSize };

		ResultSet result = dbUtils.executeQuery(allSql, param);
		List<Issue> list = new ArrayList<>();

		try {
			while (result.next()) {
				
				Issue issue = packageIssue(result);

				list.add(issue);
			}
			issuePage.setPageNum(pageNum);
			issuePage.setIssues(list);

			return issuePage;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<Issue> getAllDeletedIssues() {
		String allSql = "select ti.id,ti.title,ti.content,ti.submit_time,ti.last_update_time,ts.id,ts.status_name,tu.user_name,tu.password,tu.id,tu.dept_id,tu.real_name,td.id,td.dept_name"
				+ " from t_issue ti , t_status ts, t_user tu , t_dept td  where ti.status_id = ts.id and ti.user_id = tu.id and tu.dept_id = td.id and is_deleted = 0 order by submit_time desc";

		ResultSet result = dbUtils.executeQuery(allSql, null);
		List<Issue> list = new ArrayList<>();

		try {
			while (result.next()) {
				
				Issue issue = packageIssue(result);

				list.add(issue);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<Issue> getIssuesByConditions(int userId, int deptId, int statusId) {
		String allSql = "select ti.id,ti.title,ti.content,ti.submit_time,ti.last_update_time,ts.id,ts.status_name,tu.user_name,tu.password,tu.id,tu.dept_id,tu.real_name,td.id,td.dept_name"
				+ " from t_issue ti , t_status ts, t_user tu , t_dept td  where ti.status_id = ts.id and ti.user_id = tu.id and tu.dept_id = td.id and ti.is_deleted = 1 ";
		StringBuffer buffer = new StringBuffer();
		buffer.append(allSql);
		List<Object> objects = new ArrayList<Object>();
		if(userId != -1 ) {
			System.out.println("add userId");
			buffer.append(" and tu.id = ? ");
			objects.add(userId);
		}
		if(deptId != -1) {
			System.out.println("add userId");
			buffer.append(" and td.id= ? ");
			objects.add(deptId);
		}
		if(statusId != -1) {
			System.out.println("add userId");
			buffer.append(" and ts.id = ? ");
			objects.add(statusId);
		}
		buffer.append("order by submit_time desc");
		Object [] params = new Object[objects.size()];
		for(int i = 0;i< objects.size();i++) {
			params[i] = objects.get(i);
		}
		System.out.println(buffer.toString());
		ResultSet result = dbUtils.executeQuery(buffer.toString(), params);
		List<Issue> list = new ArrayList<>();

		try {
			while (result.next()) {
				Issue issue = packageIssue(result);
				list.add(issue);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	private Issue packageIssue(ResultSet result) throws SQLException, ParseException {
		Issue issue = new Issue();
		issue.setId(result.getInt("ti.id"));
		issue.setTitle(result.getString("title"));
		issue.setContent(result.getString("content"));
		issue.setSubmitTime(result.getString("submit_time"));
		issue.setLastUpdateTime(result.getString("last_update_time"));
		issue.setCreateTimestamp(dateFormat.parse(result.getString("submit_time")).getTime());
		Status status = new Status();
		status.setId(result.getInt("ts.id"));
		status.setStatusName(result.getString("ts.status_name"));

		User user = new User();
		user.setId(result.getInt("tu.id"));
		user.setUsername(result.getString("tu.user_name"));
		user.setPassword(result.getString("tu.password"));
		user.setRealName(result.getString("tu.real_name"));
		Dept dept = new Dept();
		dept.setDeptName(result.getString("td.dept_name"));
		dept.setId(result.getInt("td.id"));

		user.setDept(dept);

		issue.setStatus(status);
		issue.setUser(user);

		int commentsNum = getCommentsNumByIssueId(issue.getId());
		issue.setCommentsNum(commentsNum);
		return issue;
	}

	public int restoreIssue(Integer id) {
		String updateSql = "update t_issue set is_deleted = 1 where id=?";
		Object [] params = new Object[] {
				id
		};
		int res = dbUtils.executeUpdate(updateSql, params);
		return res;
	}
}
