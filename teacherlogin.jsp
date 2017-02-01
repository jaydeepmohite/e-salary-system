<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Teacher Login</title>
</head>
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<script src="JavaScript/jquery.js"></script>
<script src="JavaScript/reset_valid.js"></script>
<script src="lib/scrollToTop.js"></script>
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
     		<li><a href="Mission.html">Mission</a></li>
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
<li><a href="ContactUs.html" class="arrow">Contact Us</a> 
	<ul>  
		<li><a href="feedback.jsp?chk=3">Feedback</a></li>
		<li><a href="FAQ.html">FAQ's</a></li> 
	</ul>
</li>
</ul>
</div>
</div>
</div>  	
<!-- content-wrap -->
<div id="content-wrap">
<div class="login">
      <h1>Teacher Login</h1>
      <form method="post" action="teacherlogin.jsp?chk=1">
        <p><input type="text" name="username" value="" placeholder="Username"></p>
        <p><input type="password" name="password" value="" placeholder="Password"></p>
<%
try{
String chk=request.getParameter("chk");
if("2".equals(chk))
{
	%>
	<%= "<font color='red'><label>Invalid Username Or Password !</label></font>" %>
	<%
}
%>       
       <br> <input type="submit" name="commit" value="Login">
	<a href="tforgotpassword.jsp">Forgot Password ?</a></form>
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
	ResultSet rs=st.executeQuery("select count(*) from teacher_login where t_username='"+usr+"' and t_password='"+pass+"'");
	rs.next();
	int count=rs.getInt(1);
	if(count>0)
	{
		Statement st1=cn.createStatement();
		ResultSet rs1=st1.executeQuery("select t_id from teacher_login where t_username='"+usr+"'");
		rs1.next();
		int tid=rs1.getInt(1);
		session.setAttribute("tid",tid);
		response.sendRedirect("teacherhome.jsp");
	}
	
	else
	{
	
		response.sendRedirect("teacherlogin.jsp?chk=2");
	}
}
}
catch(Exception e){
}
%>