<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Welcome To Payunit</title>
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
</div></div></div>
<!-- content-wrap -->
<div id="content-wrap">
<% 
int tid=Integer.parseInt(request.getParameter("tid"));
session.setAttribute("tid",tid);
int aid=(Integer)session.getAttribute("aid");
session.setAttribute("aid",aid);	
%>
<img id="photo" src="TeacherPhotosDB/<%= tid %>.jpg" align="center" width=200 height=200></img>
<%
try
{
	String chk=request.getParameter("chk");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	Statement st=cn.createStatement();
	ResultSet rs=st.executeQuery("select * from teacher_details where t_id="+tid+"");
	rs.next();
	String t_rid=rs.getString(3);
	String t_name=rs.getString(2);
	String t_school=rs.getString(4);
	String t_add1=rs.getString(5);
	String t_city=rs.getString(6);
	String t_taluka=rs.getString(7);
	String t_district=rs.getString(8);
	String t_state=rs.getString(9);
	int t_pincode=rs.getInt(10);
	String t_type=rs.getString(11);
	String t_cert=rs.getString(12);
	int t_pyear=rs.getInt(13);
	String t_jdate=rs.getString(14);
	String t_bank=rs.getString(15);
	String t_branch=rs.getString(16);
	int t_account=rs.getInt(17);
	String t_email=rs.getString(18);
	String t_contact=rs.getString(19);
%>
<center>
<h2>Welcome, <%= t_name%></h2>
<div>
<img id="image" src="TeacherPhotosDB/<%=tid%>.jpg" width="200px" height="150px">
<table><tr><td><h3>Basic Details</h3>
<label>Registered Teacher ID :</label><%= t_rid %><br>
<label>Teacher Name :</label><%= t_name %><br>
<label>Teacher Type :</label><%= t_type %><br>
<label>Teacher Contact :</label><%= t_contact %><br>
<label>Teacher Email :</label><%= t_email %><br></td><td>
<h3>Address Details</h3><br>
<label>Address Line 1 :</label><%= t_add1 %><br>
<label>City :</label><%= t_city %>
<label>Taluka :</label><%= t_taluka %><br>
<label>District :</label><%= t_district %>
<label>State :</label><%= t_state %><br>
<label>Pincode :</label><%= t_pincode %><br></td><td>
<h3>Qualification Details</h3>
<label>Qualification :</label><%= t_cert %><br>
<label>Passing Year :</label><%= t_pyear %><br>
<label>School Joining Date :</label><%= t_jdate %><br></td><td>
<h3>Bank Details</h3>
<label>Bank Name :</label><%= t_bank %><br>
<label>Bank Branch Name:</label><%= t_branch %><br>
<label>Bank Account No :</label><%= t_account %><br></td></tr></table>
<a href="adminhome1.jsp?chk=1&school=<%= t_school%>">Go Back</a>
</div>
</center>
<%
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