<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<%
try
{
	int sid=(Integer)session.getAttribute("sid");
	if(0==sid)
	{
		response.sendRedirect("expire.jsp?chk=1");
	}
	session.setAttribute("sid",sid);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	Statement st=cn.createStatement();
	ResultSet rs=st.executeQuery("select * from school_details where s_id="+sid+"");
	rs.next();
	String s_rid=rs.getString(3);
	String s_name=rs.getString(2);
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
	<html>
	<head>
	<title>Welcome, <%=s_name%></title>
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
	</div></div></div>
	<!-- content-wrap -->
	<div id="content-wrap">
	<form action="schoolhome.jsp?chk=10" method="post"><input type=submit value="Logout" style="float:right;margin-right:250px;"></form>	
	<%
	if("10".equals(chk))
	{
		session.setAttribute("sid",0);
		response.sendRedirect("schoollogin.jsp");	
	}
	if("1".equals(chk))
	{
	%>
		<center><form action="schoolhome.jsp?chk=2" method="post">
		<table>
		<tr><td><label>Registered School ID :</label></td><td><input type="text" value="<%= s_rid %>" name="s_rid" size=50></td></tr>
		<tr><td><label>School Name :</label></td><td><input type="text" value="<%= s_name %>" size=50 name="s_name"></td></tr>
		<tr><td><label>School Type :</label></td><td><input type="text" value="<%= s_type %>" size=20 name="s_type"></td></tr>
		<tr><td><label>School Contact NO :</label></td><td><input type="text" value="<%= contact %>" size=20 name="contact"></td></tr>
		<tr><td><label>School Email :</label></td><td><input type="text" value="<%= email %>" size=20 name="email"></td></tr>
		<tr><td><label>School Address</label></td><td></td></tr>
		<tr><td><label>Address Line 1 :</label></td><td><textarea rows="5" cols="20" name="s_add1" style="vertical-align: middle"><%= s_add1 %></textarea></td></tr>
		<tr><td><label>City :</label></td><td><input type="text" value="<%= s_city %>" size=30 name="s_city">
		<tr><td><label>Taluka :</label></td><td><input type="text" value="<%= s_taluka %>" size=30 name="s_taluka"></td></tr>
		<tr><td><label>District :</label></td><td><input type="text" value="<%= s_district %>" size=30 name="s_district">
		<tr><td><label>State :</label></td><td><input type="text" value="<%= s_state %>" size=30 name="s_state"></td></tr>
		<tr><td><label>Pincode :</label></td><td><input type="text" value="<%= s_pincode %>" size=10 name="s_pincode"></td></tr>
		<tr><td><label>School Area :</label></td><td><input type="text" value="<%= s_sarea %>" size=10 name="s_sarea"></td></tr>
		<tr><td><label>Number Of Classrooms :</label></td><td><input type="text" value="<%= s_classrooms %>" size=10 name="s_classrooms"></td></tr>
		<tr><td><label>School Playground Area :</label></td><td><input type="text" value="<%= s_parea %>" size=10 name="s_parea"></td></tr>
		<tr><td><label>Sanitary Provisions :</label></td><td><input type="text" value="<%= s_sanitary %>" size=10 name="s_sanitary"></td></tr>
		<tr><td><label>Drinking Water Provisions :</label></td><td><input type="text" value="<%= s_drinking %>" size=10 name="s_drinking"></td></tr>
		</table>
		<input type="submit" value="Save Changes">
		</form></center>
	<%
	}
	else if("2".equals(chk))
	{
		String s_name1=request.getParameter("s_name");
		String s_rid1=request.getParameter("s_rid");
		String s_type1=request.getParameter("s_type");
		String s_add11=request.getParameter("s_add1");
		String s_city1=request.getParameter("s_city");
		String s_taluka1=request.getParameter("s_taluka");
		String s_district1=request.getParameter("s_district");
		String s_state1=request.getParameter("s_state");
		int s_pincode1=Integer.parseInt(request.getParameter("s_pincode"));
		Double s_sarea1=Double.parseDouble(request.getParameter("s_sarea"));
		int s_classrooms1=Integer.parseInt(request.getParameter("s_classrooms"));
		Double s_parea1=Double.parseDouble(request.getParameter("s_parea"));
		String s_sanitary1=request.getParameter("s_sanitary");
		String s_drinking1=request.getParameter("s_drinking");
		long contact1=Long.parseLong(request.getParameter("contact"));
		String email1=request.getParameter("email");
		Statement st1=cn.createStatement();
		int u=st1.executeUpdate("update school_details set s_name='"+s_name1+"',s_type='"+s_type1+"',s_rid='"+s_rid1+"',s_add1='"+s_add11+"',s_city='"+s_city1+"',s_taluka='"+s_taluka1+"',s_district='"+s_district1+"',s_state='"+s_state1+"',s_pincode="+s_pincode1+",s_sarea="+s_sarea1+",s_classrooms="+s_classrooms1+",s_parea="+s_parea1+",s_sanitary='"+s_sanitary1+"',s_drinking='"+s_drinking1+"', t_contact="+contact1+",t_email='"+email1+"' where s_id="+sid+"");
		if(u>0)
		{
			response.sendRedirect("schoolhome.jsp");
		}
}
else
{
%>
	<center><h2>Welcome, <%= s_name%></h2></center>
	<div align="center"><table><tr><td>
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
	<table><tr><td>
	<form action="schoolhome.jsp?chk=1" method="post"><input type="submit" value="Edit Basic School Information"></form>
	</td><td><form action="staffdetails.jsp"><input type="submit" value="Submit Staff Details"></form>
	</td><td><form action="addteacher.jsp"><input type="submit" value="Add Teacher"></form>
	</td><td><form action="deleteteacher.jsp"><input type="submit" value="Delete Teacher"></form>
	</td><td><form action="upload.jsp"><input type="submit" value="Upload Salary Database"></form></td></tr></table>
	</div>
<%
}
}catch(Exception e){}
%>
</div>
<br><br><br>
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