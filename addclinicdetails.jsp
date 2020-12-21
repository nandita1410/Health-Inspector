<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Clinic Details</title>
<link rel="stylesheet" href="addclinic.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>
     <div id="nav" class="nav">
		<ul>
		    <li style="float: left" ><a href="doctordashboard.jsp">Home</a></li>
			<li  style="float: right"><a href="logout.jsp">Logout(<%=username %>)</a></li>
		</ul>
	</div>
    

	<div id="welcome" class="bg">
	
		<div class="testbox">
 <h1 align="center">Clinic Details</h1>
  <form id="regform" action="addclinicdetailsprocess.jsp">
  <hr>
  <label  id ="icon" for="cname">Clinic Name:</label>
  <input type="text" name="cname" id="cname" placeholder="Enter your clinic name" required/><br>&nbsp;
  <label id ="icon" for="address">Address:</label>
  <input type="text" name="address" id="address" placeholder="Address" required/><br>&nbsp;
  <label id="icon" for="facility">Facility:</label>
  <input type="text" name="facility" id="facility" placeholder="Facility" required/><br>&nbsp;
  <label id="icon" for="number">Number:</label>
  <input type="text" name="number" id="number" minLength="10" maxlength="10"  placeholder="Contact Number" required/><br>&nbsp;
  <label id="icon" for="Locality">Locality:</label>
  <input type="text" name="locality" id="locality" placeholder="Locality" required/><br>&nbsp;
  <label id="icon" for="Pincode">Pincode:</label>
  <input type="text" name="pincode" id="pincode"  miniLength= "6" maxlength ="7"  placeholder="Code" required/><br>&nbsp;
  <label id="icon" for="website">Website:</label>
  <input type="url" name="website" id="website"  placeholder="Enter the url correctly" required/><br><br>&nbsp;&nbsp;
    <input class="but" type = "submit" value = "ADD"/>
  
  </form>
  </div>
 </div>
</body>
</html>