<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
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
		<h1>Product list</h1>
		<table class="table table-dark table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Company Name</th>
					<th>Category</th>
					<th>Price</th>
					<th>Features</th>
					<th>Update</th>
				</tr>
			</thead>
			<tbody>
			   <%
    Class.forName("com.mysql.jdbc.Driver");
  //  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
    Connection con=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");
	
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from products");
    while(rs.next())
    {
    %>
    			
				<tr>
					<td><%=rs.getString("Id") %></td>
					<td><%=rs.getString("Companyname") %></td>
					<td><%=rs.getString("Category") %></td>
					<td><%=rs.getString("Price") %></td>
					<td><%=rs.getString("Features") %></td>
					<td><a href="updatepage.jsp?msg=<%=rs.getString("Id") %>" class="btn btn-danger" >Update</a></td>
				</tr>

				<%
    } %>
			</tbody>
		</table>
	</div>
	</div>
</body>
</html>