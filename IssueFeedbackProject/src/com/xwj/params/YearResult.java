package com.xwj.params;

import java.io.Serializable;
import java.util.List;

public class YearResult  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8920392087783330083L;
	private List<Integer> list;

	public List<Integer> getList() {
		return list;
	}

	public void setList(List<Integer> list) {
		this.list = list;
	}
	
}
