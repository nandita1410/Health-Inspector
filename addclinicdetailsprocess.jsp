<%@ page import= "java.sql.*"%>

<%
String cname =request.getParameter("cname");
String address =request.getParameter("address");
String facility =request.getParameter("facility");
String number =request.getParameter("number");
String locality =request.getParameter("locality");
String pin =request.getParameter("pincode");
String website =request.getParameter("website");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector","root","password");
	PreparedStatement ps = conn.prepareStatement("insert into add_clinic(cname , address , facility , number ,locality , pin , website ) values(?,?,?,?,?,?,?)");
    ps.setString(1,cname);
	ps.setString(2,address);
	ps.setString(3,facility);
	ps.setString(4,number);
	ps.setString(5,locality);
	ps.setString(6,pin);
	ps.setString(7,website);
	
	int x =ps.executeUpdate();
	if(x>0){
		%><script type="text/javascript">
		window.alert('Clinic Details Added Successfully');
		window.location.href = 'doctordashboard.jsp';
	</script>
<%

	}
	 else {
		
%><script type="text/javascript">
		window.alert('Not Added');
		window.location.href = 'doctordashboard.jsp';
	</script>
<%

	}
	
	
	
    	
}catch(Exception e){
	out.println(e);
	
}
%>

