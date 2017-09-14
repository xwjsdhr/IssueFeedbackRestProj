package com.xwj.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private DbUtils() {
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_issue", "root", "123456");
		} catch (SQLException e) {
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public ResultSet executeQuery(String sql, Object... objects) {

		try {
			preparedStatement = connection.prepareStatement(sql);
			System.out.println(connection.toString());
			if (objects != null) {
				for (int i = 0; i < objects.length; i++) {
					preparedStatement.setObject(i + 1, objects[i]);
				}
			}
			System.out.println(preparedStatement.toString());
			resultSet = preparedStatement.executeQuery();
			return resultSet;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}
}
