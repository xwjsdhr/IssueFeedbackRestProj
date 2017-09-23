package com.xwj.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.annotation.WebListener;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.ee.servlet.QuartzInitializerListener;
import org.quartz.impl.StdSchedulerFactory;

import com.xwj.job.StatisticsJob;

/**
 * Application Lifecycle Listener implementation class QuartzListener
 *
 */
@WebListener
public class QuartzListener extends QuartzInitializerListener  {
	 @Override
	    public void contextInitialized(ServletContextEvent sce) {
	        super.contextInitialized(sce);
	        System.out.println("hello,world");
	        ServletContext ctx = sce.getServletContext();
			StdSchedulerFactory factory = (StdSchedulerFactory) ctx.getAttribute(QUARTZ_FACTORY_KEY);
	        try {
	            Scheduler scheduler = factory.getScheduler();
	            JobDetail jobDetail = JobBuilder.newJob(StatisticsJob.class).build();
	            Trigger trigger = TriggerBuilder.newTrigger().withSchedule(
	                    CronScheduleBuilder.cronSchedule("59 59 23 ? * SUN"))
	            		.startNow().build();
	            scheduler.scheduleJob(jobDetail, trigger);
	            scheduler.start();
	        } catch (Exception e) {
	            ctx.log("There was an error scheduling the job.", e);
	        }
	    }
}
