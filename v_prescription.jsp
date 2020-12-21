<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
   <%@include file="session.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Prescription Details</title>
<link rel="stylesheet" href="v_prescription.css">
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
	<div class="testbox" style="width:400px; height:250px;">
<div>
        <h1>Patient's Treatment Record</h1><hr>
		<form method="post">
		
<%String p_id=request.getParameter("p_id"); 
String patient_id="";

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector", "root", "password");
	PreparedStatement ps = conn.prepareStatement("select * from prescription_details where patient_id='"+p_id+"'");
	ResultSet rs=ps.executeQuery();
	
	while(rs.next())
	{
        patient_id=rs.getString("patient_id");
		
	}
	
	if(patient_id.equals(p_id)){
		ResultSet rs2=ps.executeQuery();
		
	while(rs2.next())
	{	
		%>
	<div><label id="icon">Patient Id : &nbsp;<%=rs2.getString("patient_id") %></label><br>&nbsp;
		<label id="icon">Symptoms : &nbsp;&nbsp;<%=rs2.getString("symptoms") %></label><br>&nbsp;
		<label id="icon">Diagnosis : &nbsp;&nbsp;<%=rs2.getString("diagnosis") %></label><br>&nbsp;
		<label id="icon">Treatment Planned : &nbsp;&nbsp;<%=rs2.getString("treatment_planned") %></label><br>&nbsp;
		<label id="icon">Prescription : &nbsp;&nbsp;<%=rs2.getString("prescription") %></label><br>&nbsp;
		<label id="icon">Revisit Required : &nbsp;&nbsp;<%=rs2.getString("revisit_required") %></label><br>&nbsp;
		<label id="icon">Next Revisit Date : &nbsp;&nbsp;<%=rs2.getString("Next_revisit_date") %></label><br>&nbsp;
		<label id="icon">Frequency Revisit : &nbsp;&nbsp;<%=rs2.getString("frequency_revisit") %></label><br>&nbsp;
	</div></div>
		<%
	}
	}
	
	else
	{
		%><script type="text/javascript">
		window.alert('Record Not Found');
		window.location.href='u_patientrecord.jsp';
		
		</script><%
	}
	
	
}
catch(Exception e)
{
	out.println(e);
}
%>
</form>
</div>
</div>
</body>
</html>