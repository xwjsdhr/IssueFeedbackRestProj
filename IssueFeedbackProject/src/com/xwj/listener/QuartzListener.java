package com.xwj.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.annotation.WebListener;

import org.quartz.ee.servlet.QuartzInitializerListener;

/**
 * Application Lifecycle Listener implementation class QuartzListener
 *
 */
@WebListener
public class QuartzListener extends QuartzInitializerListener  {

    
    public QuartzListener() {
    }

    public void contextInitialized(ServletContextEvent arg0)  { 
    }
	
}
