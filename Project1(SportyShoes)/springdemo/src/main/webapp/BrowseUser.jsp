<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browse User List</title>
<link href="../springdemo/path/css/Style.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap" rel="stylesheet"> 
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> 
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
#back
{
font-size:20px;
position:absolute;
top:0px;
right:20px;
border:none;
}
#tablebox
{
padding:50px 100px;
}
.row
{
padding:40px 400px 0px 400px;
}
</style>
</head>
<body>
	<div id="header">
		<div>User List</div>
		<div id="back"><a href="Adminhome.jsp">Back</a></div>
	</div>
	<div>
		<form action="minisearch2" method="post">
			<div class="row">
  				<div class="col-md-10">
    				<input type="search" name="search" class="form-control" autocomplete="off"/>
  				</div>
  				<div class="col-md-2">
  					<input type="submit" value="Search" class="btn btn-primary">
  				</div>
			</div>
		</form>
	</div>
	
	<div id="tablebox">
		<table class="table table-dark table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Mail</th>
					<th>Phoneno</th>
					<th>Userid</th>
					<th>Password</th>
				</tr>
			</thead>
			<tbody>
				  <%
				  HttpSession session2=request.getSession();
				  String name=(String)session2.getAttribute("search");
				  System.out.println(name);
    Class.forName("com.mysql.jdbc.Driver");
  //  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
    Connection con=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");
	
    Statement st=con.createStatement();
    ResultSet rs;
    if(name==null || name=="")
    {
    rs=st.executeQuery("select * from newusers");
    }else{
    	rs=st.executeQuery("select * from newusers where Name='"+name+"'");
    }
    while(rs.next())
    {
    %>
				<tr>
					<td><%=rs.getString("Id") %></td>
					<td><%=rs.getString("Name") %></td>
					<td><%=rs.getString("Mail") %></td>
					<td><%=rs.getString("Phoneno") %></td>
					<td><%=rs.getString("Userid") %></td>
					<td><%=rs.getString("Password") %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>