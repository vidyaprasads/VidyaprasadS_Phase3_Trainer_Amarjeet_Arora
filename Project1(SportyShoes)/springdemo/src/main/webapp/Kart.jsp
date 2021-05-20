<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../springdemo/path/css/Style.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<title>Kart</title>
<style>
h1{
text-align:center;
padding:20px;
}
#box
{
width:100%;
padding:10px 100px;
border-bottom:1px solid gray;
margin:0px;
}
a{
color:black;
text-decoration:none;
}
a:hover{color:black;}
#container
{
	padding:10px 100px;
}
</style>
</head>
<body>
	<div>
		<h1>Items Added</h1>
		
				<div id="container">
			<table>
			 <%
			 HttpSession user=request.getSession();
				String name=(String)user.getAttribute("userid");
				
				Class.forName("com.mysql.jdbc.Driver");
			//	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
				  Connection con1=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");
					
			   	Statement st1=con1.createStatement();
				ResultSet rs1=st1.executeQuery("select * from kart where Name='"+name+"'");
				while(rs1.next())
				{
				%>
				<a href="IndividualPageuserlogin.jsp?msg=<%=rs1.getString("Itemid") %>" >
				<div id="box">
						<h5>Brand: <%=rs1.getString("Company") %> (Item Id:<%=rs1.getString("Itemid") %>)</h5>
						<p>Category: <%=rs1.getString("Category") %></p>
						<h4>Price: RS.<%=rs1.getString("Price") %></h4>							
				</div>
				</a>
					<%}
%>
			</table>
			</div>
	</div>
</body>
</html>
