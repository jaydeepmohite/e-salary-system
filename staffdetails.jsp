<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Staff Details Submission</title>
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
<br>
</div>
</div>
</div>
<!-- content-wrap -->
<div id="content-wrap">
<center>
<%
try
{
	int sid=(Integer)session.getAttribute("sid");
	String chk=request.getParameter("chk");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	Statement st2=cn.createStatement();
	ResultSet rs2=st2.executeQuery("select count(*) from teacher_details where s_id="+sid+"");
	rs2.next();
	int count=rs2.getInt(1);
	Statement st7=cn.createStatement();
	ResultSet rs7=st7.executeQuery("select s_tstaff from school_details where s_id="+sid+"");
	rs7.next();
	int c=rs7.getInt(1);
	if(count==c)
	{
		out.println("<Label>Information Already Submitted</label><br><a href=schoolhome.jsp>Go To Home</a>");
	}
	else
	{
	%>
		<form action="staffdetails.jsp?chk=1" method="post">
	<%
		for(int i=1;i<=c;i++)
		{
		%>
			<label>Enter Teacher <%= i %> Unique ID : </label><input type="text" name="<%= "teacher"+i %>">
			<label>Enter Teacher <%= i %> Name : </label><input type="text" name="<%= "name"+i %>">
			<label>Enter Teacher <%= i %> Joining Date : </label><input type="text" name="<%= "jdate"+i %>">
			<br>
		<%
		}
	%>
	<br><br>
	<input type="submit" value="Submit Information">
	</form>
	<%
	}
	if("1".equals(chk))
	{
		Statement st1=cn.createStatement();
		int x=0;
		for(int i=1;i<=c;i++)
		{
			String t=request.getParameter("teacher"+i);
			String t1=request.getParameter("name"+i);
			String t2=request.getParameter("jdate"+i);
			x=st1.executeUpdate("insert into teacher_details(t_id,t_name,t_rid,t_jdate,s_id) values(t_seq.nextval,'"+t1+"','"+t+"','"+t2+"',"+sid+")");
		}
		if(x>0)
		{
			response.sendRedirect("schoolhome.jsp");
		}
	}
}
 catch(Exception e){}
%></center>
<br><br><br><br><br><br><br><br><br>
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