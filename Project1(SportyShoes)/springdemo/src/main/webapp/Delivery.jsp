<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.Date" %>
  <%@ page import="java.text.DateFormat, java.text.SimpleDateFormat" %>
    	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delivery Page</title>
<link href="../springdemo/path/css/Style.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<style>
.col-md-6
{
padding:40px 50px;
}
h1
{
padding:20px;
}
#thank
{
text-align:center;
}
</style>
</head>
<body>
	<div class="row">
	<h1>Delivery</h1>
	<br>
	<p id="thank">Thank you for Purchase!</p>
	<div class="col-md-6">
	<h2>Product Detail:</h2>
	<%
		Date date=new Date();
		
		DateFormat dateFormat = new SimpleDateFormat("dd-mm-yyyy");  
		String strDate = dateFormat.format(date);  
    	HttpSession indi=request.getSession();
   		String id=(String)indi.getAttribute("Id");
  /*	String cardnumber=(String)indi.getAttribute("cardnumber");
   		String cvv=(String)indi.getAttribute("cvv");	*/ 
   		String username=(String)indi.getAttribute("username");
   		String address=(String)indi.getAttribute("address");
   		String company=null;
		String category=null;
		String price=null;
   	
   				
   		Class.forName("com.mysql.jdbc.Driver");
 //  		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
   	  Connection con=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");
  	
   		Statement st=con.createStatement();
   		ResultSet rs=st.executeQuery("select * from products where Id='"+id+"'");
   		while(rs.next())
   		{
   			 company=rs.getString("Companyname");
   			 category=rs.getString("Category");
   			 price=rs.getString("Price");
   		%>
	<div>
				<h3><%=rs.getString("Companyname") %></h3>
				<h2><%=rs.getString("Category") %></h2>
				<p>Price: Rs.<%=rs.getString("Price") %></p>
				<h4 style="color:red;">Free Delivery Available!</h4>
				<p>Features:<br>
				<%=rs.getString("Features") %>
				</p>
				<h4>Ordered Date:<%=date %></h4>
				<h4>Delivery Date: Within 7 Days from ordered date</h4>
	</div>
	<% 
		indi.setAttribute("company", rs.getString("Companyname"));
		indi.setAttribute("category", rs.getString("Category"));
		indi.setAttribute("price", rs.getString("Price"));
   		}
    %>
    <%
    	Class.forName("com.mysql.jdbc.Driver");
	//	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
	  Connection con1=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");
	
		PreparedStatement ps=con1.prepareStatement("insert into purchasereport(Company,Category,Price,Username,Address,Ordereddate)values(?,?,?,?,?,?)");
    	ps.setString(1, company);
    	ps.setString(2, category);
    	ps.setString(3, price);
    	ps.setString(4, username);
    	ps.setString(5, address);
    	ps.setString(6, strDate);
    	ps.executeUpdate();
    %>
    </div>
    <div class="col-md-6">
    	<h2>Card Details:</h2>
    	<h3>Card Holder Name: <%=username %></h3>
    	<p>Address:<br><%=address %></p>
    </div>
    <div style="margin:0px 40px;"><a href="UserHomePage.jsp" class="btn btn-primary">Continue Shoping</a></div>
    </div>
</body>
</html>