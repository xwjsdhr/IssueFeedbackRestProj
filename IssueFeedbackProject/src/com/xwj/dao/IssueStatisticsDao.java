package com.xwj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xwj.entity.IssueStatistics;
import com.xwj.util.DbUtils;

public class IssueStatisticsDao {

	private DbUtils dbUtils;
	public IssueStatisticsDao() {
		dbUtils = DbUtils.newInstance();
	}
	public void statisticsIssue() {
		List<IssueStatistics> list= new ArrayList<>();
		String sql = "SELECT ts.id ,status_name , count(*) FROM t_issue ti,t_status ts " + 
				"where week_of_year = 38 and " + 
				"ti.status_id = ts.id " + 
				"group by status_id; ";
		ResultSet rs = dbUtils .executeQuery(sql, new Object[] {});
		try {
			while(rs.next()) {
				IssueStatistics issueStatistics = new IssueStatistics();
				
//				issueStatistics.setrs.getInt("ts.id");
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
