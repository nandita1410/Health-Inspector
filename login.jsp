<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" href="loginstyle.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body id="log">
	<div id="nav" class="nav">
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="registration.jsp">Register</a></li>
			<li><a href="login.jsp">Login</a></li>
			
		</ul>
	</div>

	<div id="welcome" class="bg">
		<div align="center">
			<h1>Health Inspector</h1>
		
			
		</div>




		<div class="testbox">

            <h1>Login</h1>
			<hr>
			<form action="loginprocess.jsp" method="post">
				<div>
					<label id="icon" for="userid">User Id</label> 
					<input type="text"
						name="userid" id="userid" placeholder="User Id" required /> <br>
				</div>
				&nbsp;
				<div>
					<label id="icon" for="password">Password</label>
					 <input
						type="password" name="password" id="password"
						placeholder="Password" required /> <br>
				</div>
				&nbsp;
				<div>
					<input type="submit" value="Login" /> 
					<!--<input type="reset"	value="Reset"> -->
					<a href="registeration.jsp" class="button">New User | Register</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>