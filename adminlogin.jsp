<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Admin Login</title>
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<script src="lib/jquery.js"></script>
<script src="lib/scrollToTop.js"></script>
</head>
<body id="top">
<!--header -->
<div id="header-wrap">
<div class="header">
    <div class="hgroup">
    <div class="heading1">Government Of Maharashtra</div>
    <h1>Payroll And E-Salary Systems</h1>
<br>
<ul class="menuH decor1"> 
<li><a href="Homepage.html" class="arrow">Home</a>
	<ul> 
		<li><a href="Homepage.html" >About Us</a></li> 
     		<li><a href="">Mission</a></li>
	</ul>
<li><a href="schoollogin.jsp" class="arrow">School</a> 
	<ul> 
		<li><a href="schoollogin.jsp" >School Login</a></li> 
     		<li><a href="newschool.jsp">School Registration</a></li>
	</ul> 
</li> 
<li><a href="teacherlogin.jsp" class="arrow">Teacher</a> 
	<ul> 
		<li><a href="teacherlogin.jsp">Teacher Login</a></li> 
		<li><a href="newteacher.jsp?chk=4">Teacher Registration</a></li> 
	</ul>
</li>  
<li><a href="adminlogin.jsp" class="arrow">Administration</a> 
	<ul> 
		<li><a href="adminlogin.jsp">Admin Login</a></li>  
	</ul>
</li>
<li><a href="" class="arrow">Contact Us</a> 
	<ul>  
		<li><a href="feedback.jsp?chk=3">Feedback</a></li>
		<li><a href="">FAQ's</a></li> 
	</ul>
</li>
</ul>
</div>
</div>
</div>
<!-- content-wrap -->
<div id="content-wrap">
<div class="login">
      <h1>Admin Login</h1>
      <form method="post" action="adminlogin.jsp?chk=1">
        <p><input type="text" name="username" value="" placeholder="Username or Email"></p>
        <p><input type="password" name="password" value="" placeholder="Password"></p>
<%
try{
String chk=request.getParameter("chk");
if("2".equals(chk))
{
	out.println("<label>Invalid Username or Password !</label>");
}
%>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me">
            Remember me on this computer
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="Login"></p>
      </form>
</div>
</div>
</body>
</html>
<%
if("1".equals(chk))
{
	String usr=request.getParameter("username");
	String pass=request.getParameter("password");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	Statement st=cn.createStatement();
	ResultSet rs=st.executeQuery("select count(*) from admin_login where a_username='"+usr+"' and a_password='"+pass+"'");
	rs.next();
	int count=rs.getInt(1);
	if(count>0)
	{
		Statement st1=cn.createStatement();
		ResultSet rs1=st1.executeQuery("select a_id from admin_login where a_username='"+usr+"'");
		rs1.next();
		int aid=rs1.getInt(1);
		session.setAttribute("aid",aid);
		response.sendRedirect("adminhome.jsp");
	}
	else
	{
	
		response.sendRedirect("adminlogin.jsp?chk=3");
	}
}
}catch(Exception e){}
%>