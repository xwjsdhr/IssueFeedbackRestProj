package com.xwj.util;

import javax.servlet.http.HttpServletRequest;

public class CommonUtil {

	/**
	 * ��ȡ�����ip��ַ
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
