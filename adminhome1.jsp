<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*,javax.mail.*"%>
<%@page import="javax.mail.internet.*,javax.activation.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page language="java" contentType="text/html"%>
<html>
<head>
<title>Administration Area</title>
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
     </div>
</div>
</div>
<form action="adminhome1.jsp?chk=11" method="post"><input type=submit value="Logout" style="float:right;margin-right:250px;"></form>
<!-- content-wrap -->
<div id="content-wrap">
<center><h2>Welcome, Administrator</h2>
<%
try
{
	int aid=(Integer)session.getAttribute("aid");
	if(0==aid)
	{
		response.sendRedirect("expire.jsp?chk=3");
	}
	session.setAttribute("aid",aid);	
	String chk=request.getParameter("chk");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	Statement st=cn.createStatement();
	Calendar c=Calendar.getInstance();
	c.add(Calendar.MONTH,-1);
	int year=c.get(Calendar.YEAR);
	String v=new SimpleDateFormat("MMMM").format(c.getTime());
	String sql=v+year;
	String school=request.getParameter("school");
	if("1".equals(chk))
	{
		%><table><tr><td>
		<form action="adminhome1.jsp?chk=4&school=<%=school%>" method="post">
		<input type="submit" value="Create Salary Database"></form></td>
		<td><form action="adminsalarygenerate.jsp?school=<%=school%>" method="post">
		<input type="submit" value="Salary Generate"></form></td>
		<td><form action="adminhome1.jsp?chk=9&school=<%=school%>" method="post">
		<input type="submit" value="Salary Transfer Page"></form></td>	
		<td><form action="adminhome1.jsp?chk=8&school=<%=school%>" method="post">
		<input type="submit" value="View Report"></form></td></tr></table>
		<br><a href="adminhome.jsp">Go Back</a>
		<%
	}
	if("4".equals(chk))
	{
		
		Statement st3=cn.createStatement();	
		ResultSet rs3=st3.executeQuery("select count(*) from tab where tname=UPPER('"+sql+"')");
		rs3.next();
		int a=rs3.getInt(1);
		if(a>0)
		{
			out.println("Database Already Created!!!Process further...");
			%>
			<br><a href="adminhome1.jsp?chk=1&school=<%= school%>">Go Back</a>
			<%
		}
		else
		{
			Statement st4=cn.createStatement();
			boolean r=st4.execute("create table "+sql+"(t_rid varchar2(50),status varchar2(50))");
		        out.println("CREATED");
			Statement st5=cn.createStatement();
			Statement st6=cn.createStatement();
			ResultSet rs4=st5.executeQuery("select t_rid from teacher_details");
			String t_rid;
			while(rs4.next())
			{
				t_rid=rs4.getString(1);
				int n=st6.executeUpdate("insert into "+sql+" values('"+t_rid+"','Not Transferred')");
			}
			%>
			<br><a href="adminhome1.jsp?chk=1&school=<%= school%>">Go Back</a>
			<%
		}
		
	}
	if("5".equals(chk))
	{
		String t_rid[]=request.getParameterValues("teacher");
		for(int i=0;i<t_rid.length;i++)
		{
			Statement st3=cn.createStatement();	
			ResultSet r1=st3.executeQuery("select count(*) from "+sql+" where t_rid='"+t_rid[i]+"' and status='Transferred'");
			r1.next();
			int count=r1.getInt(1);
			ResultSet r2=st3.executeQuery("select total_sal from salary_details where t_rid='"+t_rid[i]+"'");r2.next();
			float a=r2.getFloat(1);
			ResultSet r3=st3.executeQuery("select t_name,t_bank,t_branch,t_account,t_email from teacher_details where t_rid='"+t_rid[i]+"'");r3.next();
			String name=r3.getString(1);
			String bank=r3.getString(2);
			String branch=r3.getString(3);
			int acc=r3.getInt(4);				
			if(count>0)
			{
				out.println("<br><br><font color=red>Salary Already Transferred to"+t_rid[i]+"!!!</font>");
			}
			else
			{
				Statement st5=cn.createStatement();	
				int n=st5.executeUpdate("update "+sql+" set status='Transferred' where t_rid='"+t_rid[i]+"'");
				out.println("<br><br><font color=blue>Salary Successfully Transferred to"+(t_rid[i])+"!!! And E-mail is Sent to 							Teacher</font><br>Transaction Details<br>");
				out.println("<table><tr><td>Teacher ID:</td><td>"+t_rid[i]+"</td></tr>");
				out.println("<tr><td>Teacher Name:</td><td>"+name+"</td></tr>");
				out.println("<tr><td>Bank Name:</td><td>"+bank+"</td></tr>");
				out.println("<tr><td>Bank Branch Name:</td><td>"+branch+"</td></tr>");
				out.println("<tr><td>Bank Account No:</td><td>"+acc+"</td></tr>");
				out.println("<tr><td>Total Salary Transfered</td><td>"+a+"</td></tr></table>");
				String email=r3.getString(5);
				final String username = "kalpeshchaudhari634@gmail.com";
				final String password = "kalpesh85";
				Properties props = new Properties();
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "587");
				Session sess = Session.getInstance(props, new javax.mail.Authenticator()
				{
					protected PasswordAuthentication getPasswordAuthentication()
					{
						return new PasswordAuthentication(username, password);
					}
 				});
				Message message;
				message = new MimeMessage(sess);
				message.setFrom(new InternetAddress("kalpeshchaudhari634@gmail.com"));
				message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email));
				message.setSubject("Salary Transfer Receipt");	
				message.setContent("<center><br>Transaction Details<br><table border=1><tr><td>Teacher ID:</td><td>"+t_rid				[i]+"</td></tr><tr><td>Teacher Name:</td><td>"+name+"</td></tr><tr><td>Bank Name:</td><td>"+bank+"</td></tr><tr><td>Bank Branch 				Name:</td><td>"+branch+"</td></tr><tr><td>Bank Account No:</td><td>"+acc+"</td></tr><tr><td>Total Salary Transfered</td><td>"+a				+"</td></tr></table></center>","text/html");
				Transport.send(message);
			}
		}%><br><a href="adminhome1.jsp?chk=1&school=<%= school%>">Go Back</a><%
			
	}
	if("6".equals(chk))
	{
		Statement st5=cn.createStatement();
		String t_rid[]=request.getParameterValues("teacher");
		%>
		<center><h3><%= school %></h3></center><table border=2 style="text-align:center;width:96%;" >
		<tr><td>Teacher ID</td><td>Teacher Name</td><td>Band Pay</td><td>Grade Pay</td><td>Sum Band Pay</td><td>Daily Allowance (DA)</td><td>Housing Rent 		Allowance (HRA)</td><td>Travel Allowance (TA)</td><td>Recovery</td><td>People's Profident Fund (PPF)</td><td>Professional Tax</td><td>Income 		Tax</td></tr>
		<%
		for(int i=0;i<t_rid.length;i++)
		{
			ResultSet rr=st5.executeQuery("select * from salary_details where t_rid='"+t_rid[i]+"' order by t_rid");
			while(rr.next())
			{
			%>
				<tr><td><%= rr.getString(2)%></td><td><%= rr.getString(3)%></td><td><%= rr.getString(4)%></td><td><%= rr.getString(5)%></td><td><%= 				rr.getString(6)%></td><td><%= rr.getString(7)%></td><td><%= rr.getString(8)%></td><td><%= rr.getString(9)%></td><td><%= rr.getString				(10)%></td><td><%= rr.getString(11)%></td><td><%= rr.getString(12)%></td><td><%= rr.getString(13)%></td></tr>
		       	<%
			}
		}
	}
	if("8".equals(chk))
	{	
		Statement st2=cn.createStatement();
		ResultSet rs1=st2.executeQuery("select s_id from school_details where s_name='"+school+"'");
		rs1.next();
		int sid=rs1.getInt(1);
		Statement st1=cn.createStatement();
		ResultSet rs=st.executeQuery("select t_id,t_rid,t_name from teacher_details where t_school='"+school+"' order by t_rid");
		out.println("<center><h1>Schoolwise Teacher's Information</h1>");
		out.println("<table border=2><tr><td colspan=3><center><a href=adminschoolhome.jsp?sid="+sid+" title=INFORMATION>"+school+"</center></td></tr><tr><td>   		Teacher's Registered ID</td><td>   Teacher's Name</td><td>Check</td></tr>");
		while(rs.next())
		{
			%>
			<form action="adminhome1.jsp?chk=6&school=<%=school%>" method="post">
			<tr><td><center><%=rs.getString(2)%></center></td><td><center><a href=adminteacherhome.jsp?tid=<%=rs.getInt(1)%> title=INFORMATION><%=rs.getString(3)%></a></center></td><td><input type=checkbox value=<%=rs.getString(2)%> name=teacher></td></tr>
			<%
		}	
		out.println("</table>");	
		%>
		<input type="submit" value="View Report"></form>
		<%      
		out.println("</center>");
	}
	if("9".equals(chk))
	{
		Statement st2=cn.createStatement();
		ResultSet rs1=st2.executeQuery("select s_id from school_details where s_name='"+school+"'");
		rs1.next();
		int sid=rs1.getInt(1);
		Statement st1=cn.createStatement();
		ResultSet rs=st.executeQuery("select t_id,t_rid,t_name from teacher_details where t_school='"+school+"' order by t_rid");
		out.println("<center><h1>Schoolwise Teacher's Information</h1>");
		out.println("<table border=2><tr><td colspan=3><center><a href=adminschoolhome.jsp?sid="+sid+" title=INFORMATION>"+school+"</center></td></tr><tr><td>   		Teacher's Registered ID</td><td>   Teacher's Name</td><td>Check</td></tr>");
		while(rs.next())
		{
			%>
			<form action="adminhome1.jsp?chk=5&school=<%=school%>" method="post">
			<tr><td><center><%=rs.getString(2)%></center></td><td><center><a href=adminteacherhome.jsp?tid=<%=rs.getInt(1)%> title=INFORMATION><%= rs.getString(3)%></a></center></td><td><input type=checkbox value=<%= rs.getString(2)%> name=teacher></td></tr>
			<%
		}	
		out.println("</table>");	
		%>
		<input type="submit" value="Transfer Salary"></form>
		<%
	}
	if("11".equals(chk))
	{
		session.setAttribute("aid",0);
		response.sendRedirect("adminlogin.jsp");
	}
}catch(Exception e){}
%>
</div>

</body>
</html>