<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Password Reset Page</title>
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<script src="JavaScript/jquery.js"></script>
<script src="JavaScript/reset_valid.js"></script>
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
<center>
<h3>Password Reset</h3>
<form action="tforgotpassword.jsp?chk=1" method="post" name="myForm">
<table><tr><td>
<label>Enter Username : </td><td width=75%></label><input required="" type="text" name="username" onkeyup="return validate()"><label id="mydiv"></label></td></tr>
<tr><td><label>Select Security Question :</td><td></label><select name="question"><option value="0">---Select Security Question---</option><option value="What is your Pet Name?">What is your Pet Name?</option><option value="What is your Favourite Movie ?">What is your Favourite Movie ?</option><option value="What is your Mother's name ?">What is your Mother's name ?</option></select><label id="mydiv1"></label></td></tr>
<tr><td><label>Submit The Answer : </td><td></label><input required="" type="text" name="answer" onkeyup="return validate2()"><label id="mydiv2"></label></td></tr>
<tr><td><label>Enter New Password : </td><td></label><input required="" type="password" name="password1" onkeyup="return validate3()"><label id="mydiv3"></label></td></tr>
<tr><td><label>Re-Enter New Password : </td><td></label><input required="" type="password" name="password2" onkeyup="return validate4()"><label id="mydiv4"></label></td></tr></table>
<input type="submit" value="Submit" onclick="return validate1()">
</form></center>
</div>
<!-- footer -->
<div class="footer">

	<p class="footer-left">
		© 2014 &nbsp; &nbsp; &nbsp;
		Design by <a href="#">JDK SOft Ltd. Pune</a> &nbsp; &nbsp; &nbsp; Best view in Firefox 18.0,Google Chrome 24.0
	</p>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      <a href="#top" class="back-to-top">Back to Top</a>
<!-- /footer -->
</div>
</body>
</html>
<!-- JSP Script -->

<%
try
{
	String chk=request.getParameter("chk");
	if("3".equals(chk))
	{
		out.println("<label>Password Mismatch ! Try Again !</label><br>");
	}
	if("2".equals(chk))
	{
		out.println("<label>Username Exits! Enter Another Username !</label><br>");
	}
	if("1".equals(chk))
	{
		String usr=request.getParameter("username");
		String ques=request.getParameter("question");
		String ans=request.getParameter("answer");
		String pass1=request.getParameter("password1");
		String pass2=request.getParameter("password2");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
		Statement st=cn.createStatement();
		ResultSet rs=st.executeQuery("select count(*) from teacher_login where t_username='"+usr+"'");
		rs.next();
		int count=rs.getInt(1);
		if(!pass1.equals(pass2))
		{
			response.sendRedirect("tforgotpassword.jsp?chk=3");
		}
		if(count>0)
		{
			
			Statement st1=cn.createStatement();
			ResultSet r1=st1.executeQuery("select question,answer from teacher_login where t_username='"+usr+"'");
			r1.next();
			String qus=r1.getString(1);
			String ans1=r1.getString(2);
			if(qus.equals(ques) && ans1.equals(ans))
			{
				Statement st2=cn.createStatement();
				int y=st2.executeUpdate("update teacher_login set t_password='"+pass2+"' where t_username='"+usr+"'");
				if(y>0)
				{
					response.sendRedirect("teacherlogin.jsp");
				}
			}
			else
			{
				out.println("Security Answer/Question Mismatch !!");
			}
		}
	}
}
catch(Exception e){}
%>