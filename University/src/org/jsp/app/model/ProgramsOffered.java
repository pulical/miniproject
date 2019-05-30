package org.jsp.app.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ProgramsOffered
{
	@Id
	@Column(length=5)
	private String programName;
	@Column(length=20)
	private String description;
	@Column(length=40, name="applicant_eligibility")
	private String applicantEligibility;
	private int duration;
	@Column(length=10, name="degree_certificate_offered")
	private String degreeCertificateOffered;
	public ProgramsOffered() 
	{
		super();
	}
	public String getProgramName() {
		return programName;
	}
	public void setProgramName(String programName) {
		this.programName = programName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getApplicantEligibility() {
		return applicantEligibility;
	}
	public void setApplicantEligibility(String applicantEligibility) {
		this.applicantEligibility = applicantEligibility;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getDegreeCertificateOffered() {
		return degreeCertificateOffered;
	}
	public void setDegreeCertificateOffered(String degreeCertificateOffered) {
		this.degreeCertificateOffered = degreeCertificateOffered;
	}
	
}
