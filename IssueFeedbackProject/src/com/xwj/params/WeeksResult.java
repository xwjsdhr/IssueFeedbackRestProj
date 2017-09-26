package com.xwj.params;

import java.io.Serializable;
import java.util.List;

public class WeeksResult implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5036855237366860606L;
	private List<Integer> list;

	public List<Integer> getList() {
		return list;
	}

	public void setList(List<Integer> list) {
		this.list = list;
	}
	

}
