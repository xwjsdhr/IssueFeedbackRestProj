package com.xwj.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * 数据库操作工具类
 * 
 * @author Administrator
 *
 */
public class DbUtils {

	public static DbUtils dbUtils;
	
	private SqlSessionFactory sessionFactory;

	public SqlSessionFactory getSessionFactory() {
		return sessionFactory;
	}

	private DbUtils() {
		
		String resource = "com/xwj/util/mybatis-config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static DbUtils newInstance() {
		if (dbUtils == null) {
			dbUtils = new DbUtils();
		}
		return dbUtils;
	}
}
