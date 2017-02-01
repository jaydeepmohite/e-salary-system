<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Administration Access</title>
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<script src="lib/jquery.js"></script>
<script src="lib/scrollToTop.js"></script>
<script type="text/javascript">
function change(taluka)
{
	var xmlhttp;
	if(window.XMLHttpRequest)
	 {// code for IE7+, Firefox, Chrome, Opera, Safari
	    xmlhttp=new XMLHttpRequest();
	 }
	else
	 {// code for IE6, IE5
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	 }
	xmlhttp.onreadystatechange=function()
  	{
 	 if (xmlhttp.readyState==4 && xmlhttp.status==200)
         {
 	    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
         }
        }
	var url="adminaccess.jsp?chk=1&taluka="+taluka;
	xmlhttp.open("GET",url,true);
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
<br>
<br>
</div></div></div>
<!-- content-wrap -->
<div id="content-wrap">
<%
	int aid=(Integer)session.getAttribute("aid");
	session.setAttribute("aid",aid);
%>
<center>
<form action="adminhome1.jsp?chk=1" method="post" name="myForm">
<fieldset>Select Tahsil:<select name="taluka" onchange="change(this.value)">
<option label="--Select the Tahsil--" value="0">--Select Your Tahsil--</option>
<option label="Ambegaon" value="Ambegaon">Ambegaon</option><option value="Baramati" label="Baramati">Baramati</option>
<option value="Bhor" label="Bhor">Bhor</option><option label="Daund" value="Daund">Daund</option><option label="Haveli" value="Haveli">Haveli</option><option value="Indapur" label="Indapur">Indapur</option>
<option label="Junnar" value="Junnar">Junnar</option><option label="Khed" value="Khed">Khed</option><option label="Maval" value="Maval">Maval</option>
<option label="Pimpri-Chinchwad City" value="Pimpri-Chinchwad City">Pimpri-Chinchwad City</option><option label="Pune City" value="Pune City">Pune City</option>
<option label="Purandar" value="Purandar">Purandar</option><option label="Shirur" value="Shirur">Shirur</option>
<option label="Velhe" value="Velhe">Velhe</option></select><label id="mydiv1"></label>
<div id="myDiv"></div>
<br><input type="submit" value="Submit" onclick="return valid()">
</fieldset>
</form>
</center>
</div>
</body>
</html>