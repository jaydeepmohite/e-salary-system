<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<html>
<body>
<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");
	String taluka=request.getParameter("taluka");
	String chk=request.getParameter("chk");
	if("1".equals(chk))
	{
	
		Statement st2=cn.createStatement();
		ResultSet rs=st2.executeQuery("select s_name from school_details where s_taluka='"+taluka+"'");
		%>
		Select the School:<select name="school"><option value="0">--Select the School--</option>
		<%
		while(rs.next())
		{
		%>
		<option value="<%=rs.getString("s_name")%>"><%=rs.getString("s_name")%></option>
		<% 
		}
		%>
		</select>
		<% 
	}
}
catch(Exception e){}	
%>
</body>
</html>