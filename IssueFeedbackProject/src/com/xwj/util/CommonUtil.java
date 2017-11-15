package com.xwj.util;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class CommonUtil {

	 public static String getClientIp(HttpServletRequest  request) {
	        String remoteAddr = "";
	        if (request != null) {
	        	Enumeration<String> headerNames = request.getHeaderNames();
	        	while (headerNames.hasMoreElements()) {
					String headerName = (String) headerNames.nextElement();
					String value = request.getHeader(headerName);
					System.err.println(headerName+":"+value);
					
				}
	        	
	            remoteAddr = request.getHeader("X-FORWARDED-FOR");
	            if (remoteAddr == null || "".equals(remoteAddr)) {
	                remoteAddr = request.getRemoteAddr();
	            }
	        }

	        return remoteAddr;
	    }
	
}
