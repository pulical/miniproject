<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div class="header">
  <h1><strong>University Admission System</strong></h1>
  <p>A tradition of trust</p>
</div>

  <div class="navbar">
  <a href="welcome.jsp"><i class="fa fa-fw fa-home"></i> Home</a>
  <a href="#" class="right">About Us</a>
</div>
 
<form action="login" style="max-width:500px;margin:auto">
${status}
  <h2>Login Form</h2>
  <div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="number" placeholder="UserId" name="userid" required>
  </div>

  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="Password" name="pwd" required>
  </div>

  <button type="submit" class="btn">Login</button><br>
  
</form><br>

<strong style="color:brown">${status}</strong>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: Arial, sans-serif;
background-color:grey;}
* {box-sizing: border-box;
   }
   
   /* Header/logo Title */
.header {
  padding: 80px;
  text-align: right;
  background: url("image.jpg");
  background-size: 1500px 300px;
  color: brown;
}

/* Increase the font size of the heading */
.header h1 {
  font-size: 40px;
}

/* Sticky navbar - toggles between relative and fixed, depending on the scroll position. It is positioned relative until a given offset position is met in the viewport - then it "sticks" in place (like position:fixed). The sticky value is not supported in IE or Edge 15 and earlier versions. However, for these versions the navbar will inherit default position */
.navbar {
  overflow: hidden;
  background-color: #333;
  position: sticky;
  position: -webkit-sticky;
  top: 0;
}

/* Style the navigation bar links */
.navbar a {
  float: left;
  display: block;
  color: white;
  text-align: center;
  padding: 14px 20px;
  text-decoration: none;
}


/* Right-aligned link */
.navbar a.right {
  float: right;
}

/* Change color on hover */
.navbar a:hover {
  background-color: #ddd;
  color: black;
}

/* Active/current link */
.navbar a.active {
  background-color: #666;
  color: white;
}


.input-container {
  display: flex;
  width: 100%;
  margin-bottom: 25px;
}

.icon {
  padding: 10px;
  background: green;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.btn {
  background-color:green;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}



.btn:hover {
  opacity: 1;
}
</style>




</body>
</html>