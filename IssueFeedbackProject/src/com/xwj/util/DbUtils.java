package com.xwj.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;
	private SqlSessionFactory sessionFactory;

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public SqlSessionFactory getSessionFactory() {
		return sessionFactory;
	}

	private DbUtils() {
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "951753");
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
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

	public int executeUpdate(String sql, Object... objects) {
		int result = 0;
		try {
			preparedStatement = connection.prepareStatement(sql);

			if (objects != null) {
				for (int i = 0; i < objects.length; i++) {
					preparedStatement.setObject(i + 1, objects[i]);
				}
			}
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int executeUpdateReturnId(String insertSql , Object... objects) {
		int result = 0;
		try {
			preparedStatement = connection.prepareStatement(insertSql, PreparedStatement.RETURN_GENERATED_KEYS);

			if (objects != null) {
				for (int i = 0; i < objects.length; i++) {
					preparedStatement.setObject(i + 1, objects[i]);
				}
			}
			result = preparedStatement.executeUpdate();
			if(result >0) {
				ResultSet resultSet = preparedStatement.getGeneratedKeys();
				if(resultSet.next()) {
					return  resultSet.getInt(1); 
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return -1;
	}
	public ResultSet executeQuery(String sql, Object... objects) {

		try {
			preparedStatement = connection.prepareStatement(sql);
			if (objects != null && objects.length != 0) {
				for (int i = 0; i < objects.length; i++) {
					if (objects[i] != null) {
						preparedStatement.setObject(i + 1, objects[i]);
					}
				}
			}
			resultSet = preparedStatement.executeQuery();
			return resultSet;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}

	public void disconnect() {
		if (connection != null) {
			try {
				if (!connection.isClosed()) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void closeStatement() {
		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
