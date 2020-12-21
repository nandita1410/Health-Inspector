<%@ page import="java.sql.*"%>
<%@ include file="session.jsp" %>

<%
String speciality=request.getParameter("speciality");
String cname=request.getParameter("cname");
String availability=request.getParameter("availability");

try{ 
	

   	 
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector","root","password");
	PreparedStatement ps=conn.prepareStatement("update doctor_details set speciality='"+speciality+"' , cname='"+cname+"' , availability ='"+availability+"' where user_id='"+username+"'");
	
int x=ps.executeUpdate();

	if(x>0)
	{
	%>
	<html>
	<body>
	<script type="text/javascript">
	window.alert('sucessfull register');
	window.location.href='doctordashboard.jsp';
	
	</script>
	
	<%
	}
	else{
		
	}
	
	
}catch(Exception e){
	out.println(e);
}
%>
</body>
</html>