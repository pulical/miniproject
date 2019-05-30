package org.jsp.app.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Participant
{
	@Column(length=5, name="Roll_No")
	private String rollNo;
	@Column(length=20, name="email_id")
	@Id
	private String emailID;
	@Column(length=5, name="scheduled_program_id")
	private int scheduledProgramID;
	@OneToOne(cascade=CascadeType.ALL)
	private Application application;
	public Participant() 
	{
		super();
	}
	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
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
	public Application getApplication() {
		return application;
	}
	public void setApplication(Application application) {
		this.application = application;
	}
}
