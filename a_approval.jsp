<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String p_name = request.getParameter("p_name");
	String DOB = request.getParameter("DOB");
	String cnumber = request.getParameter("cnumber");
	String bdate = request.getParameter("bdate");
	String cname = request.getParameter("cname");
	String acc_rej= request.getParameter("accept_reject");



	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthinspector", "root", "password");
		if (acc_rej.equals("accept")) {
			PreparedStatement ps = conn
			.prepareStatement("update booking_details set status='" + acc_rej + "' where f_name='" + p_name + "'");
			int x = ps.executeUpdate();
			if (x > 0) {
	%>

	<script type="text/javascript">
		window.alert('Accepted Appointment');
		window.location.href = 'doctordashboard.jsp';
	</script>

	<%
		} 
	}

	else {
		PreparedStatement ps = conn
		.prepareStatement("update booking_details set status='" + acc_rej + "' where f_name='" + p_name + "'");
		int x = ps.executeUpdate();
		if (x > 0) {
	%>

	<script type="text/javascript">
		window.alert('Rejected Appointment');
		window.location.href = 'doctordashboard.jsp';
	</script>

	<%
		} 
	}
	} catch (Exception e) {
		out.println(e);
	}
	%>
</body>
</html>