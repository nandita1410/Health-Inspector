<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="session.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Diagnosis Record</title>
<link rel="stylesheet" href="u_patientrecordprocess.css">
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
			<li style="float: right" ><a href="u_patientrecord.jsp">Back</a></li>
			<li  style="float: right"><a href="logout.jsp">Logout(<%=username %>)</a></li>
		</ul>
</div>
    
	<div id="welcome" class="bg">
	<div class="testbox">
	<h1>Patient Details</h1><hr>
 
	<%
		String patient_id = request.getParameter("p_id");
	String p_id = "";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector", "root", "password");

		PreparedStatement ps1 = conn.prepareStatement("select * from booking_details where patient_id='" +patient_id+ "'");
		ResultSet rs1 = ps1.executeQuery();
		while (rs1.next()) {
			p_id = rs1.getString("patient_id");

		}
		if (p_id.equals(patient_id)) {

			PreparedStatement ps = conn.prepareStatement(
			"Select booking_details.f_name,booking_details.DOB,register.gender,booking_details.bdate,booking_details.dname,booking_details.patient_id,booking_details.speciality from booking_details inner join  register on register.f_name=booking_details.f_name where patient_id='"
					+ patient_id + "' ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
	%>
	<form action="prescription_details.jsp" method="POST" id="regform">
	<div style="float:left;"> 
	
	   <div><label id="icon">Patient ID :</label>
		<input type="text" name="p_id" value="<%=rs.getString("patient_id")%>"><br></div>&nbsp;
			 <div><label id="icon1">Patient Name : <%=rs.getString("f_name")%></label><br>&nbsp; 
			  <label id="icon1">Date of Birth : <%=rs.getString("DOB")%></label><br>&nbsp; 
			  <label id="icon1">Gender : <%=rs.getString("gender")%></label><br>&nbsp; 
			  <label id="icon1">Visit Date : <%=rs.getString("bdate")%></label><br>&nbsp; 
			  <label id="icon1">Doctor Name : <%=rs.getString("dname")%></label><br>&nbsp; 
			  <label id="icon1">Speciality : <%=rs.getString("speciality")%></label><br></div>&nbsp;
</div>
</div>	     
		<%
			}
		%>
		
<div class="testbox1">
<h1>Treatment Required</h1><hr>
<div style="float:right; ">
	<div><label id="icon">Symptoms :</label> 
		<input type="text" name="symptoms" required><br></div>&nbsp;
		
	<div><label id="icon">Diagnosis</label> 
		<input type="text" name="diagnosis" required><br></div>&nbsp;
		 
	<div><label id="icon">Treatment Planned</label>
		<input type="text"	name="treatment" required><br> </div>&nbsp;
		
	<div><label id="icon">Prescription</label>
		<input type="text" name="prescription" required><br></div>&nbsp;
		
	<div><label id="icon">Revisit Required</label>
		<input type="text" name="revisit"><br> </div>&nbsp;
		
	<div><label id="icon">Revisit Date</label> 
		<input type="date" name="revisit_data"><br></div>&nbsp;
		 
	<div><label id="icon">Frequency Revisit </label>
		<input type="text" name="revisit_fre"></div>&nbsp;
		
	<div><input type="submit" value="Submit"></div>
</div>
</div>
	</form>




	<%
		} else {
			out.println(p_id);
	%><script type="text/javascript">
			window.alert('Record Not Found');
			window.location.href = 'u_patientrecord.jsp';
		</script>
	<%
		}
	} catch (Exception e) {
		out.println(e);
	}
	%>



</div>
</body>
</html>