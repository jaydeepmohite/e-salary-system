<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
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
</div>
</div>
<!-- content-wrap -->
<div id="content-wrap">
<center>
<table>
<tr><td>Teacher Name</td><td>Teacher Salary</td></tr>
<%
try
{
	int aid=(Integer)session.getAttribute("aid");
	session.setAttribute("aid",aid);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	String school=request.getParameter("school");
	Statement stt=cn.createStatement();
	ResultSet rsss=stt.executeQuery("select s_rid from school_details where s_name='"+school+"'");
	rsss.next();
	String s_rid=rsss.getString(1);
	ResultSet rss=stt.executeQuery("select t_rid from salary_details where s_rid='"+s_rid+"'");
	while(rss.next())
	{
		String trid=rss.getString(1);
		Statement st1=cn.createStatement();
		ResultSet rs=st1.executeQuery("select * from salary_details where t_rid='"+trid+"'");
		float band=0,grade=0,sum=0,ta=0,recovery=0,ppf=0,pro_tax=0,income_tax=0,gross=0;
		String da="",hra="",d="",h="",t_name="";
		while(rs.next())
		{
			t_name=rs.getString(3);
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
		float end=(gross-recovery)-ppf-pro_tax-income_tax;
		int n=st1.executeUpdate("update salary_details set total_sal="+end+" where t_rid='"+trid+"'");
		out.println("<tr><td>"+t_name+"</td><td>"+end+"</td></tr>");
	}
	%>
	<a href="adminhome1.jsp?chk=1&school=<%= school%>">Go Back</a>
    <%
}catch(Exception e){}
%>
</table>
</center>
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