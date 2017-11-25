package com.xwj.util;

import javax.servlet.http.HttpServletRequest;

public class CommonUtil {

	/**
	 * 获取请求的ip地址
	 * @param request
	 * @return
	 */
	 public static String getClientIp(HttpServletRequest  request) {
	        String remoteAddr = "";
	        if (request != null) {
	            remoteAddr = request.getHeader("X-FORWARDED-FOR");
	            if (remoteAddr == null || "".equals(remoteAddr)) {
	                remoteAddr = request.getRemoteAddr();
	            }
	        }
	        return remoteAddr;
	    }
}
