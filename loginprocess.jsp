


<%@ page import="java.sql.*"%>

<%
String user_id=request.getParameter("userid");
String passwordd=request.getParameter("password");
int k=0;

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector","root","password");
	PreparedStatement ps=conn.prepareStatement("Select * from register where user_id='"+user_id+"' and user_password='"+passwordd+"'");
	ResultSet rs=ps.executeQuery();
	
	if(rs.next())
	{
         session.setAttribute("user_id",user_id);
         session.setAttribute("user_password",passwordd);
         
         
         PreparedStatement sql=conn.prepareStatement("SELECT * FROM register where user_id='"+user_id+"'");
     	
         ResultSet  ms= sql.executeQuery();
         while(ms.next()){
        	

        	 String user_category=ms.getString("user_category") ;
        	 if(user_category.equals("doctor"))
        	 {
        		 response.sendRedirect("doctordashboard.jsp");
        	 }
        	 
        	 else if(user_category.equals("patient"))
        	 {
        		 response.sendRedirect("patientdashboard.jsp");
        	 }
        	 

        	 }
		}
		 
	
	else
	{
		%>
	    <script type="text/javascript">
		window.alert('Invalid User');
		window.location.href = 'login.jsp';
	</script>

	<%
		}
		%>
