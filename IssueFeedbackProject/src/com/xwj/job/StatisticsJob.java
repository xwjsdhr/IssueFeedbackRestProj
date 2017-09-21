package com.xwj.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.xwj.service.BusinessService;

public class StatisticsJob implements Job{

	private BusinessService business;
	public StatisticsJob() {
		business = new BusinessService();
	}
	
	@Override
	public void execute(JobExecutionContext ctx) throws JobExecutionException {
		business.statisticsIssue();
	}

}
