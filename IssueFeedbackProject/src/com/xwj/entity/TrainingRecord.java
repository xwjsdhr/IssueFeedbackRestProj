package com.xwj.entity;

import java.io.Serializable;
import java.util.List;

public class TrainingRecord implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -538083837531065006L;

	private Integer id;
	private String createTime;
	private String trainingTime;
	private String content;
	private TrainingType trainingType;
	private Integer duration;
	private TimeUnit timeUnit;
	private List<User> trainedUsers;
	private User teacher;
	private TrainingWay trainingWay;
	private Integer prepareduration;
	private Dept teachDept;
	
	
	public Dept getTeachDept() {
		return teachDept;
	}
	public void setTeachDept(Dept teachDept) {
		this.teachDept = teachDept;
	}
	public Integer getPrepareduration() {
		return prepareduration;
	}
	public void setPrepareduration(Integer prepareduration) {
		this.prepareduration = prepareduration;
	}
	public TrainingWay getTrainingWay() {
		return trainingWay;
	}
	public void setTrainingWay(TrainingWay trainingWay) {
		this.trainingWay = trainingWay;
	}
	public User getTeacher() {
		return teacher;
	}
	public void setTeacher(User teacher) {
		this.teacher = teacher;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getTrainingTime() {
		return trainingTime;
	}
	public void setTrainingTime(String trainingTime) {
		this.trainingTime = trainingTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public TrainingType getTrainingType() {
		return trainingType;
	}
	public void setTrainingType(TrainingType trainingType) {
		this.trainingType = trainingType;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public TimeUnit getTimeUnit() {
		return timeUnit;
	}
	public void setTimeUnit(TimeUnit timeUnit) {
		this.timeUnit = timeUnit;
	}
	public List<User> getTrainedUsers() {
		return trainedUsers;
	}
	public void setTrainedUsers(List<User> trainedUsers) {
		this.trainedUsers = trainedUsers;
	}
	
	
	
	
}
