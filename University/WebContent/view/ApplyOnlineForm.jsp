<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function validate()
{
	var fname=document.myform.fullName.value;
	if((fname.length<5)||(fname.length>20))
		{
		alert("Name is of invalid length.Must be more than 5 characters");
		document.myform.fullName.focus();
		return false;
		}
	var marks=document.myform.marksObtained.value;
	if(marks<=50||marks>=100)
		{
		alert("The marks should contain more than or equal to 50");
		document.myform.marksObtained.focus();
		return false;
		}
	var mail=document.myform.emailID.value;
	var mail1=mail.indexof("@");
	var mail2=mail.lastIndexOf(".");
	if(mail1<1||mail2<mail1+2||mail2+2>mail.length)
		{
		alert("please enter a valid mail address");
		return false;	
		}
	}
</script>
</head>
<body>
 <form name="myform" method="post" action="applicationForm" onblur="validate()">
	<div align="center" >
  
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
<table>
	
  <tr>
	<td> Full Name </td>
	<td>:</td>
	<td><input type="text" placeholder="enter first name" name="fullName" ></td>
  </tr>
  
  <tr>
	<td>Date of birth</td>
	<td>:</td>
	<td><input type="date"  placeholder="date of birth" name="dateOfBirth" ></td>
  </tr>
  <tr>
	<td>Highest Qualification</td>
	<td>:</td>
	<td><select name="highestQualification">
	<option value="" selected>-----
	<option value="">Intermediate
	<option value="">Diploma
	<option value="">B.tech
  </select></td>
  </tr>
   <tr>
	<td>Marks Obtained</td>
	<td>:</td>
	<td><input type="number" placeholder="marks obtained" name="marksObtained"></td>
  </tr>
  <tr>
	<td>Goals</td>
	<td>:</td>
	<td><input type="text" placeholder="goals" name="goal"></td>
  </tr>
  <tr>
	<td> email_Id</td>
	<td>:</td>
	<td><input type="email" placeholder="enter mail Id"name="emailID" ></td>
  </tr>
   <tr>
	<td>Scheduled program id</td>
	<td>:</td>
	<td><input type="text" placeholder="program id"name="ScheduledProgramID"></td>
  </tr>
  <tr>
	<td></td>
	<td></td>
	<td><input type="submit" value="Apply" onclick="validate()"></td>
  </tr>
  
   </table>
  
	
    </div>
  </form>
	

	<style type="text/css">
		td{color:blue; font-size:20px}
		body{background-color:silver;}
		a{color:buttonface;}
		
b:hover {
  opacity:1;
  }
  h1{color:brown}
  p{color:#000000}
  input,select{padding:6px;
  width:80%}
	</style>
	
</body>
</html>