package org.jsp.app.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Application 
{
	@Id
	private int applicationID;
	@Column(length=20)
	private String fullName;
	private String dateOfBirth;
	@Column(length=10)
	private String highestQualification;
	private int marksObtained;
	@Column(length=20)
	private String goal;
	@Column(length=20)
	private String emailID;
	@Column(length=5)
	private int scheduledProgramID;
	@Column(length=10)
	private String status;
	private String dateOfInterview;
	public Application() 
	{
		super();
	}
	
	public Application(int applicationID, String fullName, String dateOfBirth, String highestQualification,
			int marksObtained, String goal, String emailID, int scheduledProgramID, String status,
			String dateOfInterview) {
		super();
		this.applicationID = applicationID;
		this.fullName = fullName;
		this.dateOfBirth = dateOfBirth;
		this.highestQualification = highestQualification;
		this.marksObtained = marksObtained;
		this.goal = goal;
		this.emailID = emailID;
		this.scheduledProgramID = scheduledProgramID;
		this.status = status;
		this.dateOfInterview = dateOfInterview;
	}

	public int getApplicationID() {
		return applicationID;
	}
	public void setApplicationID(int applicationID) {
		this.applicationID = applicationID;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getHighestQualification() {
		return highestQualification;
	}
	public void setHighestQualification(String highestQualification) {
		this.highestQualification = highestQualification;
	}
	public int getMarksObtained() {
		return marksObtained;
	}
	public void setMarksObtained(int marksObtained) {
		this.marksObtained = marksObtained;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public int getScheduledProgramID() {
		return scheduledProgramID;
	}
	public void setScheduledProgramID(int scheduledProgramID) {
		this.scheduledProgramID = scheduledProgramID;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDateOfInterview() {
		return dateOfInterview;
	}
	public void setDateOfInterview(String dateOfInterview) {
		this.dateOfInterview = dateOfInterview;
	}
}
