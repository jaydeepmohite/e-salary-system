<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Salary Status</title>
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
</div></div>
<!-- content-wrap -->
<div id="content-wrap">
<%
try{
	String chk=request.getParameter("chk");
	int tid=(Integer)session.getAttribute("tid");
	if(0==tid)
	{
		response.sendRedirect("expire.jsp?chk=2");
	}

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	Statement st1=cn.createStatement();
	ResultSet rs1=st1.executeQuery("select t_rid from teacher_details where t_id="+tid);rs1.next();String trid=rs1.getString(1);
	Statement s1=cn.createStatement();
	ResultSet r1=s1.executeQuery("select count(*) from salary_details where t_rid='"+trid+"'");
	r1.next();
	int a=r1.getInt(1);
	if(a==0)
	{
		out.println("<center><h3><font color=red>Salary Database Not Uploaded.. Contact School...</font></h3>");
		out.println("<a href=teacherhome.jsp>Go To Home Page</a>");
	}
	else{
		
	Statement st=cn.createStatement();
	ResultSet rs=st.executeQuery("select * from salary_details where t_rid='"+trid+"'");
	float band=0,grade=0,sum=0,ta=0,recovery=0,ppf=0,pro_tax=0,income_tax=0,gross=0;
	String da="",hra="",d="",h="";
	while(rs.next())
	{
		band=rs.getFloat(4);
		grade=rs.getFloat(5);
		sum=rs.getFloat(6);
     		 da=rs.getString(7);
		hra=rs.getString(8);
		ta=rs.getFloat(9);
		recovery=rs.getFloat(10);
		ppf=rs.getFloat(11);
		pro_tax=rs.getFloat(12);
 		income_tax=rs.getFloat(13);
	}
	for(int i=0;i<da.length();i++)
	{
		if(da.charAt(i)=='%')
		{
			break;
		}
		else
		{
			d=d+da.charAt(i);
		}	
	}
	for(int i=0;i<hra.length();i++)
	{
		if(hra.charAt(i)=='%')
		{
			break;
		}
		else
		{
			h=h+hra.charAt(i);
		}
	}
	int da1=Integer.parseInt(d);
	int hra1=Integer.parseInt(h);
	gross=sum+(sum*75)/100+(sum*10)/100+ta;
	if("2".equals(chk))
	{
		float end=(gross-recovery)-ppf-pro_tax-income_tax;
		out.println("<center><h3>Your net salary for this month:- <strong>"+end+"</strong></h3><br><a href=teacherhome.jsp>Go To Home</a></center><br>");
	}
	else
	{
	%>
	<center>
	<form action="salarygenerate.jsp?chk=2" method="post">
	<table>
	<tr><td><label>Band Pay:-</label></td><td><input type="text" name="band" value="<%=band%>" readonly="readonly"></td></tr>
	<tr><td><label>Grade Pay:-</label></td><td><input type="text" name="grade" value="<%=grade%>" readonly="readonly"></td></tr>	
	<tr><td><label>Daily Allowance(DA):-</label></td><td><input type="text" name="da" value="<%=da%>" readonly="readonly"></td></tr>
	<tr><td><label>House Rent Allownace(HRA):-</label></td><td><input type="text" name="hra" value="<%=hra%>" readonly="readonly"></td></tr>
	<tr><td><label>Travelling Allowance(TA):-</label></td><td><input type="text" name="ta" value="<%=ta%>" readonly="readonly"></td></tr>
	<tr><td><label>Recovery:-</label></td><td><input type="text" name="recovery" value="<%=recovery%>" readonly="readonly"></td></tr>
	<tr><td><label>Provident Fund(PF):-</label></td><td><input type="text" name="ppf" value="<%=ppf%>" readonly="readonly"></td></tr>
	<tr><td><label>Professional Tax(PT):-</label></td><td><input type="text" name="pt" value="<%=pro_tax%>" readonly="readonly"></td></tr>
	<tr><td><label>Income Tax(IT):-</label></td><td><input type="text" name="it" value="<%=income_tax%>" readonly="readonly"></td></tr>
	</table>
	<input type="submit" value="Calculate Salary">
	</form>
	</center><br>
	<%
	}
	}
}catch(Exception e){}
%>
</div>
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