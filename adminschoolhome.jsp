<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Administration Access</title>
</head>
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<script src="JavaScript/jquery.js"></script>
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
<%
try
{
	int aid=(Integer)session.getAttribute("aid");
	session.setAttribute("aid",aid);	
	int sid=Integer.parseInt(request.getParameter("sid"));
	session.setAttribute("sid",sid);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	Statement st=cn.createStatement();
	ResultSet rs=st.executeQuery("select * from school_details where s_id="+sid+"");
	rs.next();
	String s_name=rs.getString(2);
	String s_rid=rs.getString(3);
	String s_type=rs.getString(4);
	String s_add1=rs.getString(5);
	String s_city=rs.getString(6);
	String s_taluka=rs.getString(7);
	String s_district=rs.getString(8);
	String s_state=rs.getString(9);
	int s_pincode=rs.getInt(10);
	Double s_sarea=rs.getDouble(11);
	String s_classrooms=rs.getString(12);
	Double s_parea=rs.getDouble(13);
	String s_sanitary=rs.getString(14);
	String s_drinking=rs.getString(15);
	int s_tstaff=rs.getInt(16);
	long contact=rs.getLong(17);
	String email=rs.getString(18);
	String chk=request.getParameter("chk");
%>
    <center><h2>Welcome To, <%= s_name%></h2></center>
	<br>
	<div align="center">
	<table><tr><td>
	<h3>Basic Details</h3>
	<label>Registered School ID :</label><%= s_rid %><br>
	<label>School Name :</label><%= s_name %><br>
	<label>School Type :</label><%= s_type %><br>
	<label>School Contact NO :</label><%= contact %><br>
	<label>School Email :</label><%= email %><br></td><td>
	<h3>Address Details</h3>
	<label>Address Line 1 :</label><%= s_add1 %><br>
	<label>City :</label><%= s_city %>
	<label>Taluka :</label><%= s_taluka %><br>
	<label>District :</label><%= s_district %>
	<label>State :</label><%= s_state %><br>
	<label>Pincode :</label><%= s_pincode %><br></td><td>
	<h3>Infrastructure Details</h3><label>School Area :</label><%= s_sarea %><br>
	<label>Number Of Classrooms :</label><%= s_classrooms %><br>
	<label>School Playground Area :</label><%= s_parea %><br>
	<label>Sanitary Provisions :</label><%= s_sanitary %><br>
	<label>Drinking Water Provisions :</label><%= s_drinking %><br></td><td>
	<h3>Staff Details</h3><label>School Teaching Staff :</label><%= s_tstaff %><br></td></tr></table>
	<br><a href="adminhome1.jsp?chk=1&school=<%= s_name%>">Go Back</a>
<%
}catch(Exception e){}
%>
</div>
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