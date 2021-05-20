<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.* , java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Parchase Report</title>
<link href="../springdemo/path/css/Style.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<style type="text/css">
h1{
padding:20px;}
#tablebox
{
	padding:20px 100px 50px 100px;
}
.row
{
padding:40px 400px 0px 400px;
}
a
{
position:absolute;
top:20px;
right:100px;
}

</style>
</head>
<body>
	<h1>Purchase Report</h1>
	<div>
		<form action="minisearch" method="post">
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
	<a href="Adminhome.jsp" class="btn btn-primary">Back</a>
<div id="tablebox">
	<table  class="table table-dark table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>Brand</th>
				<th>Category</th>
				<th>Price</th>
				<th>User Name</th>
				<th>Address</th>
				<th>Ordered Date</th>
			</tr>
		</thead>
		<tbody>
		<%
		HttpSession session1=request.getSession();
		String search=(String)session1.getAttribute("search");
		System.out.println(search);
		
		Class.forName("com.mysql.jdbc.Driver");
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
	  Connection con=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");
	Statement st=con.createStatement();
	ResultSet rs;
	if(search==null || search==""){
		 rs=st.executeQuery("select * from purchasereport"); 	
	}else{
		 rs=st.executeQuery("select * from purchasereport where Company='"+search+"' or Category='"+search+"' or Price='"+search+"' or Username='"+search+"' or Ordereddate='"+search+"'");                                                                                     
	}
	
		while(rs.next())
		{
		%>
				<tr>
					<td><%=rs.getString("Id") %></td>
					<td><%=rs.getString("Company") %></td>
					<td><%=rs.getString("Category") %></td>
					<td><%=rs.getString("Price") %></td>
					<td><%=rs.getString("Username") %></td>
					<td><%=rs.getString("Address") %></td>
					<td><%=rs.getString("Ordereddate") %></td>
				</tr>
		<%	
		}
	%>
	
			
		</tbody>
	</table>
</div>
</body>
</html>