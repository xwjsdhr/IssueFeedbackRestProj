package com.xwj.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import com.xwj.dao.IssueStatisticsDao;
import com.xwj.entity.IssueStatistics;
import com.xwj.entity.IssueStatisticsItem;
import com.xwj.entity.Status;
import com.xwj.util.DbUtils;

public class IssueStatisticsDaoImpl implements IssueStatisticsDao {
	private Calendar calendar;

	private DbUtils dbUtils;

	public IssueStatisticsDaoImpl() {
		dbUtils = DbUtils.newInstance();
		calendar = Calendar.getInstance(Locale.CHINA);
	}

	public void statisticsIssue() {

		List<IssueStatisticsItem> statisticsItems = new ArrayList<>();
		String insertStatisticsSql = "insert into t_issue_statistics(year,week_of_year) values(?,?)";
		Object[] params = new Object[] {

				calendar.get(Calendar.YEAR), calendar.get(Calendar.WEEK_OF_YEAR) };
		int statisticsId = dbUtils.executeUpdateReturnId(insertStatisticsSql, params);

		String sql = "SELECT ts.id ,status_name , count(*) FROM t_issue ti,t_status ts "
				+ "where week_of_year = ? and " + "ti.status_id = ts.id " + "group by status_id; ";
		ResultSet rs = dbUtils.executeQuery(sql, new Object[] {calendar.get(Calendar.WEEK_OF_YEAR)});
		String insertItemSql = "insert into t_statistics_item(status_id,count) values(?,?);";
		List<Integer> itemIdList = new ArrayList<>();
		try {
			while (rs.next()) {
				IssueStatisticsItem issueStatisticsItem = new IssueStatisticsItem();
				Status status = new Status();
				status.setId(rs.getInt(1));
				issueStatisticsItem.setStatus(status);
				issueStatisticsItem.setCount(rs.getInt(3));
				statisticsItems.add(issueStatisticsItem);

			}

			for (Iterator<IssueStatisticsItem> iterator = statisticsItems.iterator(); iterator.hasNext();) {
				IssueStatisticsItem issueStatisticsItem = (IssueStatisticsItem) iterator.next();
				int itemId = dbUtils.executeUpdateReturnId(insertItemSql,
						new Object[] { issueStatisticsItem.getStatus().getId(), issueStatisticsItem.getCount() });
				itemIdList.add(itemId);
			}
			System.out.println(statisticsId);
			for (Integer i : itemIdList) {
				
				String insertRelationSql = "insert into t_issue_statistics_statistics_item(statistics_id,item_id) values(?,?);";
				Object[] param1 = new Object[] {statisticsId, i };
				dbUtils.executeUpdate(insertRelationSql, param1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public IssueStatistics getByWeekOfYear(int weekOfYearParam) {
		String sql = "select tis.week_of_year , " + 
				"tis.year , " + 
				"tsi.count , "+
				"ts.id ," + 
				"ts.status_name,  "+
				"tsi.id " + 
				"from t_issue_statistics tis,t_issue_statistics_statistics_item tissi, t_statistics_item tsi , t_status ts " + 
				"where  " + 
				"tis.id = tissi.statistics_id and " + 
				"tissi.item_id = tsi.id and " + 
				"ts.id = tsi.status_id and "+
				"tis.week_of_year = ? ";
		StringBuffer sb = new StringBuffer();
		sb.append(sql);
		Object [] params = null;
		
			params = new Object[] {
					weekOfYearParam
			};
		
		ResultSet resultSet = dbUtils.executeQuery(sql, params);
		IssueStatistics issueStatistics = new IssueStatistics();
		List<IssueStatisticsItem> issueStatisticsItems = new ArrayList<>();
		try {
			while(resultSet.next()) {
				
				int weekOfYear = resultSet.getInt("tis.week_of_year");
				int year = resultSet.getInt("tis.year");
				issueStatistics.setNumOfWeek(weekOfYear);
				issueStatistics.setYear(year);
				int statusId = resultSet.getInt("ts.id");
				int count = resultSet.getInt("tsi.count");
				int itemId = resultSet.getInt("tsi.id");
				IssueStatisticsItem issueStatisticsItem = new IssueStatisticsItem();
				String statusName = resultSet.getString("ts.status_name");
				Status status = new Status(statusId, statusName);
				issueStatisticsItem.setCount(count);
				issueStatisticsItem.setStatus(status);
				issueStatisticsItem.setId(itemId);
				issueStatisticsItems.add(issueStatisticsItem);
			}
			issueStatistics.setItems(issueStatisticsItems);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return issueStatistics;
	}

	public List<Integer> getAllYears() {
		List<Integer> list = new ArrayList<>();
		String sql = "select year from t_issue group by year;";
		Object [] params = new Object[] {};
		ResultSet rs = dbUtils.executeQuery(sql, params);
		try {
			while(rs.next()) {
				list.add(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Integer> getWeeksByYear(Integer year) {
		List<Integer> list = new ArrayList<>();
		String sql = "select week_of_year from t_issue where year = ? group by week_of_year ";
		Object [] params = new Object[] {year};
		ResultSet rs = dbUtils.executeQuery(sql, params);
		try {
			while(rs.next()) {
				list.add(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
