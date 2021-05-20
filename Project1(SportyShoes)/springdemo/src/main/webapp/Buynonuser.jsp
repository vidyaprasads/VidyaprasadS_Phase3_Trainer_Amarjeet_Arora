<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Product</title>
<link href="../springdemo/path/css/Style.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<style>
#boxcontent
{
padding:50px 200px;
}
label
{
color:black;
}
h1
{
text-align:center;
padding:20px;
}
</style>
</head>
<body>
	<h1>Buy</h1>
	<div id="boxcontent">
		<form method="post" action="buynonuser">
				<label class="form-label">Card Number</label>
				<input class="form-control" type="text" name="cardnumber" autocomplete="off">
				<label class="form-label">CVV</label>
				<input class="form-control" type="text" name="cvv" autocomplete="off">
				<label class="form-label">User Name</label>
				<input class="form-control" type="text" name="username" autocomplete="off">
				<label class="form-label">Address</label>
				<input class="form-control" type="text" name="address" autocomplete="off">
				<input type="submit" Style="margin:10px 0px;" class="btn btn-primary" value="Conform Payment">
		</form>
	</div>
</body>
</html>