<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<link href="../springdemo/path/css/Style.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

<style>
#loginform
{
    padding:100px 400px;
}
#loginbutton
{
	margin:20px 0px 0px 0px;
}
#title
	{
		font-size:32px;
		padding:20px;
		text-align:center;
		color:white;
		font-weight:600px;
		font-family:'Montserrat',sans-serif;
	}	
body
	{
	background-image:url('../springdemo/path/img/sneakers.jpg');
	background-position:center;
	background-size:cover;
	background-repeat:no-repeat;
	}
.form-control
{
	background:transparent;
}
label
{
font-family:'Montserrat',sans-serif;
color:white;
}
a{
color:white;
text-decoration:none;
position:absolute;
bottom:230px;
right:700px;
}
</style>
</head>
<body>
<div id="title">
		<h2 style="text-align:center;">User Login</h2>
	</div>
	<div id="adminbg" >
	<form id="loginform" action="userlogin" method="post"  autocomplete="off" >
		<label class="form-label">User Id</label>
		<input type="text" class="form-control" name="userid" required>
		<label class="form-label">Password</label>
		<input type="text" class="form-control" name="password" required>
		<input type="submit" style="width:120px" class="btn btn-dark" id="loginbutton" value="Login">
		<a href="Newuser.jsp" class="btn btn-primary">New User?</a>
	</form>
	
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
	
</body>
</html>