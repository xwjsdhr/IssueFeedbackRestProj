package com.xwj.entity;

import java.io.Serializable;

public class TrainingType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3244214164087797829L;

	private Integer id;
	private String trainingTypeName;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTrainingTypeName() {
		return trainingTypeName;
	}
	public void setTrainingTypeName(String trainingTypeName) {
		this.trainingTypeName = trainingTypeName;
	}
	
	
	
}
