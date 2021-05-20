<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../springdemo/path/css/Style.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<title>Add Product</title>
</head>
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
		<div>
			<form method="post" action="addproduct">
				<label class="form-label">Company Name</label>
				<input class="form-control" type="text" name="companyname" autocomplete="off">
				<label class="form-label">Category</label>
				<input class="form-control" type="text" name="category" autocomplete="off">
				<label class="form-label">Price</label>
				<input class="form-control" type="text" name="price" autocomplete="off">
				<label class="form-label">Features</label>
				<input class="form-control" type="text" name="features" autocomplete="off">
				<label class="form-label">Image Name(e.g:cover3.jpg)(DefaultPath:../springdemo/path/img/Your input)</label>
				<input class="form-control" type="text" name="imgpath" autocomplete="off">
				<input type="submit" Style="margin:10px 0px;" class="btn btn-danger">
			</form>
		</div>
	</div>
</div>
</body>
</html>