<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Delete Existing Teacher</title>
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
<label> Existing Teachers : </label><br>
<label>---------------------</label><br>
<table>
<tr><td>Teacher Registered ID</td><td>Teacher Name</td><td>Joining Date</td></tr>
<%
try
{
	int sid=(Integer)session.getAttribute("sid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	Statement st=cn.createStatement();
	ResultSet rs=st.executeQuery("select t_rid from teacher_details where s_id="+sid+" order by t_rid");
	while(rs.next())
	{
		String trid=rs.getString(1);
		Statement st1=cn.createStatement();
		ResultSet rs1=st1.executeQuery("select t_name,t_jdate from teacher_details where t_rid='"+trid+"' order by t_rid");
		rs1.next();
		String tname=rs1.getString(1);
		String jdate=rs1.getString(2);
		%>
		<tr><td><%= trid %></td><td><%= tname%></td><td><%= jdate%></td></tr>
		<%
	}
	%>
	</table>
	<form action="deleteteacher.jsp?chk=1" method="post">
	<label>Enter Teacher Unique ID : </label><input type="text" name="nteacher"><br>
	<input type="submit" value="Delete Teacher">
	</form>
<%
	String chk=request.getParameter("chk");
	if("1".equals(chk))
	{
		String t_rid=request.getParameter("nteacher");
		Statement st2=cn.createStatement();
		ResultSet r4=st2.executeQuery("select count(*) from teacher_details where t_rid='"+t_rid+"'");
		r4.next();
		int count=r4.getInt(1);
		if(count>0)
		{
			ResultSet r3=st2.executeQuery("select t_id from teacher_details where t_rid='"+t_rid+"'");
			r3.next();
			int tid=r3.getInt(1);
			int x1=st2.executeUpdate("delete from teacher_login where t_id="+tid+"");
			int x=st2.executeUpdate("delete from teacher_details where t_rid='"+t_rid+"'");
			int x2=st2.executeUpdate("delete from salary_details where t_rid='"+t_rid+"'");
			Statement st3=cn.createStatement();
			int y=st3.executeUpdate("update school_details set s_tstaff=s_tstaff-1 where s_id="+sid+"");
			response.sendRedirect("deleteteacher.jsp?chk=2");
		}
		else
		{
			out.println("<label>Teacher Doesn't Exists !<br><a href=schoolhome.jsp>Goto School Home</a>");
		}
	}
	if("2".equals(chk))
	{
		out.println("<label>Teacher Deleted</label><br><a href=schoolhome.jsp>Goto School Home</a>");

	}
}catch(Exception e){}
%>
</div>
<br><br><br><br><br>
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