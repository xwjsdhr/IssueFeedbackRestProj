package com.xwj.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CommonUtil {

	public static String getPwd(String password) {
		try {
			MessageDigest instance = MessageDigest.getInstance("MD5");
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
