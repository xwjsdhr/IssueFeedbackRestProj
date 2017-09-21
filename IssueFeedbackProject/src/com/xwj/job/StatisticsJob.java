package com.xwj.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class StatisticsJob implements Job{

	@Override
	public void execute(JobExecutionContext ctx) throws JobExecutionException {
		System.out.println("1");
		
	}

}
