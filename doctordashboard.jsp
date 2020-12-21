<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard</title>
<link rel="stylesheet" href="doctordashboard.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body >
    <div id="nav" class="nav">
		<ul>
			<li><a href="logout.jsp">Logout</a></li>
		</ul>
	</div>
    
	<div id="welcome" class="bg">
	<div class="testbox">
	
		
         
		<h1>Welcome! <%=username %> </h1>
		
		<div>
        <form action="addclinicdetails.jsp">
		<input type="submit" name="addclinicdetails" value="Add Clinic Details">
		</form>
	    <form action="update.jsp">
		<input type="submit" name="updatedoctordetails" value="Update doctor details">
		</form>
	    <form action="u_patientrecord.jsp">
		<input type="submit" name="u_patientrecord" value="Appointments/Search Patient ">
		</form>
		<div>
	</div>
				
		</div>
		</div>
	</div>
	


</body>
</html>