package org.jsp.app.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class ProgramsScheduled 
{
	@Id
	@Column(length=5, name="scheduled_program_id")
	private int scheduledProgramID;
	@Column(length=5)
	private String programName;
	@Column(length=10)
	private String location;
	@Column(name="start_date")
	private String startdate;
	@Column(name="end_date")
	private String endDate;
	@Column(name="sessions_per_week")
	private int sessionsPerWeek;
	@OneToMany(cascade=CascadeType.ALL)
	private List<Participant> participant;
	public ProgramsScheduled() 
	{
		super();
	}
	public int getScheduledProgramID() 
	{
		return scheduledProgramID;
	}
	public void setScheduledProgramID(int scheduledProgramID) 
	{
		this.scheduledProgramID = scheduledProgramID;
	}
	public String getProgramName() 
	{
		return programName;
	}
	public void setProgramName(String programName) 
	{
		this.programName = programName;
	}
	public String getLocation() 
	{
		return location;
	}
	public void setLocation(String location) 
	{
		this.location = location;
	}
	public String getStartdate() 
	{
		return startdate;
	}
	public void setStartdate(String startdate) 
	{
		this.startdate = startdate;
	}
	public String getEndDate() 
	{
		return endDate;
	}
	public void setEndDate(String endDate) 
	{
		this.endDate = endDate;
	}
	public int getSessionsPerWeek() 
	{
		return sessionsPerWeek;
	}
	public void setSessionsPerWeek(int sessionsPerWeek) 
	{
		this.sessionsPerWeek = sessionsPerWeek;
	}
	public List<Participant> getParticipant() 
	{
		return participant;
	}
	public void setParticipant(List<Participant> participant) 
	{
		this.participant = participant;
	}
}
