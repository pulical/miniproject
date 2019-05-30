package org.jsp.app.controller;

import java.util.List;

import org.jsp.app.model.Application;
import org.jsp.app.model.MethodsClass;
import org.jsp.app.model.ProgramsScheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RetrievingClass
{
	MethodsClass methods=new MethodsClass();
	ModelAndView modelAndView=null;
	@RequestMapping(value="/view/applicationForm",method=RequestMethod.POST)
	public ModelAndView applicationForm(@ModelAttribute("application")Application application)
	{
		ModelAndView modelAndView=null;
		String applicationId = methods.application(application);
		if((!"wrong".equals(applicationId))&&(!"invalid".equals(applicationId)))
		{
			modelAndView = new ModelAndView("welcome","status","Successfully applied and you can check the status of application by using this application id "+applicationId);
		}
		else if("wrong".equals(applicationId))
		{
			modelAndView = new ModelAndView("ApplyOnlineForm","status","Please Enter Valid Schedule ID");
		}
		return modelAndView;
	}
	@RequestMapping("/view/login")
	public ModelAndView login(@RequestParam("userid")String userId,@RequestParam("pwd")String password)
	{	
		ModelAndView modelAndView=null;
		String status=methods.login(userId, password);
		if(status.equals("invalid username")) 
		{
			modelAndView = new ModelAndView("login","status",status);
		}	
		else if(status.equals("admin"))
		{
			modelAndView = new ModelAndView("admin","status",status);
		}
		else if(status.equals("comittee"))
		{
			modelAndView = new ModelAndView("comittee","status",status);
		}
		else 
		{
			modelAndView = new ModelAndView("login","status",status);
		}
		return modelAndView;
	}
	@RequestMapping("/view/addProgram")
	public ModelAndView addProgram(@RequestParam("name") String name, @RequestParam("description") String description, 
			@RequestParam("duration") int duration, @RequestParam("eligibility") String eligibility,
			@RequestParam("degree") String degreeOffered, @RequestParam("location") String location, 
			@RequestParam("sessions") int sessions)
	{
		methods.addProgram(location, name, description, eligibility, duration, degreeOffered, sessions);
		modelAndView=new ModelAndView("addProgram", "description", "Success");
		return modelAndView;
	}
	@RequestMapping("/view/updateDescription")
	public ModelAndView updateDescription(@RequestParam("programName") String name, @RequestParam("description") String description)
	{
		String status=methods.updateOfferedProgramDescription(name, description);
		if("success".equals(status))
		{
			modelAndView=new ModelAndView("updateDescription", "description", "Description Changed Successfully");
		}
		else
		{
			modelAndView=new ModelAndView("updateDescription", "description", "Please Enter Valid Program Name");
		}
		return modelAndView;
	}
	@RequestMapping("/view/updateEligibility")
	public ModelAndView updateEligibility(@RequestParam("programName") String name, @RequestParam("eligibility") String eligibility)
	{
		String status=methods.updateOfferedProgramEligibility(eligibility, name);
		if("success".equals(status))
		{
			modelAndView=new ModelAndView("updateEligibility", "eligibility", "Eligibility Changed Successfully");
		}
		else
		{
			modelAndView=new ModelAndView("updateEligibility", "eligibility", "Please Enter Valid Program Name");
		}
		return modelAndView;
	}
	@RequestMapping("/view/deleteProgram")
	public ModelAndView deleteProgram(@RequestParam("programName") String name)
	{
		String status=methods.deleteOfferedProgram(name);
		if("success".equals(status))
		{
			modelAndView=new ModelAndView("deleteProgram", "delete", "Program Deleted Successfully");
		}
		else
		{
			modelAndView=new ModelAndView("deleteProgram", "delete", "Please Enter Valid Program Name");
		}
		return modelAndView;
	}
	@RequestMapping("/view/scheduleProgram")
	public ModelAndView scheduleProgram(@RequestParam("scheduleID") int scheduleID, @RequestParam("from") String fromDate, 
			@RequestParam("to") String toDate)
	{
		String status=methods.scheduleDatesOfPrograms(fromDate, toDate, scheduleID);
		if("success".equals(status))
		{
			modelAndView=new ModelAndView("scheduleProgram", "incorrect", "success");
		}
		else
		{
			modelAndView=new ModelAndView("scheduleProgram", "incorrect", "Please Enter Valid Schedule ID");
		}
		return modelAndView;
	}
	@RequestMapping("/view/deleteScheduledProgram")
	public ModelAndView deleteScheduledProgram(@RequestParam("scheduleID") int scheduleID)
	{
		String status=methods.deleteScheduledProgram(scheduleID);
		if("Delete".equals(status))
		{
			modelAndView=new ModelAndView("deleteScheduledProgram", "deleted", "Scheduled Program Is Deleted Successfully As No Participants Have Applied For The Program");
		}
		else if("Cannot".equals(status))
		{
			modelAndView=new ModelAndView("deleteScheduledProgram", "cannot", "Scheduled Program Cannot Be Deleted As Participants Have Already Applied For The Program");
		}
		else
		{
			modelAndView=new ModelAndView("deleteScheduledProgram", "incorrect", "Please Enter Valid Scheduled Program ID");
		}
		return modelAndView;
	}
	@RequestMapping("/view/accept")
	public ModelAndView accept(@RequestParam("applicationId")int applicationId,@RequestParam("interview_Date")String interviewDate)
	{	
		String status="";
		methods.acceptApplicant(applicationId,interviewDate);
		if(status.equals("enter valid application Id")) 
		{
			modelAndView = new ModelAndView("dummy","status",status);	
		}
		else 
		{
			modelAndView = new ModelAndView("display","status","");
		}
		return modelAndView;
	}
	@RequestMapping("/view/reject")
	public ModelAndView reject(@RequestParam("applicationId")int applicationId)
	{	
		String status="";
		methods.rejectApplicant(applicationId);
		if(status.equals("enter valid application Id")) 
		{
			modelAndView = new ModelAndView("dummy1","status",status);	
		}
		else 
		{
			modelAndView = new ModelAndView("display","status","");
		}
		return modelAndView;
	}

	@RequestMapping("/view/confirmOrReject")
	public ModelAndView confirmOrReject(@RequestParam("appID") int appID, @RequestParam("appStatus") String appStatus)
	{
		String status=methods.confirmOrReject(appID, appStatus);
		if("confirm".equals(status))
		{
			modelAndView = new ModelAndView("confirmOrReject","status","Participant Status Updated Successfully");
		}
		else if("wrong".equals(status))
		{
			modelAndView = new ModelAndView("confirmOrReject","status","Please Enter Valid Application ID");
		}
		else
		{
			modelAndView = new ModelAndView("confirmOrReject","status","Participant Status Has Already Been Rejected");
		}
		return modelAndView;
	}
	@RequestMapping("/view/settingRollNo")
	public ModelAndView settingRollNo(@RequestParam("scheduledId") int scheduledId, @RequestParam("appID") int appID)
	{
		String status=methods.settingRollNo(scheduledId, appID);
		if("success".equals(status))
		{
			modelAndView = new ModelAndView("settingRollNo","status","Setting Up Roll No Is Successful");
		}
		else if("wrong".equals(status))
		{
			modelAndView = new ModelAndView("settingRollNo","status","Please Enter Valid Application ID");
		}
		else if("wrong1".equals(status))
		{
			modelAndView = new ModelAndView("settingRollNo","status","Please Enter Valid Scheduled ID");
		}
		else if("registered".equals(status))
		{
			modelAndView = new ModelAndView("settingRollNo","status","Applicant Have Already Been Assigned With A Roll NO");
		}
		return modelAndView;
	}
	@RequestMapping("/view/detailedSchedule")
	public ModelAndView detailedSchedule(@RequestParam("from") String fromDate,@RequestParam("to") String toDate)
	{
		List<ProgramsScheduled> scheduleds=methods.detailedSchedule(fromDate, toDate);
		modelAndView = new ModelAndView("fromTo","status", scheduleds);
		return modelAndView;
	}
}
