package com.xwj.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * 数据库操作工具类
 * 
 * @author Administrator
 *
 */
public class DbUtils implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2424545649887318931L;

	private static DbUtils dbUtils;

	private SqlSessionFactory sessionFactory;

	public SqlSessionFactory getSessionFactory() {
		return sessionFactory;
	}

	private DbUtils() {

		String resource = "com/xwj/util/mybatis-config.xml";
		String configResource = "com/xwj/util/config.properties";
		InputStream inputStream = null;
		Properties props = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			props = new Properties();
			props.load(Resources.getResourceAsStream(configResource));
			sessionFactory = new SqlSessionFactoryBuilder().build(inputStream, props);

		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			if(inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public static DbUtils newInstance() {
		if (dbUtils == null) {
			dbUtils = new DbUtils();
		}
		return dbUtils;
	}
}
