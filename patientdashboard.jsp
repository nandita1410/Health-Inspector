<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@include file="session.jsp"%>
		<%@ page import="java.sql.*"%>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Dashboard</title>
<link rel="stylesheet" href="patientdashboard.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 5px;
}
table#t01 tr:nth-child(even) {
  background-color: #eee;
}
table#t01 tr:nth-child(odd) {
 background-color: #fff;
}
table#t01 th {
  background-color: black;
  color: white;
}

</style>

</head>
<body>
<div id="nav" class="nav">
		<ul>
			<li style="float:right;"><a href="logout.jsp">Logout</a></li>
		</ul>
	</div>
    
	<div id="welcome" class="bg">
		<div class="testbox">
	
		<h1>Welcome! <%=username %></h1>
		<div>
		<form action="searchdoctor.jsp">
		<input type="submit" name="searchdoctor" value="Book Appointment">
		</form>
	    </div>
		
		<%
		Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector", "root", "password");
	PreparedStatement ps = conn.prepareStatement(
			"select doctor_details.f_name,  doctor_details.cnumber, booking_details.bdate, booking_details.cname,booking_details.status from doctor_details inner join booking_details on doctor_details.f_name=booking_details.dname where booking_details.user_id='"
			+ username + "'");
	ResultSet rs = ps.executeQuery();
	
	%>
	
	 <div><h1>Appointment Details </h1><hr></div>
	<div >
	
		<table style="width:100%" id="t01">
			<tr>
				<th>Doctor Name</th>
				<th> Doctor Contact Number</th>
				<th>Appointment Date</th>
				<th>Clinic Name</th>
				<th>Status</th>
			</tr>
			<%
				while (rs.next()) {
			%>
			
			<tr>
				<td><label><%=rs.getString("f_name")%></label></td>
				
				<td><label><%=rs.getString("cnumber")%></label></td>

				<td><label><%=rs.getString("bdate")%></label></td>

				<td><label><%=rs.getString("cname")%></label></td>
				
				<td><label><%=rs.getString("status")%></label></td>
				
			</tr>
			
			<%
				}
			%>


		</table>
		
	</div>
	</div>
	</div>
</body>
</html>