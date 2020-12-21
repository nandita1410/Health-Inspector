
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Prescription Details</title>
</head>
<body>
<%
String patient_id=request.getParameter("p_id");
String symptoms=request.getParameter("symptoms");
String diagnosis=request.getParameter("diagnosis");
String treatment=request.getParameter("treatment");
String prescription=request.getParameter("prescription");
String revisit=request.getParameter("revisit");
String revisit_data=request.getParameter("revisit_data");
String revisit_fre=request.getParameter("revisit_fre");
String p_id="";
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector", "root", "password");
	PreparedStatement ps1 = conn.prepareStatement("select * from prescription_details");
	ResultSet rs1=ps1.executeQuery();
	while(rs1.next())
	{
	 p_id=rs1.getString("patient_id");
	}
	if(p_id.equals(patient_id))
	{
		PreparedStatement ps2 = conn.prepareStatement("update prescription_details set symptoms='"+symptoms+"',diagnosis='"+diagnosis+"',treatment_planned='"+treatment+"',prescription='"+prescription+"', revisit_required ='"+revisit+"',Next_revisit_date ='"+revisit_data+"',frequency_revisit='"+revisit_fre+"' ");
		int x=ps2.executeUpdate();
		if(x>0)
		{%>
		
		<script type="text/javascript">
		window.alert('sucessfull register');
		window.location.href='doctordashboard.jsp';
		
		</script>
		
		<%
		}
		else{
			
		}
		
		
	}
	else {

	
	PreparedStatement ps = conn.prepareStatement("insert into prescription_details (patient_id,symptoms,diagnosis,treatment_planned,prescription, revisit_required ,Next_revisit_date ,frequency_revisit) values (?,?,?,?,?,?,?,?)");
	ps.setString(1,patient_id);
	ps.setString(2,symptoms);
	ps.setString(3,diagnosis);
	ps.setString(4,treatment);
	ps.setString(5,prescription);
	ps.setString(6,revisit);
	ps.setString(7,revisit_data);
	ps.setString(8,revisit_fre);
	
	int x = ps.executeUpdate();
	if(x>0)
		{
		%>
		<script type="text/javascript">
		window.alert('Data saved successfully');
		window.location.href='doctordashboard.jsp';
		
		</script>
		
		<%
		}
		else{
			
		}
	
	}

}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>