<%@ page import="java.sql.*"%>

<%
String f_name=request.getParameter("f_name");
String l_name=request.getParameter("l_name");
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
String contact_number=request.getParameter("contact_number");
String user_id=request.getParameter("user_id");
String password=request.getParameter("password");
String user_category=request.getParameter("user_category");
try{ 
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector","root","password");
	PreparedStatement ps=conn.prepareStatement("insert into register (f_name,l_name,dob,gender,contact_num,user_id,user_password,user_category) values(?,?,?,?,?,?,?,?)");
	
	ps.setString(1,f_name);
	ps.setString(2,l_name);
	ps.setString(3,dob);
	ps.setString(4,gender);
	ps.setString(5,contact_number);
	ps.setString(6,user_id);
	ps.setString(7,password);
	ps.setString(8,user_category);
	
	int x=ps.executeUpdate();
	
	if(user_category.equals("doctor"))
	{
	PreparedStatement rs=conn.prepareStatement("insert into doctor_details (f_name,l_name,DOB,cnumber,user_id,password) select f_name,l_name,dob,contact_num,user_id,user_password from register where user_id='"+user_id+"'");
	rs.executeUpdate();
	}
	
	else if(user_category.equals("patient"))
	{
		PreparedStatement rs=conn.prepareStatement("insert into booking_details (f_name,l_name,DOB,cnumber,user_id,password) select f_name,l_name,dob,contact_num,user_id,user_password from register where user_id='"+user_id+"'");
		rs.executeUpdate();
	}
	 if(x>0)
	{%>
	<html>
	<body>
	<script type="text/javascript">
	window.alert('sucessfull register');
	window.location.href='index.jsp';
	
	</script>
	
	<%
	}
	else{
		
	}
	
	
	
	
}catch(Exception e){
	out.println(e);
	%>
	
	<!-- <script type="text/javascript">
	window.alert('register Failed');
	window.location.href='registration.jsp'; -->
	
	</script>
	<%
}
%>
</body>
</html>