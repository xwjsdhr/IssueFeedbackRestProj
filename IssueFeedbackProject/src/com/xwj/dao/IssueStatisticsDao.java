package com.xwj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import com.xwj.entity.IssueStatistics;
import com.xwj.entity.IssueStatisticsItem;
import com.xwj.entity.Status;
import com.xwj.util.DbUtils;

public class IssueStatisticsDao {
	private Calendar calendar;

	private DbUtils dbUtils;

	public IssueStatisticsDao() {
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

			for (Iterator iterator = statisticsItems.iterator(); iterator.hasNext();) {
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public int insertIssueStatistics(IssueStatistics issueStatistics) {

		return 0;
	}

}
