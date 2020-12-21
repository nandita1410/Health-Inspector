<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "java.sql.*"%>
    <%@ include file="session.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Doctor Details</title>
<link rel="stylesheet" href="update.css">
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
		<div class=clinic>
 <h1 align="center">Doctor Details</h1>
  <form id="regform" action="updateprocess.jsp">
  <hr>
  <label  id ="icon" for="speciality">Speciality:</label>
  <input type="text" name="speciality" id="speciality" placeholder="Enter your speciality" required/><br>
   <label  id ="icon" for="addclinic">Clinic:</label>
   
  
  <select name="cname">
   
   <%

try{
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector","root","password");
	String query="select cname from add_clinic";
	Statement stm=conn.createStatement();
	ResultSet rs=stm.executeQuery(query);
	while(rs.next())
	{
		
		%>
		<option value="<%=rs.getString("cname") %>">
		<%=rs.getString("cname") %>
		</option>
		<%
	}
  }
   
  catch(Exception e){
	  e.printStackTrace();
	
}
   %>
  </select><br>
  <label  id ="icon" for="availability">Availability:</label>
  <input type ="datetime-local" name="availability" id="availability" required/><br>

    <input class="but" type = "submit" value = "UPDATE"/>
  
  </form>
  </div>
  </div>
  </div>
</body>
</html>