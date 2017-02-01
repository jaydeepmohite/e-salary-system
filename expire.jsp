<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Session Expired</title>
</head>
<body>
<center>
<%
	String chk=request.getParameter("chk");
	if("1".equals(chk))
	{
%>
<h3>Sorry, Your Session has been expired.....</h3>
Go to<a href="schoollogin.jsp">School Login</a>
<%
    }
    if("2".equals(chk))
	{
%>
<h3>Sorry, Your Session has been expired.....</h3>
Go to<a href="teacherlogin.jsp">Teacher Login</a>
<%
	}
   if("3".equals(chk))
	{
%>
<h3>Sorry, Your Session has been expired.....</h3>
Go to<a href="adminlogin.jsp">Admin Login</a></center> 
   <%
    }
   %>
</body>
</html>