<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
     <%@ include file="session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Page</title>
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
		    <li style="float: left" ><a href="patientdashboard.jsp">Home</a></li>
		    <li style="float: right"><a href="searchdoctor.jsp">Back</a></li>
			<li style="float: right"><a href="logout.jsp">Logout(<%=username %>)</a></li>
		</ul>
	</div>
    

	<div id="welcome" class="bg">
		<div class="testbox">
		
	<h1 align="center">Search Doctor</h1>
	<hr>
		
<%
String speciality=request.getParameter("speciality");
%>
<form id="regform" action="booking.jsp" method="post">

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector","root","password");
	PreparedStatement ps=conn.prepareStatement("SELECT distinct doctor_details.f_name FROM doctor_details inner JOIN add_clinic ON doctor_details.cname = add_clinic.cname where doctor_details.speciality='"+speciality+"'");
	ResultSet rs=ps.executeQuery();
	
%>
   <div><label id="icon">Speciality</label><input type="text" name ="speciality" value="<%=speciality%>"></div>
	<div><label id="icon">Doctor Name</label><select name="fname"><%
	
	while(rs.next())
		{
  			String fname=rs.getString("f_name")  	;
  			%>
  			<option value="<%=fname %>"><%=fname %></option>
  			<%
  			
		}
		%>
		</select></div>
		
		<div><label id="icon">Locality</label><select name="locality">
		<%
		PreparedStatement pres=conn.prepareStatement("SELECT distinct  add_clinic.locality FROM doctor_details inner JOIN add_clinic ON doctor_details.cname = add_clinic.cname where doctor_details.speciality='"+speciality+"'");

		ResultSet ms=pres.executeQuery();
	while(ms.next())
		{
  			String locality=ms.getString("locality");
  		
  			
  			%>
  			<option value="<%=locality %>"><%=locality %></option>
  			<%
		}
		%>
		</select></div>
		
		<div><label id="icon">Clinic Name</label><select name="cname">
		<%
		PreparedStatement express=conn.prepareStatement("SELECT distinct add_clinic.cname FROM doctor_details inner JOIN add_clinic ON doctor_details.cname = add_clinic.cname where doctor_details.speciality='"+speciality+"'");

	ResultSet ls=express.executeQuery(); 
	while(ls.next())
		{
		String cname=ls.getString("cname");
  			%>
  			<option value="<%=cname%>"><%=cname%></option>
  			<%

		}
	
		%>
		
		</select></div>
		<div><label id="icon">Appointment Date</label>
		<input type="date" name="bdate"></div>
		<div style="margin-top:50px;"><input type="submit" value="Book"></div>
		</form>
		

 <%
}
catch(Exception e)
{
	out.println(e);
}

%>
</div>
</div>
</body>
</html>