<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<link rel="stylesheet" href="Registerstyle.css">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body id="log">
<div id="nav" class="nav">
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="registration.jsp">Register</a></li>
			<li><a href="login.jsp">Login</a></li>
			
		</ul>
	</div>

	<div id="welcome" class="bg">
		

<div align="center"><h1>Health Inspector</h1></div>

<div align="center">
<div class="testbox">

 <h1> Registration </h1>
 <hr>

<form id="regform" action="registrationprocess.jsp" method="post">

<div><label id="icon" for="firstname">First Name </label>
<input type="text" id="f_name" name="f_name" required><br></div>
&nbsp;

<div>
<label id="icon" for="lastname">Last Name </label>
<input type="text" id="l_name" name="l_name" required><br></div>
&nbsp;

<div><label id="icon" for="dob">DOB</label>
<input type="date" id="dob" name="dob" required><br></div>
&nbsp;

<!-- <div class="gender"><label id="icon"  for="gender">Gender</label>
<input type="radio" id="male" name="gender" class="radio" value="male">male
 <input type="radio" id="female" name="gender" class="radio" value="female">female<br></div>
 &nbsp; -->
 <div style="margin-right:100px; ">
    <label id="icon"  for="gender" >Gender</label>
     <input type="radio" value="male" id="male" name="gender" checked/>
    <label for="male"  >Male</label>
    <input type="radio" value="female" id="female" name="gender" />
    <label for="female" >Female</label>
   </div> 
   &nbsp;
 <div><label id="icon" for="contactnumber">Contact Number</label>
<input type="text" id="contact_number" name="contact_number"required><br></div>
&nbsp;

<div><label id="icon" for="userid">UserID</label>
<input type="text" id="user_id" name="user_id"required><br></div>
&nbsp;

<div><label id="icon" for="password">Password</label>
<input type="password" id="password" name="password" required><br></div>
&nbsp;

<div style="margin-right:100px;"><label id="icon" for="usercategory">User Category </label>
<input type="radio" id="doctor" name="user_category" class="radio" value="doctor">doctor
 <input type="radio" id="patient" name="user_category" class="radio" value="patient">patient<br></div>
&nbsp;

<div><input type="submit" value="register"></div>
</form>

</div>
</div>
</div>

</body>
</html>