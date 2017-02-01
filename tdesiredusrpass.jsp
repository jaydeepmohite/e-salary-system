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
<title>Teacher Desired User And Password</title>
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
<br>
</div>
</div>
</div>
<!-- content-wrap -->
<div id="content-wrap">
<center>
<label>Login Details</label>
<form name="myForm" action="tdesiredusrpass.jsp?chk=1" method="post">
<table><tr><td>
<label>Enter Desired Username : </label></td><td><input type="text" name="username" onkeyup="return validate()"><br><label id="mydiv"></label></td></tr>
<%
try
{
String chk=request.getParameter("chk");
if("2".equals(chk))
{
	%>
	<%= "<font color='red'><label>Username Exits! Enter Another Username !</font>" %>
	<%
}
%>
<tr><td><label>Enter Desired Password : </label></td><td><input type="password" name="password1" onkeyup="return validate3()"><br><label id="mydiv3"></label></td></tr>
<tr><td><label>Re-Enter Password : </label></td><td><input type="password" name="password2" onkeyup="return validate4()"><br><label id="mydiv4"></label></td></tr>
<tr><td><label>Select Security Question :</label></td><td><select name="question"><option>---Select Security Question---</option><option value="What is your Pet Name?">What is your Pet Name?</option><option value="What is your Favourite Movie ?">What is your Favourite Movie ?</option><option value="What is your Mother's name ?">What is your Mother's name ?</option></select><label id="mydiv1"></label></td></tr>
<tr><td><label>Submit The Answer : </label></td><td><input type="text" name="answer" onkeyup="return validate2()"><br><label id="mydiv2"></label></td></tr>
</table>
<input type="submit" value="Submit" onclick="return validate1()">
</form>
</center>
<br><br>
</div>
<!-- footer -->
<div class="footer">
	<p class="footer-left">
		© 2014 &nbsp; &nbsp; &nbsp;
		Design by <a href="#">JDK SOft Ltd. Pune</a> &nbsp; &nbsp; &nbsp; Best view in Firefox 18.0,Google Chrome 24.0
	</p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      <a href="#top" class="back-to-top">Back to Top</a>
<!-- /footer -->
</div>
</body>
</html>
<%
if("1".equals(chk))
{
	int t_id=(Integer)session.getAttribute("tid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	Statement st=cn.createStatement();
	String usr=request.getParameter("username");
	String pass1=request.getParameter("password1");
	String ques=request.getParameter("question");
	String ans=request.getParameter("answer");
	ResultSet rs=st.executeQuery("select count(*) from teacher_login where t_username='"+usr+"'");
	rs.next();
	int count=rs.getInt(1);
	if(count>0)
	{
		response.sendRedirect("tdesiredusrpass.jsp?chk=2");
	}
	else
	{
	Statement st1=cn.createStatement();
	int x=st1.executeUpdate("insert into teacher_login values("+t_id+",'"+usr+"','"+pass1+"','"+ques+"','"+ans+"')");
	if(x>0)
	{
		response.sendRedirect("teacherlogin.jsp");
	}
	}
}
}
catch(Exception e){}
%>