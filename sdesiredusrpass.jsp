<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<script src="JavaScript/jquery.js"></script>
<script src="JavaScript/reset_valid.js"></script>
<script src="lib/scrollToTop.js"></script>
<script>window.jQuery || document.write('<script src="lib/jquery-1.6.1.min.js"><\/script>')</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>School Desired Username And Password</title>
</head>
<body id="top">
<!--header -->
<div id="header-wrap">
<div class="header">
    <div class="hgroup">
    <div class="heading1">Government Of Maharashtra</div>
    <h1>Payroll And E-Salary Systems</h1>
<br>
<br>
</div>
</div>
</div>
<!-- content-wrap -->
<div id="content-wrap">
<div class="primary" style="float:left; margin-left:400px;">
<center>
<h3>Login Details</h3>
</center>
<form action="sdesiredusrpass.jsp?chk=1" method="post" name="myForm">
<table>
<tr><td>
<label>Enter Desired Username : </label></td><td><input type="text" name="username" onkeyup="return validate()"><br><label id="mydiv"></label></td></tr>
<tr><td><label>Enter Desired Password : </label></td><td><input type="password" name="password1" onkeyup="return validate3()"><br><label id="mydiv3"></label></td></tr>
<tr><td><label>Re-Enter Desired Password : </label></td><td><input type="password" name="password2" onkeyup="return validate4()"><br><label id="mydiv4"></label></td></tr>
<tr><td><label>Select Security Question :</label></td><td>&nbsp;<select name="question" style="width:222px;"><option>---Select Security Question---</option><option value="What is your Pet Name?">What is your Pet Name?</option><option value="What is your Favourite Movie ?">What is your Favourite Movie ?</option><option value="What is your Mother's name ?">What is your Mother's name ?</option></select><br><label id="mydiv1"></label></td></tr>
<tr><td><label>Submit The Answer : </label></td><td><input type="text" name="answer" onkeyup="return validate2()"><br><label id="mydiv2"></label></td></tr>
</table>
<center><input type="submit" value="Submit" onclick="return validate1()"></center>
</form>
<br><br>
</div>
</div>
<%
try
{
	String chk=request.getParameter("chk");
	if("2".equals(chk))
	{
		out.println("<label>Username Exits! Enter Another Username !</label><br>");
	}
	if("1".equals(chk))
	{
		int sid=(Integer)session.getAttribute("sid");
		String usr=request.getParameter("username");
		String ques=request.getParameter("question");
		String ans=request.getParameter("answer");
		String pass1=request.getParameter("password1");
		String pass2=request.getParameter("password2");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
		Statement st=cn.createStatement();
		ResultSet rs=st.executeQuery("select count(*) from school_login where s_username='"+usr+"'");
		rs.next();
		int count=rs.getInt(1);
		if(count>0)
		{
			response.sendRedirect("sdesiredusrpass.jsp?chk=2");
		}
		else
		{
			Statement st1=cn.createStatement();
			int x=st1.executeUpdate("insert into school_login values("+sid+",'"+usr+"','"+pass1+"','"+ques+"','"+ans+"')");
			out.println(x);
			if(x>0)
			{
				response.sendRedirect("schoollogin.jsp");
			}
		}
	}
}
catch(Exception e){}
%>
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