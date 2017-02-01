<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Teacher Registration</title>
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/tabs.css" media="screen">
<script src="JavaScript/jquery.js"></script>
<script src="JavaScript/teacher_valid.js"></script>
<script src="lib/scrollToTop.js"></script>
<script>window.jQuery || document.write('<script src="lib/jquery-1.6.1.min.js"><\/script>')</script>
<script type="text/javascript" src="lib/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="lib/jquery-ui-1.7.custom.min.js"></script>
<script type="text/javascript">
$(function() {
			var $tabs = $('#tabs').tabs();
			$(".ui-tabs-panel").each(function(i){
			  var totalSize = $(".ui-tabs-panel").size() - 1;
			  if (i != totalSize) {
			      next = i + 2;
		   		  $(this).append("<a href='#' class='next-tab mover' rel='" + next + "'>Next Page &#187;</a>");
			  }
			  if (i != 0) {
			      prev = i;
		   		  $(this).append("<a href='#' class='prev-tab mover' rel='" + prev + "'>&#171; Prev Page</a>");
			  }
			});
			$('.next-tab, .prev-tab').click(function() { 
		           $tabs.tabs('select', $(this).attr("rel"));
		           return false;
		       });
});
</script>
</head>
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
     		<li><a href="Mission.html">Mission</a></li>
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
		<li><a href="FAQ.html">FAQ's</a></li> 
	</ul>
</li>
</ul>
</div>
</div>
</div> 	
<!-- content-wrap -->
<div id="content-wrap">

<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	String chk=request.getParameter("chk");
	if("4".equals(chk))
	{
	%>
		<center>
		<form action="newteacher.jsp?chk=2" method="post" name="my" onsubmit="return validateSchool()">
		<table border=0>
		<tr><td>
		<label>Teacher Registered ID : </label></td><td width=70%><input type="text" name="t_rid" placeholder="Registered ID" onkeyup="return validate()">
		<label id="mydiv"></label></td></tr>
	<%
		String chk1=request.getParameter("chk1");
		if("1".equals(chk1))
		{
			%>
			<label>Teacher Already Registered !</label>
			<%
		}
		if("2".equals(chk1))
		{
			%>
			<font color="red"><label>Teacher Registered ID Doesn't Exists ! Contact Your School Administrator !</label></font><br>
			<%
		}
		if("5".equals(chk1))
		{
			%>
			<font color="red"><label>Please Select Your School</label></font><br>
			<%
		}
		%>
		<tr><td><label>Select Your School&nbsp;&nbsp;&nbsp;&nbsp; : </label></td><td>&nbsp<select name="t_school" style="width:200px;"><option label="--Select Your School--" value="0">--Select Your School--</option>
		<%
		Statement st=cn.createStatement();
		ResultSet rs=st.executeQuery("select s_name from school_details");
		while(rs.next())
		{
			String name=rs.getString(1);
			%>
			<option value="<%=name%>" label="<%=name%>"><%=name%></option>
			<%
		}
		%></select></td></tr>
		<tr><td></td><td><input type="submit" value="Verify Me" ></td></tr>
		</table>
		</form>
		</center>
		<%
	}
	if("2".equals(chk))
	{
		String t_rid=request.getParameter("t_rid");
		String t_school=request.getParameter("t_school");
		Statement st3=cn.createStatement();
		ResultSet rs3=st3.executeQuery("select count(*) from teacher_details where t_rid='"+t_rid+"'");
		rs3.next();
		int count1=rs3.getInt(1);
		ResultSet rs4=st3.executeQuery("select t_jdate from teacher_details where t_rid='"+t_rid+"'");
		rs4.next();
		String jdate1=rs4.getString(1);
		if("0".equals(t_school))
		{
			response.sendRedirect("newteacher.jsp?chk=4&chk1=5");
		}
		if(count1>0)
		{
			Statement st2=cn.createStatement();
			ResultSet rs1=st2.executeQuery("select count(*) from teacher_details where t_account IS NULL and t_rid='"+t_rid+"'");	
			rs1.next();
			int count=rs1.getInt(1);
			if(count>0)
			{	
			response.sendRedirect("newteacher.jsp?chk=3&t_rid='"+t_rid+"'&t_school='"+t_school+"'&t_jdate="+jdate1+"");	
			}
			else
			{
				response.sendRedirect("newteacher.jsp?chk=4&chk1=1");
			}
		}
		else
		{
			response.sendRedirect("newteacher.jsp?chk=4&chk1=2");
		}	
	}
	if("3".equals(chk))
	{
		String t_rid=request.getParameter("t_rid");
		String t_school=request.getParameter("t_school");
		String j_date2=request.getParameter("t_jdate");
		%>
		<div id="page-wrap">
		<div id="tabs">		
    		<ul>
        		<li><a href="#fragment-1">Basic Details</a></li>
        		<li><a href="#fragment-2">Address Details</a></li>
        		<li><a href="#fragment-3">Qualification Details</a></li>
        		<li><a href="#fragment-4">Bank Details</a></li>
        		<li><a href="#fragment-5">Register Teacher</a></li>
      		</ul>
		<form name="myForm" action="newteacher.jsp?chk=1" method="post" >
 	    <div id="fragment-1" class="ui-tabs-panel">
		<table>
		<tr><td>
		<label>Teacher Registered ID : </td><td width=74%></label><input type="text" name="t_rid" value=<%= t_rid %>></td></tr>
		<tr><td><label>School Name : </td><td></label><input type="text" value=<%= t_school %> name="t_school" size=50></td></tr>
		<tr><td><label>Teacher Name : </td><td></label><input  placeholder="Teacher Name" type="text" name="t_name" >
		<label id="mydiv1"></label></td></tr>
		<tr><td><label>Teacher Contact No:</label></td><td><input type="text" name="contact"  placeholder="Contact No" 
		onkeyup="return validate_contact()"><label id="contact1"></label></td></tr>
		</table>
      		</div>  	
      		<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
		<table><tr><td>
		<label>1st Line Address : </td><td width=79%></label>&nbsp<textarea required="" placeholder="Line 1 Address" rows="5" cols="23" style="vertical-align: 			middle" name="t_add1"  onkeyup="return validate2()"></textarea><label id="mydiv2"></label></td></tr>
		<tr><td><label>City / Town : </td><td></label><input type="text" name="city" required="" placeholder="City" onkeyup="return validate3()"><label 			id="mydiv3"></label></td><tr>
		<tr><td><label>Tahsil : </td><td></label>&nbsp<select name="taluka" style="width:200px;"><option value="0">-------Select Tahsil-------</option>
		<option label="Ambegaon" value="Ambegaon">Ambegaon</option><option value="Baramati" label="Baramati">Baramati</option>
		<option value="Bhor" label="Bhor">Bhor</option><option label="Daund" value="Daund">Daund</option><option label="Haveli" 						value="Haveli">Haveli</option><option value="Indapur" label="Indapur">Indapur</option>
		<option label="Junnar" value="Junnar">Junnar</option><option label="Khed" value="Khed">Khed</option><option label="Maval" value="Maval">Maval</option>
		<option label="Pimpri-Chinchwad City" value="Pimpri-Chinchwad City">Pimpri-Chinchwad City</option><option label="Pune City" value="Pune City">Pune 			City</option>
		<option label="Purandar" value="Purandar">Purandar</option><option label="Shirur" value="Shirur">Shirur</option>
		<option label="Velhe" value="Velhe">Velhe</option></select><label id="mydiv8"></label></td></tr>
		<tr><td><label>District : </td><td></label><input type="text" readonly="readonly" value="Pune" name="district"></td></tr>
		<tr><td><label>State : </td><td></label><input type="text" value="Maharashtra" readonly="readonly" name="state"></td></tr>
		<tr><td><label>Pincode : </td><td></label><input type="text" name="pincode" required="" placeholder="Pincode" onkeyup="return validate4()"><label 			id="mydiv4"></label>
		</td></tr></table>
	    </div>      
        <div id="fragment-3" class="ui-tabs-panel ui-tabs-hide">
		<table><tr><td>
		<label>Teacher Type : </td><td width=80%></label>&nbsp<input type="radio" name="teachertype" value="Primary">&nbsp<label>Primary</label>&nbsp&nbsp&nbsp&nbsp<input 				type="radio" name="teachertype" value="Secondary">&nbsp<label>Secondary</label>&nbsp&nbsp&nbsp&nbsp<label id="mydiv11"></label></td></tr>
		<tr><td><label>Qualified in : </td><td></label>&nbsp<select name="certificate" value="0" style="width:200px;"><option value="0">----Select Degree----			</option><option value="B.A">B.A.</option>
		<option value="B.A.B.Ed" label="B.A.B.Ed.">B.A.B.Ed.</option><option value="D.Ed." label="D.Ed.">D.ED</option>
		<option value="M.A." label="M.A.">M.A.</option><option label="M.A.B.Ed." value="M.A.B.Ed.">M.A.B.Ed.</option>
		<option label="A.T.D." value="A.T.D.">A.T.D.</option><option label="B.P.Ed" value="B.P.Ed.">B.P.Ed.</option></select><label 						id="mydiv12"></label></td></tr>
		<tr><td><label>Passing Year : </td><td></label><input type="text" name="pyear" required="" placeholder="Passing Year" onkeyup="return validate5()">			(YYYY)<label id="mydiv5"></label></td></tr>
		<tr><td><label>School Joining Date : </td><td></label><input type="text" name="jdate" readonly="readonly" value="<%= j_date2 %>">(DD/MM/YYYY)
		</td></tr>
		</table>
      		</div>  
      		<div id="fragment-4" class="ui-tabs-panel ui-tabs-hide">
		<table><tr><td>
		<label>Select Bank : </label></td><td width=75%>&nbsp<select name="bank" style="width:200px;"><option value="0">----Select the Bank----</option><option value="State Bank Of India" 			label="State Bank of India">State Bank of India</option>
		<option value="ICICI Bank" label="ICICI Bank">ICICI Bank</option></select><label id="mydiv13"></label></td></tr>
		<tr><td><label>Enter Branch Name : </td><td></label><input type="text" name="branch" required="" placeholder="Branch Name" onkeyup="return validate6			()"><label id="mydiv6"></label></td></tr>
		<tr><td><label>Enter Account Number : </td><td></label><input type="text" name="account1" required="" placeholder="Account" onkeyup="return validate7			()"><label id="mydiv71"></td></tr>
		<tr><td><label>Re-Enter Account Number : </td><td></label><input type="text" name="account2" required="" placeholder="Re-Enter Account Number" 				onkeyup="return validate7()"><label id="mydiv7"></label></td></tr>
		<tr><td><label>Enter E-mail ID</label></td><td><input type="text" name="email" placeholder="E-mail" onkeyup="return validateEmail()">
		<label id="email1"></label></td></tr>
		</table><center>
      		</div>
      		<div id="fragment-5" class="ui-tabs-panel ui-tabs-hide">
		<table><tr><td>
		<input type="checkbox" value="yes" name="terms"> I have read all the terms and conditions and agreed thereby. I want to register my school.<br><label 			id="mydiv14"></label>
		</td></tr></table>
		<input type="submit" value="Register Teacher" onclick="return validate8()"><input type="reset">
      		</div>  	  	
		</form>
		</div>
		</div>	
		</div>
		<%
	}
	if("1".equals(chk))
	{
		String t_name=request.getParameter("t_name");
		String t_id=request.getParameter("t_rid");
		String t_school=request.getParameter("t_school");
		String t_add1=request.getParameter("t_add1");
		String t_city=request.getParameter("city");
		String t_taluka=request.getParameter("taluka");
		String t_district=request.getParameter("district");
		String t_state=request.getParameter("state");
		int t_pincode=Integer.parseInt(request.getParameter("pincode"));
		String t_type=request.getParameter("teachertype");
		String t_cert=request.getParameter("certificate");
		int t_pyear=Integer.parseInt(request.getParameter("pyear"));
		String t_jdate=request.getParameter("jdate");
		String t_bank=request.getParameter("bank");
		String t_branch=request.getParameter("branch");
		int t_ac1=Integer.parseInt(request.getParameter("account1"));
		int t_account1=Integer.parseInt(request.getParameter("account2"));
		String email=request.getParameter("email");
		Statement st1=cn.createStatement();
		int x=st1.executeUpdate("update teacher_details set t_name='"+t_name+"',t_school='"+t_school+"',t_add1='"+t_add1+"',t_city='"+t_city		+"',t_taluka='"+t_taluka+"',t_district='"+t_district+"',t_state='"+t_state+"',t_pincode="+t_pincode+",t_type='"+t_type+"',t_cert='"+t_cert		+"',t_pyear="+t_pyear+",t_jdate='"+t_jdate+"',t_bank='"+t_bank+"',t_branch='"+t_branch+"',t_account="+t_ac1+",t_email='"+email+"' where t_rid='"+t_id+"'");
		Statement st2=cn.createStatement();
		ResultSet rs1=st2.executeQuery("select t_id from teacher_details where t_name='"+t_name+"'");
		rs1.next();
		int t_id1=rs1.getInt(1);
		if(x>0)
		{
			out.println("Adad");
			session.setAttribute("tid",t_id1);
			response.sendRedirect("Photoupload.jsp");
		}
	}
}
 catch(Exception e){}
%>
<br><br><br><br><br><br><br><br><br><br>
<!-- footer -->
<div class="footer">
	<p class="footer-left">
		© 2014 &nbsp; &nbsp; &nbsp;
		Design by <a href="#">JDK SOft Ltd. Pune</a> &nbsp; &nbsp; &nbsp; Best view in Firefox 18.0,Google Chrome 24.0
	</p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <p><a href="#top" class="back-to-top">Back to Top</a>
    </p>
<!-- /footer -->
</div>
</body>
</html>