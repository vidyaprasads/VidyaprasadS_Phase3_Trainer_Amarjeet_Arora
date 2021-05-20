<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home Page</title>
<link href="../springdemo/path/css/Style.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<style>
#img1
{
	background-image:linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url('../springdemo/path/img/systemmanagement.jpg');
	background-position:center;
	background-size:cover;
	background-repeat:no-repeat;
	color:white;
}
#img2
{
	background-image:linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url('../springdemo/path/img/users.jpg');
	background-position:center;
	background-size:cover;
	background-repeat:no-repeat;
	color:white;
	
}
#img3
{
background-image:linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url('../springdemo/path/img/purchasereport.jpg');
	background-position:center;
	background-size:cover;
	background-repeat:no-repeat;
	color:white;
}
#adminlogout
{
	
	position:absolute;
	width:100px;
	font-size:20px;
	top:30px;
	right:20px;
}
#adminlogout a{
	text-decoration:none;
	color:#fb3640;
	margin:0px;
}
#adminlogout a:hover{
	background-color:#fb3640;
	color:white;
	transition:0.5s ease;
	
}
#col1,#col2,#col3
{
	padding:150px 40px;
	
}
.box
{
	width:100%;
	height:200px;
	text-align:center;
	font-family:'Montserrat',sans-serif;
	font-size:20px;
	padding:80px 0px;
	color:black;
}
</style>
</head>
<body>
	<div id="header">
		<div>Admin Home</div>
		<div id="adminlogout"><a href="Home.jsp">Logout</a></div>
	</div>
	<div id="body">
		<div class="row">
			<div class="col-md-4" id="col1">
				<a href="ProductPage.jsp" style="text-decoration:none;"><div class="box" id="img1">Manage the products</div></a>
			</div>
			<div class="col-md-4" id="col2">
				<a href="BrowseUser.jsp"  style="text-decoration:none;"><div class="box" id="img2">Browse the users</div></a>
			</div>
			<div class="col-md-4" id="col3">
				<a href="ParchaseReport.jsp"  style="text-decoration:none;"><div class="box" id="img3">See the Parchase Report</div></a>
			</div>
		</div>
	</div>
</body>
</html>