<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
    <% 
    String id=request.getParameter("msg");
	  HttpSession s1=request.getSession();
	  s1.setAttribute("Id", id);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../springdemo/path/css/Style.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap" rel="stylesheet"> 
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> 
   
<title>Product Page</title>
<style>
#box1
{
	height:100vh;
	width:300px;
	font-family:"Montserrat",Sans-serif;
	font-weight:600px;
	font-size:24px;
	background-color:white;
	color:white;
	text-align:left;
	padding:0px;
	border-right:solid 1px gray;
	
}
a{
	text-decoration:none;
	color:black;
	padding:20px 40px;
	border-bottom:solid 1px gray;
}
#logout
{
border:none;
}
label
{
color:black;
}
form
{
padding-top:100px;
}
</style>
</head>
<body>
	<div class="row">
	<div id="box1" style="box-shadow:0px 20px 5px;" class="col-lg-4">
		<a id="logout" href="Adminhome.jsp">Back</a>
		<a href="ProductPage.jsp">Product List</a>
		<a href="AddProduct.jsp">Add Product</a>
		<a href="DeleteProduct.jsp">Delete Product</a>
		<a href="UpdateProduct.jsp">Update Product</a>
		
	</div>
	<div id="box2" class="col-lg-8">
		<form method="post" action="updateproduct">
				<label class="form-label">Company Name</label>
				<input class="form-control" type="text" name="companyname" autocomplete="off">
				<label class="form-label">Category</label>
				<input class="form-control" type="text" name="category" autocomplete="off">
				<label class="form-label">Price</label>
				<input class="form-control" type="text" name="price" autocomplete="off">
				<label class="form-label">Features</label>
				<input class="form-control" type="text" name="features" autocomplete="off">
				<input type="submit" Style="margin:10px 0px;" class="btn btn-danger">
			</form>
	</div>
	</div>
	
</body>
</html>