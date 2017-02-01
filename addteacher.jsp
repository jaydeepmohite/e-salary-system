<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Add New Teacher</title>
<link rel="stylesheet" type="text/css" href="css/styles.css" >
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
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
<label>--------------------</label><br>
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
	<form action="addteacher.jsp?chk=1" method="post"><table>
	<tr><td><label>Enter New Teacher Unique ID : </label></td><td><input  type="text" name="nteacher"></td></tr>
	<tr><td><label>Enter New Teacher Name : </label></td><td><input  type="text" name="name"></td></tr>
	<tr><td><label>Enter New Teacher Joining Date : </label></td><td><input type="text" name="jdate">DD/MM/YYYY</td></tr>
	</table>
	<input type="submit" value="Add Teacher">
	<br><a href=schoolhome.jsp>Goto School Home</a>
	</form>
	<%
	String chk=request.getParameter("chk");
	if("1".equals(chk))
	{
		String t_rid=request.getParameter("nteacher");
		String t_name=request.getParameter("name");
		String t_jdate=request.getParameter("jdate");
		Statement st2=cn.createStatement();
		ResultSet rs2=st2.executeQuery("select count(*) from teacher_details where t_rid='"+t_rid+"'");
		rs2.next();
		int c=rs2.getInt(1);
		if(c>0)
		{
			out.println("<label>Teacher Already Exists</label><br><a href=schoolhome.jsp>Goto School Home</a>");
		}
		else
		{
			Statement st1=cn.createStatement();
			int x=st1.executeUpdate("insert into teacher_details(t_id,t_name,t_rid,t_jdate,s_id) values(t_seq.nextval,'"+t_name+"','"+t_rid+"','"+t_jdate				+"',"+sid+")");
			Statement st3=cn.createStatement();
			int y=st3.executeUpdate("update school_details set s_tstaff=s_tstaff+1 where s_id="+sid+"");
			if(x>0 && y>0)
			{
				response.sendRedirect("addteacher.jsp?chk=2");
			}
		}
	}
	if("2".equals(chk))
	{
		out.println("<label> Teacher Added</label>");
	}
}
catch(Exception e){}
%>
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