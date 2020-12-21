<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%-- <%@ include file="session.jsp" %>
 --%><%@ include file="searchdoctor.jsp" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%

String fname=request.getParameter("fname");
String locality=request.getParameter("locality");
String cname=request.getParameter("cname");
String bdate=request.getParameter("bdate");
String speciality=request.getParameter("speciality");


try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector","root","password");
	
	PreparedStatement ps=conn.prepareStatement("update booking_details set dname='"+fname+"',locality='"+locality+"',cname='"+cname+"',bdate='"+bdate+"',speciality='"+speciality+"',status='waiting',patient_id=concat(upper(left('"+speciality+"',3)),s_no) where user_id='"+username+"'");
	int x=ps.executeUpdate();
	
	if(x>0)
	{%>
	
	<script type="text/javascript">
	window.alert(' booked sucessfully ');
	window.location.href='patientdashboard.jsp';
	
	</script>
	

	
	
	<%
	}
	else
	{}
}
catch(Exception e)
{
	out.println(e);
}
	
 



%>


</body>
</html>