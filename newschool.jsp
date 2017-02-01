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
<title>New School Registration</title>
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/tabs.css" media="screen">
<script src="JavaScript/jquery.js"></script>
<script src="JavaScript/valid.js"></script>
<script src="lib/scrollToTop.js"></script>
<script>window.jQuery || document.write('<script src="lib/jquery-1.6.1.min.js"><\/script>')</script>
<script type="text/javascript" src="lib/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="lib/jquery-ui-1.7.custom.min.js"></script>
<script type="text/javascript">
$(function() 
{
			var $tabs = $('#tabs').tabs();
			$(".ui-tabs-panel").each(function(i){
			  var totalSize = $(".ui-tabs-panel").size() - 1;
			  if (i != totalSize) {
			      next = i + 2;
		   		  $(this).append("<a href='#'  class='next-tab mover' rel='" + next + "'>Next Page &#187;</a>");
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
<div id="page-wrap">
<div id="tabs">		
<ul>
        		<li><a href="#fragment-1">Basic Details</a></li>
        		<li><a href="#fragment-2">Address Details</a></li>
        		<li><a href="#fragment-3">Infrastructure Details</a></li>
        		<li><a href="#fragment-4">Staff Details</a></li>
        		<li><a href="#fragment-5">Register School</a></li>
</ul>
<form name="myForm" action="newschool.jsp?chk=1" method="post">
<div id="fragment-1" class="ui-tabs-panel">
<table>
<tr><td>School Name : </td><td width=80%><input type="text" name="schoolname" onkeyup="return validate()"><label id="mydiv"></label></td></tr>
<tr><td>Registered School ID : </td><td><input type="text" name="schoolid" onkeyup="return validate1()"><label id="mydiv1"></label></td></tr>
<tr><td>School Type : </td><td>&nbsp;<input type="radio" name="schooltype" value="Primary"><label> Primary</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="schooltype" value="Secondary"><label> Secondary </label><label id="mydiv11"></label></td></tr>
<tr><td>E-mail:</td><td><input type="text" name="email" onkeyup="return validateEmail()"><label id="email1"></label></td></tr>
<tr><td>Contact No:</td><td><input type="text" name="contact" onkeyup="return validate_contact()"><label id="contact1"></label></td></tr>
</table>
</div>  	
<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
<table>
<tr><td width=21%>1st Line Address: </td><td width=79%>&nbsp;<textarea rows="5" cols="23" style="vertical-align: middle" name="s_add1" onkeyup="return validate2()"></textarea><label id="mydiv2"></label></td></tr>
<tr><td>City / Town : </td><td><input type="text" name="city" onkeyup="return validate3()"><label id="mydiv3"></label></td></tr>
<tr><td>Tahsil : </td><td>&nbsp;<select name="taluka" style="width:200px;" onchange="return validate8(this.value)"><option label="---- Select Tahsil ----" value="0">---- Select Tahsil ----</option>
<option label="Ambegaon" value="Ambegaon">Ambegaon</option><option value="Baramati" label="Baramati">Baramati</option>
<option value="Bhor" label="Bhor">Bhor</option><option label="Daund" value="Daund">Daund</option><option label="Haveli" value="Haveli">Haveli</option><option value="Indapur" label="Indapur">Indapur</option>
<option label="Junnar" value="Junnar">Junnar</option><option label="Khed" value="Khed">Khed</option><option label="Maval" value="Maval">Maval</option>
<option label="Pimpri-Chinchwad City" value="Pimpri-Chinchwad City">Pimpri-Chinchwad City</option><option label="Pune City" value="Pune City">Pune City</option>
<option label="Purandar" value="Purandar">Purandar</option><option label="Shirur" value="Shirur">Shirur</option>
<option label="Velhe" value="Velhe">Velhe</option></select><label id="mydiv8"></label></td></tr>
<tr><td>District : </td><td><input type="text" readonly="readonly" value="Pune" name="district"></td></tr>
<tr><td>State : </td><td><input type="text" value="Maharashtra" readonly="readonly" name="state"></td></tr>
<tr><td>Pincode : </td><td><input type="text" name="pincode" onkeyup="return validate4()"><label id="mydiv4"></label></td></tr>
</table>
</div>      
<div id="fragment-3" class="ui-tabs-panel ui-tabs-hide">
<table>
<tr><td>School Area : </td><td width=68%><input type="text" name="sarea" onkeyup="return validate5()">sq.mtrs<label id="mydiv5"></label></td></tr>
<tr><td>Number Of Classrooms : </td><td><input  type="text" name="classrooms" onkeyup="return validate6()"><label id="mydiv6"></label></td></tr>
<tr><td>Area Of<br> School Playground : </td><td><input type="text" name="parea" onkeyup="return validate7()">sq.mtrs<label id="mydiv7"></label></td></tr>
<tr><td>Sanitary Provisions : </td><td><input type="radio" name="sanitary" value="Yes"> Yes <input type="radio" name="sanitary" value="No"> No <label id="mydiv12"></label></td></tr>
<tr><td>Drinking Water Provisions : </td><td><input type="radio" name="water" value="Yes"> Yes <input type="radio" name="water" value="No"> No <label id="mydiv13"></label></td></tr>
</table>
</div>  
<div id="fragment-4" class="ui-tabs-panel ui-tabs-hide">
<table><tr><td>
<label>Number Of Teaching Staff : </label></td><td width="63%"><input type="text" name="tstaff" onkeyup="return validate9()"><label id="mydiv9"></label>
</td></tr></table>
</div>
<div id="fragment-5" class="ui-tabs-panel ui-tabs-hide">
<table><tr><td>
<input type="checkbox" value="yes" name="terms"> I have read all the <a href="Terms.html" target="_blank">terms and conditions</a> and agreed thereby. I want to register my school.<label id="mydiv10"></label>
</td></tr></table>
<input type="submit" value="Register School" onclick="return validate11()">
 </div>  	  	
</form>
</div>
</div>	
</div>
</body>
</html>
<%
try
{
String chk=request.getParameter("chk");
if("1".equals(chk))
{
		String s_name=request.getParameter("schoolname");
		String s_id=request.getParameter("schoolid");
		String s_type=request.getParameter("schooltype");
		String s_add1=request.getParameter("s_add1");
		String s_city=request.getParameter("city");
		String s_taluka=request.getParameter("taluka");
		String s_district=request.getParameter("district");
		String s_state=request.getParameter("state");
		int s_pincode=Integer.parseInt(request.getParameter("pincode"));
		Double s_area=Double.parseDouble(request.getParameter("sarea"));
		int s_classrooms=Integer.parseInt(request.getParameter("classrooms"));
		Double s_parea=Double.parseDouble(request.getParameter("parea"));
		String s_sanitary=request.getParameter("sanitary");
		String s_drinking=request.getParameter("water");
		int s_tstaff=Integer.parseInt(request.getParameter("tstaff"));
		String email=request.getParameter("email");
		long contact=Long.parseLong(request.getParameter("contact")); 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
		Statement st=cn.createStatement();
		Statement st2=cn.createStatement();
		ResultSet rs2=st2.executeQuery("select count(*) from school_details where s_rid='"+s_id+"' or s_name='"+s_name+"'");
		rs2.next();
		int count=rs2.getInt(1);
		if(count>0)
		{
			out.println("<label> School Already Registered ! </label><br><a href=schoollogin.jsp>Goto School Login Page</a>");
		}
		else
		{
			int c=st.executeUpdate("insert into school_details values(s_seq.nextval,'"+s_name+"','"+s_id+"','"+s_type+"','"+s_add1+"','"+s_city+"','"+s_taluka+"','"+s_district+"','"+s_state+"',"+s_pincode+","+s_area+","+s_classrooms+","+s_parea+",'"+s_sanitary+"','"+s_drinking+"',"+s_tstaff+","+contact+",'"+email+"')");
			Statement st1=cn.createStatement();
			ResultSet rs=st1.executeQuery("select s_id from school_details where s_rid='"+s_id+"'");
			rs.next();
			int sid=rs.getInt(1);
			if(c>0)
			{
				session.setAttribute("sid",sid);
				response.sendRedirect("sdesiredusrpass.jsp");
			}
		}
    }
}
catch(Exception e){}
%>