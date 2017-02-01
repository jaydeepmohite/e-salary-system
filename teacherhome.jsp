<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Welcome To Payunit</title>
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<script src="lib/jquery.js"></script>
<script src="lib/scrollToTop.js"></script>
<script type="text/javascript">
function changeimage()
{
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {
	// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {
	// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	   }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
	    }
 	 }
xmlhttp.open("POST","Photoreupload.jsp",true);
xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlhttp.send();
}
</script>
</head>
<body id="top">
<!--header -->
<div id="header-wrap">
<div class="header">
    <div class="hgroup">
    <div class="heading1">Government Of Maharashtra</div>
    <h1>Payroll And E-Salary Systems</h1>
</div></div></div>
<!-- content-wrap -->
<div id="content-wrap">
<form action="teacherhome.jsp?chk=10" method="post"><input type=submit value="Logout" style="float:right;margin-right:250px;"></form>
<%
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
	Statement st=cn.createStatement();
	ResultSet rs=st.executeQuery("select * from teacher_details where t_id="+tid+"");
	rs.next();
	String t_rid=rs.getString(3);
	String t_name=rs.getString(2);
	String t_type=rs.getString(11);
	String t_add1=rs.getString(5);
	String t_city=rs.getString(6);
	String t_taluka=rs.getString(7);
	String t_district=rs.getString(8);
	String t_state=rs.getString(9);
	String t_pincode=rs.getString(10);
	String t_cert=rs.getString(12);
	String t_pyear=rs.getString(13);
	String t_jdate=rs.getString(14);
	String t_bank=rs.getString(15);
	String t_branch=rs.getString(16);
	String t_account=rs.getString(17);
	String t_email=rs.getString(19);
	Long t_contact=rs.getLong(20);
	if("1".equals(chk))
	{
	%>
	<center>
		<form action="teacherhome.jsp?chk=2" method="post">
		<table>
	    <tr><td><label>School Name :</label></td><td><input type="text" value="<%= t_name %>" size=50 name="t_name"></td></tr>
		<tr><td><label>School Type :</label></td><td><input type="text" value="<%= t_type %>" size=20 name="t_type"></td></tr>
		<tr><td><label>Teacher Contact :</label></td><td><input type="text" value="<%= t_contact %>" size=20 name="t_contact"></td></tr>
		<tr><td><label>Teacher Email :</label></td><td><input type="text" value="<%= t_email %>" size=20 name="t_email"></td></tr>
		<tr><td><label>Address Line 1 :</label></td><td><textarea rows="5" cols="20" name="t_add1"><%= t_add1 %></textarea></td></tr>
		<tr><td><label>City :</label></td><td><input type="text" value="<%= t_city %>" size=30 name="t_city">
		<tr><td><label>Taluka :</label></td><td><input type="text" value="<%= t_taluka %>" size=30 name="t_taluka"></td></tr>
		<tr><td><label>District :</label></td><td><input type="text" value="<%= t_district %>" size=30 name="t_district">
		<tr><td><label>State :</label></td><td><input type="text" value="<%= t_state %>" size=30 name="t_state"></td></tr>
		<tr><td><label>Pincode :</label></td><td><input type="text" value="<%= t_pincode %>" size=10 name="t_pincode"></td></tr>
		<tr><td><label>Qualification :</label></td><td><input type="text" value="<%= t_cert %>" size=10 name="t_cert"></td></tr>
		<tr><td><label>Passing Year :</label></td><td><input type="text" value="<%= t_pyear %>" size=10 name="t_pyear"></td></tr>
		<tr><td><label>School Joining Date :</label></td><td><input type="text" value="<%= t_jdate %>" size=10 name="t_jdate"></td></tr>
		<tr><td><label>Bank Name :</label></td><td><input type="text" value="<%= t_bank %>" size=10 name="t_bank"></td></tr>
		<tr><td><label>Bank Branch Name:</label></td><td><input type="text" value="<%= t_branch %>" size=10 name="t_branch"></td></tr>
		<tr><td><label>Bank Account No :</label></td><td><input type="text" value="<%= t_account %>" size=10 name="t_account"></td></tr>
		</table>
		<input type="submit" value="Save Changes">
		</form>
		</center>
<%
}
else if("2".equals(chk))
{
	String t_name1=request.getParameter("t_name");
	String t_type1=request.getParameter("t_type");
	String t_add11=request.getParameter("t_add1");
	String t_city1=request.getParameter("t_city");
	String t_taluka1=request.getParameter("t_taluka");
	String t_district1=request.getParameter("t_district");
	String t_state1=request.getParameter("t_state");
	int t_pincode1=Integer.parseInt(request.getParameter("t_pincode"));
	int t_pyear1=Integer.parseInt(request.getParameter("t_pyear"));
	String t_jdate1=request.getParameter("t_jdate");
	String t_cert1=request.getParameter("t_cert");
	String t_bank1=request.getParameter("t_bank");
	String t_branch1=request.getParameter("t_branch");
	int t_account1=Integer.parseInt(request.getParameter("t_account"));
	String t_email1=request.getParameter("t_email");
	long t_contact1=Long.parseLong(request.getParameter("t_contact"));
	Statement st1=cn.createStatement();
	int u=st1.executeUpdate("update teacher_details set t_name='"+t_name1+"',t_type='"+t_type1+"',t_add1='"+t_add11+"',t_city='"+t_city1+"',t_taluka='"+t_taluka1+"',t_district='"+t_district1+"',t_state='"+t_state1+"',t_pincode="+t_pincode1+",t_pyear="+t_pyear1+",t_jdate='"+t_jdate1+"',t_cert='"+t_cert1+"',t_bank='"+t_bank1+"',t_branch='"+t_branch+"',t_account="+t_account1+",t_email='"+t_email1+"',t_contact="+t_contact1+" where t_id="+tid+"");
	if(u>0)
	{
		response.sendRedirect("teacherhome.jsp");
	}
}
else if("10".equals(chk))
{
	session.setAttribute("tid",0);
	response.sendRedirect("teacherlogin.jsp");
}
else
{
%>
<center>
<h2>Welcome, <%= t_name%></h2>
<div>
<img id="image" src="TeacherPhotosDB/<%=tid%>.jpg" title="Click here to change photo" onclick="changeimage()" width="200px" height="150px">
<div id="myDiv"></div>
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
<label>School Joining Dtae :</label><%= t_jdate %><br></td><td>
<h3>Bank Details</h3>
<label>Bank Name :</label><%= t_bank %><br>
<label>Bank Branch Name:</label><%= t_branch %><br>
<label>Bank Account No :</label><%= t_account %><br></td></tr></table>
<table><tr><td><form action="teacherhome.jsp?chk=1" method="post">
<input type="submit" value="Edit Basic Teacher Information">
</form></td><td>
<form action="salarygenerate.jsp" method="post">
<input type="submit" value="View Current Salary">
</form></td><td>
<form action="salarystatus.jsp" method="post">
<input type="submit" value="View Transfer Salary">
</form></td></tr></table>
</div>
<br><br><br><br><br><br><br>
<%
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