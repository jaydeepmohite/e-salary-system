<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Your Salary Status</title>
</head>
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
<br>
</div>
</div>
</div>
<!-- content-wrap -->
<div id="content-wrap">
<center>
<%
	String month[]=new DateFormatSymbols().getMonths();
%>
<form action="salarystatus.jsp?chk=1" method="post">
<select name="year"><option>--Select the Year--</option><%
for(int i=2005;i<=2014;i++)
{
	%>
	<option value="<%=i%>"><%=i%></option>
	<%
}
%>
</select>
<select name="month">
<option>--Select the Month--</option>
<%
for(int i=0;i<12;i++)
{
%>
<option value="<%=month[i]%>"><%=month[i]%></option>
<%
}
%>
</select>
<input type="submit" value="Check Status"><% 
String chk=request.getParameter("chk");
int tid=(Integer)session.getAttribute("tid");
if(0==tid)
{
	response.sendRedirect("expire.jsp?chk=2");
}
session.setAttribute("tid",tid);
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	if("1".equals(chk))
	{
		String year=request.getParameter("year");
		String month1=request.getParameter("month");
		Statement st1=cn.createStatement();
		ResultSet rs=st1.executeQuery("select t_rid from teacher_details where t_id="+tid);
		rs.next();
        String t_rid=rs.getString(1);
		String tbl=month1+year;
		Statement st2=cn.createStatement();
		Statement st3=cn.createStatement();
		ResultSet rs3=st3.executeQuery("select count(*) from tab where tname=UPPER('"+tbl+"')");
		rs3.next();
		int a=rs3.getInt(1);
		if(a>0)
		{
			ResultSet rs1=st2.executeQuery("select status from "+tbl+" where t_rid='"+t_rid+"'");
			rs1.next();
			String st=rs1.getString(1);
			out.println("<br><h2><font color=red>"+st+"</font></h2><a href=teacherhome.jsp>Go To Home</a>");
		}
		else
		{
			out.println("<br><h2><font color=red>Invalid</font></h2><br><center><a href=teacherhome.jsp>Go To Home</a>");
		}	
	}
}catch(Exception e){}
%>
</form></center>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<!-- footer -->
<div class="footer">
	<p class="footer-left">
		© 2014 &nbsp; &nbsp; &nbsp;
		Design by <a href="#">JDK SOft Ltd. Pune</a> &nbsp; &nbsp; &nbsp; Best view in Firefox 18.0,Google Chrome 24.0
	</p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      <a href="#top" class="back-to-top">Back to Top</a>
<!-- /footer -->
</div>
</body>
</html>