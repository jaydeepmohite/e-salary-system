<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Feedback Form</title>
<script>
function validateEmail()
{
	var b=feedback();
var x=document.form1.email.value;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
  document.getElementById("email1").innerHTML="<font color='red'>*Not a Valid Email Address</font>";
		return false;
  }
else
{
document.getElementById("email1").innerHTML="";
		return true;
}
}
function feedback()
{
	if(document.form1.feed.value=="")
	{
		  document.getElementById("feed1").innerHTML="<font color='red'>*Give Some Feedback</font>";
		return false;
	}
	else
	{
		document.getElementById("feed1").innerHTML="";
		return true;
	}
}
</script>
</head>
<title>
	Pay Unit Secondary Pune
</title>
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<script src="lib/jquery.js"></script>
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
<li><a href="ContactUs.html" class="arrow">Contact Us</a> 
	<ul>  
		<li><a href="feedback.jsp?chk=3">Feedback</a></li>
		<li><a href="">FAQ's</a></li> 
	</ul>
</li>
</ul>
</div>
</div>
</div>  	
<%
try
{
	String chk=request.getParameter("chk");
	String feedback=request.getParameter("feed");
	String email=request.getParameter("email");
	if("1".equals(chk))
	{ 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
		Statement st=cn.createStatement();
		int n=st.executeUpdate("insert into feedback_details values(f_seq.nextval,'"+feedback+"','"+email+"')");
		response.sendRedirect("feedback.jsp?chk=2");
	}
	if("3".equals(chk))
	{
	%>
		<form  action="feedback.jsp?chk=1" method="post" name="form1" onsubmit="return validateEmail()">
		<fieldset><center><h1><font color="red" size=4>Feedback Form</font></h1>
		<table><tr><td>
		<font color=green>Enter Feedback:-</font></td><td width=80%><textarea rows="15" cols="50" name="feed"></textarea><label id="feed1"></label></td></tr><tr><td>
		<font color=green>Enter Your E-mail:-</font></td><td><input type="text" cols="40" name="email" onkeyup="return validateEmail()"><label id="email1"></label></td></tr></table><br>
		<input type="submit" value="Submit"><input type="reset"></center>
		</fieldset>
		</form>
	<%
	}
	if("2".equals(chk))
	{
		out.println("<center><font color=blue size=5>Thank You For Your Feedback !!!</font></center>");
	}
}catch(Exception e){}
%>
<!-- footer -->
<div class="footer">
	<p class="footer-left">
		© 2014 &nbsp; &nbsp; &nbsp;
		Design by <a href="#">JDK SOft Ltd. Pune</a> &nbsp; &nbsp; &nbsp; Best view in Firefox 18.0,Google Chrome 24.0
	</p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      <a href="#top" class="back-to-top">Back to Top</a>
<!-- /footer -->
</div>
</html>