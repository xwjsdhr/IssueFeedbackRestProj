package com.xwj.dao;

import java.util.List;

import com.xwj.entity.Status;

public interface StatusDao {

	/**
	 * 获取全部状态
	 * @return
	 */
	List<Status> getAllStatus();

}