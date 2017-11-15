package com.xwj.entity;

import java.io.Serializable;

public class TrainingWay implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1571665981197836511L;

	
	private Integer id;
	private String trainingWayName;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTrainingWayName() {
		return trainingWayName;
	}
	public void setTrainingWayName(String trainingWayName) {
		this.trainingWayName = trainingWayName;
	}
	
	
}
