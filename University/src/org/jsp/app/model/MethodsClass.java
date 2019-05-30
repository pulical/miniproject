package org.jsp.app.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class MethodsClass
{
	ProgramsOffered offered=new ProgramsOffered();
	ProgramsScheduled scheduled=new ProgramsScheduled();
	EntityManagerFactory factory;
	EntityManager manager;
	Random random=new Random();
	int scheduledID;
	public void connection()
	{
		factory=Persistence.createEntityManagerFactory("University");
		manager=factory.createEntityManager();
	}
	public String login(String userId,String password)
	{
		connection();
		String status="";
		manager.getTransaction().begin();
		if(manager.find(Users.class,userId)==null)
		{
			status="invalid username";
		}
		else 
		{	
			Users user=manager.find(Users.class,userId);
			if(user.getPassword().equals(password)&&user.getRole().equals("admin"))
			{
				status="admin";
			}
			else if(user.getPassword().equals(password)&&user.getRole().equals("mac"))
			{
				status="comittee";
			}
			else
			{
				status="unauthorized";
			}
		}
		return status;
	}
	public void addProgram(String location, String programName, String description, String applicantEligibility, 
			int duration, String degreeCertificateOffered, int sessionPerWeek)
	{
		connection();
		manager.getTransaction().begin();
		offered.setProgramName(programName);
		offered.setDescription(description);
		offered.setApplicantEligibility(applicantEligibility);
		offered.setDuration(duration);
		offered.setDegreeCertificateOffered(degreeCertificateOffered);
		scheduled.setProgramName(programName);
		scheduled.setLocation(location);
		scheduled.setSessionsPerWeek(sessionPerWeek);
		ProgramsScheduled programsScheduled=manager.find(ProgramsScheduled.class, scheduledID);
		if(programsScheduled==null)
		{
			scheduledID=random.nextInt(100000);
			if(scheduledID<0)
			{
				scheduledID=scheduledID*-1;
			}
		}
		else if(programsScheduled.getScheduledProgramID()==scheduledID)
		{
			scheduledID=random.nextInt(100000);
		}
		scheduled.setScheduledProgramID(scheduledID);
		scheduled.setStartdate("N/A");
		scheduled.setEndDate("N/A");
		manager.persist(offered);
		manager.persist(scheduled);
		manager.getTransaction().commit();
		manager.close();
	}
	public String updateOfferedProgramDescription(String programName, String description)
	{
		String status="";
		connection();
		manager.getTransaction().begin();
		ProgramsOffered offered=manager.find(ProgramsOffered.class, programName);
		if(offered!=null)
		{
			offered.setDescription(description);
			manager.persist(offered);
			status="success";
		}
		else if(offered==null)
		{
			status="fail";
		}
		manager.getTransaction().commit();
		manager.close();
		return status;
	}
	public String updateOfferedProgramEligibility(String applicantEligibility, String programName)
	{
		String status="";
		connection();
		manager.getTransaction().begin();
		ProgramsOffered offered=manager.find(ProgramsOffered.class, programName);
		if(offered!=null)
		{
			offered.setApplicantEligibility(applicantEligibility);
			manager.persist(offered);
			status="success";
		}
		else if(offered==null)
		{
			status="fail";
		}
		manager.getTransaction().commit();
		manager.close();
		return status;
	}
	public String deleteOfferedProgram(String programName)
	{
		String status="";
		connection();
		manager.getTransaction().begin();
		ProgramsOffered offered=manager.find(ProgramsOffered.class, programName);
		if(offered!=null)
		{
			manager.remove(offered);
			status="success";
		}
		else if(offered==null)
		{
			status="fail";
		}
		manager.getTransaction().commit();
		manager.close();
		return status;
	}
	public String scheduleDatesOfPrograms(String startdate, String enddate,int scheduledId)
	{
		String status="";
		connection();
		manager.getTransaction().begin();
		ProgramsScheduled scheduled=manager.find(ProgramsScheduled.class, scheduledId);
		if(scheduled!=null)
		{
			scheduled.setStartdate(startdate);
			scheduled.setEndDate(enddate);
			manager.persist(scheduled);
			status="success";
		}
		else
		{
			status="fail";
		}
		manager.getTransaction().commit();
		manager.close();
		return status;
	}
	public String deleteScheduledProgram(int scheduledId)
	{
		String status="";
		connection();
		manager.getTransaction().begin();
		ProgramsScheduled scheduled=manager.find(ProgramsScheduled.class, scheduledId);
		if(scheduled==null)
		{
			status="Invalid";
		}
		else if(scheduled!=null)
		{
			List<Participant> participants=scheduled.getParticipant();
			if(participants.isEmpty())
			{
				status="Delete";
				manager.remove(scheduled);
			}
			else
			{
				status="Cannot";
			}
		}
		manager.getTransaction().commit();
		manager.close();
		return status;
	}

	public String validation(String login_Id,String password)
	{
		String status="";
		connection();
		manager.getTransaction().begin();
		if(manager.find(Users.class,(login_Id))==null)
		{
			status="invalid username";
		}
		else 
		{	
			Users user=manager.find(Users.class,(login_Id));
			 if(user.getPassword().equals(password)&&user.getRole().equals("admin"))
				{
					status="admin";
				}
			else if(user.getPassword().equals(password)&&user.getRole().equals("mac"))
			{
				status="comittee";
			}
			
			else
				status="unauthorized";
		}
		manager.close();
		return status;
	}
	public String acceptApplicant(int Application_Id, String interviewDate) 
	{	
		String status="";
		connection();
		manager.getTransaction().begin();
		Application application=manager.find(Application.class,(Application_Id));
		if(application!=null)
		{

			application.setStatus("Accepted");
			application.setDateOfInterview(interviewDate);
			manager.persist(application);
		}
		else
		{
			status="enter valid application Id";
		}
		manager.getTransaction().commit();
		manager.close();

		return status;
	}
	public String confirmOrReject(int applicationID, String appStatus)
	{
		String status="";
		connection();
		manager.getTransaction().begin();
		Application application=manager.find(Application.class, applicationID);
		if(application==null)
		{
			System.out.println("cvbnm");
			status="wrong";
		}
		else if((application!=null)&&(application.getStatus().equals("Accepted")))
		{
			System.out.println("gfsghs");
			application.setStatus(appStatus);
			manager.persist(application);
			status="confirm";
		}
		else
		{
			System.out.println("kls,.");
			status="reject";
		}
		manager.getTransaction().commit();
		manager.close();
		return status;
	}
	public String settingRollNo(int scheduledId, int applicationId)
	{
		String status="";
		List<Participant> list=new ArrayList<>();
		connection();
		String rollNo=random.nextInt(100000)+"";
		manager.getTransaction().begin();
		Application application=manager.find(Application.class, applicationId);
		if(application==null)
		{
			status="wrong";
		}
		ProgramsScheduled scheduled=manager.find(ProgramsScheduled.class, scheduledId);
		if(scheduled==null)
		{
			status="wrong1";
		}
		Participant participant1=manager.find(Participant.class, application.getEmailID());
		if(participant1!=null)
		{
			status="registered";
		}
		else if((application!=null)&&(scheduled!=null)&&("Confirmed".equals(application.getStatus()))&&(participant1==null))
		{	
			Participant participant=new Participant();
			participant.setEmailID(application.getEmailID());
			participant.setRollNo(rollNo);
			participant.setScheduledProgramID(scheduledId);
			participant.setApplication(application);
			list.add(participant);
			if(scheduled.getParticipant()!=null)
			{
				scheduled.getParticipant().addAll(list);
			}
			else
			{
				scheduled.setParticipant(list);
			}
			manager.persist(scheduled);
			status="success";
		}
		manager.getTransaction().commit();
		manager.close();
		return status;
	}
	public List<ProgramsScheduled> detailedSchedule(String fromDate, String toDate)
	{
		connection();
		manager.getTransaction().begin();
		TypedQuery<ProgramsScheduled> query=manager.createQuery("select ref from ProgramsScheduled ref where ref.startdate>=:fromDate AND ref.startdate<=:endDate", ProgramsScheduled.class);
		query.setParameter("fromDate", fromDate);
		query.setParameter("endDate", toDate);
		List <ProgramsScheduled>scheduled=query.getResultList();
		System.out.println(scheduled);
		return scheduled;
	}
	public String application(Application application )
	{
		String status="";
		connection();
		manager.getTransaction().begin();
		ProgramsScheduled programsScheduled=manager.find(ProgramsScheduled.class, application.getScheduledProgramID());
		if(programsScheduled==null)
		{
			status="wrong";
		}
		int applicationId = random.nextInt(10000)+111000;
		System.out.println(application.getScheduledProgramID());
		if((programsScheduled!=null)&&(application.getScheduledProgramID()==programsScheduled.getScheduledProgramID()))
		{
			if(applicationId<0)
			{
				applicationId=applicationId*-1;
			}
			application.setApplicationID(applicationId);
			application.setStatus("pending");
			manager.persist(application);
			status=""+application.getApplicationID();
		}
		manager.getTransaction().commit();
		manager.close();
		return status;
	}
	public String rejectApplicant(int applicationId) 
	{
		String status="";
		connection();
		manager.getTransaction().begin();
		Application application=manager.find(Application.class,(applicationId));
		if(application!=null)
		{

			application.setStatus("Rejected");
			manager.persist(application);
		}
		else
		{
			status="enter valid application Id";
		}
		manager.getTransaction().commit();
		manager.close();

		return status;
		
	}

}
