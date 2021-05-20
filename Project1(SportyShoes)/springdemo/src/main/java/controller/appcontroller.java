package controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class appcontroller{
	
	@RequestMapping("/")
	public String home()
	{
		return "Home.jsp";
	}

//@RequestMapping("/add")
//public ModelAndView add(HttpServletRequest req,HttpServletResponse res)
//{
//	String name=req.getParameter("name");
//	String color=req.getParameter("color");
//	
//	ModelAndView mv=new ModelAndView();
//	mv.setViewName("Display.jsp");
//	mv.addObject("Name",name);
//	mv.addObject("Color",color);
//	
//	return mv;
//}
@RequestMapping("/adminlogin")
public  ModelAndView adminlogin(HttpServletRequest req,HttpServletResponse res)
{
	
	String aid=req.getParameter("adminid");
	String apass=req.getParameter("adminpassword");
	
	ModelAndView mv=new ModelAndView();
	mv.addObject("adminid",aid);
	mv.addObject("adminpassword",apass);
	if(aid.equals("Admin"))
	{
		if(apass.equals("123"))
		{
			mv.setViewName("Adminhome.jsp");
		}
		else
		{
			mv.setViewName("Admin.jsp");
		}
	}
	else
	{
		mv.setViewName("Admin.jsp");
	}
	return mv;
}
@RequestMapping("/addproduct")
public void addproduct(HttpServletRequest req,HttpServletResponse res) throws ClassNotFoundException, SQLException, IOException
{
	String companyname=req.getParameter("companyname");
	String category=req.getParameter("category");
	String price=req.getParameter("price");
	String features=req.getParameter("features");
	String imgpath=req.getParameter("imgpath");
	
	Class.forName("com.mysql.jdbc.Driver");
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
	Connection con=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");
	
	PreparedStatement ps=con.prepareStatement("insert into products(Companyname,Category,Price,Features,Imgpath)values(?,?,?,?,?)");
	ps.setString(1, companyname);
	ps.setString(2, category);
	ps.setString(3, price);
	ps.setString(4, features);
	ps.setString(5, imgpath);
	ps.executeUpdate();
	
	res.sendRedirect("ProductPage.jsp");
}

@RequestMapping("/deleteproduct")
public void deleteproduct(HttpServletRequest req,HttpServletResponse res) throws ClassNotFoundException, SQLException, IOException
{
	
	String id=req.getParameter("msg");
	//System.out.println(id);
	Class.forName("com.mysql.jdbc.Driver");
//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
	Connection con=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");	
	PreparedStatement ps=con.prepareStatement("delete from products where Id='"+id+"'");
	ps.executeUpdate();
	
	res.sendRedirect("ProductPage.jsp");
	
	}
@RequestMapping("/updateproduct")
public void updateproduct(HttpServletRequest req,HttpServletResponse res) throws ClassNotFoundException, SQLException, IOException
{
	HttpSession s1=req.getSession();
	String Id=(String) s1.getAttribute("Id");
	String companyname=req.getParameter("companyname");
	String category=req.getParameter("category");
	String price=req.getParameter("price");
	String features=req.getParameter("features");

	Class.forName("com.mysql.jdbc.Driver");
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
	Connection con=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");	
	PreparedStatement ps=con.prepareStatement("update products set Companyname='"+companyname+"', Category='"+category+"', Price='"+price+"', Features='"+features+"' where Id='"+Id+"'");
	ps.executeUpdate();
	
	res.sendRedirect("ProductPage.jsp");
	
	}

@RequestMapping("/signup")
public void signup(HttpServletRequest req,HttpServletResponse res) throws ClassNotFoundException, SQLException, IOException
{
	String name=req.getParameter("name");
	String mail=req.getParameter("mail");
	String phoneno=req.getParameter("phoneno");
	String userid=req.getParameter("userid");
	String password=req.getParameter("password");
	
	Class.forName("com.mysql.jdbc.Driver");
//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
	Connection con=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");
	PreparedStatement ps=con.prepareStatement("insert into newusers(Name,Mail,Phoneno,Userid,Password)values(?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, mail);
	ps.setString(3, phoneno);
	ps.setString(4, userid);
	ps.setString(5, password);
	ps.executeUpdate();
	
	res.sendRedirect("Login.jsp");
	
}

@RequestMapping("/userlogin")
public void userlogin(HttpServletRequest req,HttpServletResponse res)throws ClassNotFoundException, SQLException, IOException
{
	String userid=req.getParameter("userid");
	String password=req.getParameter("password");
	HttpSession user=req.getSession();
	user.setAttribute("userid", userid);
	
	Class.forName("com.mysql.jdbc.Driver");
//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
	Connection con=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from newusers where Userid='"+userid+"' and Password='"+password+"'");
	if(rs.next())
	{
		res.sendRedirect("UserHomePage.jsp");
	}
	else
	{
		res.sendRedirect("Login.jsp");
	}

}

@RequestMapping("/buy")
public void buy(HttpServletRequest req,HttpServletResponse res) throws IOException
{
	String cardnumber=req.getParameter("cardnumber");
	String cvv=req.getParameter("cvv");
	String username=req.getParameter("username");
	String address=req.getParameter("address");
	 HttpSession indi=req.getSession();
	 indi.setAttribute("cardnumber", cardnumber);
	 indi.setAttribute("cvv", cvv);
	 indi.setAttribute("username", username);
	 indi.setAttribute("address", address);
	 
	 res.sendRedirect("Delivery.jsp");
}
@RequestMapping("/buynonuser")
public void buynonuser(HttpServletRequest req,HttpServletResponse res) throws IOException
{
	String cardnumber=req.getParameter("cardnumber");
	String cvv=req.getParameter("cvv");
	String username=req.getParameter("username");
	String address=req.getParameter("address");
	 HttpSession indi=req.getSession();
	 indi.setAttribute("cardnumber", cardnumber);
	 indi.setAttribute("cvv", cvv);
	 indi.setAttribute("username", username);
	 indi.setAttribute("address", address);
	 
	 res.sendRedirect("Deliverynonuser.jsp");
}


@RequestMapping("/minisearch")
public void search(HttpServletRequest req,HttpServletResponse res) throws ClassNotFoundException, SQLException, IOException
{
	String search=req.getParameter("search");
	HttpSession session1=req.getSession();
	session1.setAttribute("search",search);
	
		res.sendRedirect("ParchaseReport.jsp");

	}
@RequestMapping("/minisearch2")
public void search2(HttpServletRequest req,HttpServletResponse res) throws ClassNotFoundException, SQLException, IOException
{
	String search=req.getParameter("search");
	HttpSession session2=req.getSession();
	session2.setAttribute("search",search);
	
		res.sendRedirect("BrowseUser.jsp");

	}

@RequestMapping("/addtokart")
public void addtokart(HttpServletRequest req,HttpServletResponse res) throws IOException, ClassNotFoundException, SQLException
{
	  HttpSession indi=req.getSession();
	 String id=(String)indi.getAttribute("Id");
	 HttpSession user=req.getSession();
		String name=(String)user.getAttribute("userid");

	Class.forName("com.mysql.jdbc.Driver");
//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
	Connection con=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from products where Id='"+id+"'");
	
	String brand=null;
	String category=null;
	String price=null;
	String address=null;		
	if(rs.next())
	{
	brand=rs.getString("Companyname");
	category=rs.getString("Category");
	price=rs.getString("Price");
	address=rs.getString("Features");	
	}
	Connection conn=DriverManager.getConnection("jdbc:mysql://aa1y1ghile0p7t1.cv2uqxokjyuy.us-east-1.rds.amazonaws.com:3306/phase3db","root","rootraja");
	//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3db","root","rootraja");
  PreparedStatement ps1=conn.prepareStatement("insert into kart(Name,Company,Category,Price,Itemid,Address)values(?,?,?,?,?,?)");
	  	ps1.setString(1, name);
		ps1.setString(2, brand);
		ps1.setString(3, category);
		ps1.setString(4, price);
		ps1.setString(5, id);
		ps1.setString(6, address);
		ps1.executeUpdate();
		res.sendRedirect("IndividualPageuserlogin.jsp?msg="+id+"");
}

}

















