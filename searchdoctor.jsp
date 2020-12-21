<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
 <%@ include file="session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Doctor</title>
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
			<li  style="float: right"><a href="logout.jsp">Logout(<%=username %>)</a></li>
		</ul>
	</div>
    
	<div id="welcome" class="bg">
		<div class="testbox1">
		
	<h1 align="center">Search Doctor</h1>
	<hr>
	<form id="regform" action="searchdoctorprocess.jsp">
	
		<div>
			<label id="icon" for="speciality">Speciality:</label> 
			<select	name="speciality">

				<%

try{
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector","root","password");
	String query="select distinct speciality from doctor_details";
	Statement stm=conn.createStatement();
	ResultSet rs=stm.executeQuery(query);
	
	
	String speciality="";
	
	
	while(rs.next())
	{
		
		%>
				<option value="<%=rs.getString("speciality") %>" >
					<%=rs.getString("speciality") %>
				</option>
				<%speciality=rs.getString("speciality");
				
				
	}
	
  }
   
  catch(Exception e){
	  e.printStackTrace();
	
}
   %>
			</select><br> 
			<div style="margin-top:50px;"><input type="submit" value ="Search"></div>

		</div>


	</form>
	</div>
</div>
</body>
</html>
