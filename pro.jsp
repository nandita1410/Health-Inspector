<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>

<script type="text/javascript">

function check(){
   element=  document.getElementById("regform");
 var  p1=element.repass.value
 var  p2=element.password.value
  if(p1==p2){
	  return true;
  }else{
	  
	  alert("Password Doesn't MAtch");
	  element.repass.value='';
	  element.password.value='';
	  return false;
  }
}
</script>

<link rel="stylesheet" href="RegisterStyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="testbox">
  <h1>Register As Patient</h1>

  <form id="regform" action="RegisterServlet" method="post" onsubmit="return check()">
      <hr>
  <label id="icon" for="fname"><i class="fas fa-user"></i></label>
  <input type="text" name="fname" id="fname" placeholder="First Name" required/>
   <label id="icon" for="lname"><i class="fas fa-user"></i></label>
  <input type="text" name="lname" id="lname" placeholder="Last Name" required/><br>
  <label id="icon" for="age"><i class="fas fa-baby"></i></label>
  <input type="text" name="age" id="age"  minLength="1" maxlength="2" pattern="[1-9]{2}" placeholder="Age" required/>
  <label id="icon" for="contactnumber"><i class="fas fa-phone"></i></label>
  <input type="text" name="contactnumber" id="contactnumber" minLength="10" maxlength="10" pattern="[7-9]{1}[0-9]{9}" placeholder="Contact Number" required/>
  <label id="icon" for="userid"><i class="fas fa-id-card"></i></label>
  <input type="text" name="userid" id="userid" placeholder="User Id" required/>
  <label id="icon" for="password"><i class="fa fa-user-secret"></i></label>
  <input type="password" name="password" id="password" minlength= "8"  placeholder="Password" required/>
  <label id="icon" for="repass"><i class="fa fa-user-secret"></i></label>
  <input type="password" name="repass" id="repass"  minlength= "8"  placeholder="Re-Enter Password" required/>
  <div class="gender">
    <input type="radio" value="Male" id="male" name="gender" checked/>
    <label for="male" class="radio" >Male</label>
    <input type="radio" value="Female" id="female" name="gender" />
    <label for="female" class="radio">Female</label>
   </div> 
    <input class="but" type = "submit" value = "Register"/>
   <a href="loginForm.html" class="button">Login</a>
  </form>
</div>
</body>
</html>
© 2020 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
