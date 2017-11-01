package com.xwj.listener;

import javax.servlet.ServletContextEvent;

import org.quartz.ee.servlet.QuartzInitializerListener;

/**
 * Application Lifecycle Listener implementation class QuartzListener
 *
 */

public class QuartzListener extends QuartzInitializerListener  {
	 @Override
	    public void contextInitialized(ServletContextEvent sce) {
	        super.contextInitialized(sce);
//	        System.out.println("hello,world");
//	        
//	        ServletContext ctx = sce.getServletContext();
//			StdSchedulerFactory factory = (StdSchedulerFactory) ctx.getAttribute(QUARTZ_FACTORY_KEY);
//	        try {
//	            Scheduler scheduler = factory.getScheduler();
//	            JobDetail jobDetail = JobBuilder.newJob(StatisticsJob.class).build();
//	            Trigger trigger = TriggerBuilder.newTrigger().withSchedule(
//	                    CronScheduleBuilder.cronSchedule("59 59 23 ? * SUN"))
//	            		.startNow().build();
//	            scheduler.scheduleJob(jobDetail, trigger);
//	            scheduler.start();
//	        } catch (Exception e) {
//	            ctx.log("There was an error scheduling the job.", e);
//	        }
	    }
}
