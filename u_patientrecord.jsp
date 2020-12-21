<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="session.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment | Patient Search Page</title>
<link rel="stylesheet" href="u_patientrecord.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600'
	rel='stylesheet' type='text/css'>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 4px;
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
			<li style="float: left"><a href="doctordashboard.jsp">Home</a></li>
			<li style="float: right"><a href="logout.jsp">Logout(<%=username %>)
			</a></li>
		</ul>
	</div>

	<div id="welcome" class="bg">
		<div class="testbox">
			<div></div>
			<div>
				<form action="u_patientrecordprocess.jsp" method="post">
					Search by PatientID: <input type="text" name="p_id"> <input
						type="submit" value="Update Diagnosis"> <input
						type="submit" value="View Record"
						onclick="form.action='v_prescription.jsp';">
				</form>
			</div>

			<%
			
		Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector", "root", "password");
	PreparedStatement ps = conn.prepareStatement(
			"select doctor_details.user_id, booking_details.patient_id,booking_details.f_name, booking_details.DOB, booking_details.cnumber, booking_details.bdate, booking_details.cname,booking_details.status from doctor_details inner join booking_details on doctor_details.f_name=booking_details.dname where doctor_details.user_id='"
			+ username + "'");
	ResultSet rs = ps.executeQuery();
	String status="";
	%>

			<div style="margin-top: 30px; margin-left: 100px;">

				<h1>Appointment Pending</h1>
				<hr>
			</div>
			<div style="margin-right: 30px; margin-left: 30px;">
				<form action="a_approval.jsp" method="post">
					<table style="width: 100%" id="t01">
						<tr>
							<th>Patient ID</th>
							<th>Patient Name</th>
							<th>DOB</th>
							<th>Contact Number</th>
							<th>Booking Date</th>
							<th>Clinic Name</th>
							<th colspan="2">Accept/Reject Appointment</th>
						</tr>
						<%
				while (rs.next()) {
					
					status=rs.getString("status");
			%>



						<tr>

							<td><label><%=rs.getString("patient_id")%></label></td>

							<td><input type="text" name="p_name"
								value="<%=rs.getString("f_name")%>"></td>

							<td><label><%=rs.getString("DOB")%></label></td>

							<td><label><%=rs.getString("cnumber")%></label></td>

							<td><label><%=rs.getString("bdate")%></label></td>

							<td><label><%=rs.getString("cname")%></label></td>
							<%if(status.equals("waiting")) {%>
							<td><input type="radio" name="accept_reject" value="accept">Accept
								<input type="radio" name="accept_reject" value="reject">Reject</td>


							<td style="margin-top: 60px;"><input type="Submit"
								value="Confirm"></td>
							<%
							}
							
							else
							{
								%><td><input type="text"
								value="<%=rs.getString("status")%>" name="status"></td>
							<% 
							}
						
								%>


						</tr>
						<%} %>

					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>