<%@ page import="java.sql.*"%>

<%
String user_id=request.getParameter("userid");
String passwordd=request.getParameter("password");
int k=0;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector","root","password");
	PreparedStatement ps=conn.prepareStatement("Select * from register where user_id='"+user_id+"' and user_password='"+passwordd+"'");
	ResultSet ms=ps.executeQuery();
	      
         while(ms.next())
         {
        	 String m=ms.getString(6);
             session.setAttribute("user_id",user_id);
             session.setAttribute("user_password",passwordd);
             k=1;
    	}    
    	
    	if(k==1)
    	{
    		%><script type="text/javascript">
			window.alert('Login successfully');
			window.location.href = 'addclinicdetails.jsp';
		</script><%
    	}
    	else
    	{
    		%><script type="text/javascript">
			window.alert('Invalid User | Admin');
			window.location.href = 'admin.jsp';
		</script><%
    	}
    	
}
	catch(Exception e){
		out.println(e);
	}
	
%>	