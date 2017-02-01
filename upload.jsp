<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemFactory"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Database Upload</title>
</head>
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<script src="JavaScript/jquery.js"></script>
<script src="JavaScript/valid.js"></script>
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
<div class="primary" style="float:left; margin-left:400px;">
	<center><h3> Upload Salary Database</h3></center>
	<br>
<form action="upload.jsp?chk=1" method="post" enctype="multipart/form-data" name="form1">
<input type="file" name="file"><input type="submit" value="Submit" onclick="return CSVupload()">
<label id="err"></label>
</form>
<br><br><br><br><br><br><br><br><br><br><br>
</div>
<%
try
{
int sid=(Integer)session.getAttribute("sid");
session.setAttribute("sid",sid);
String chk=request.getParameter("chk");
if("1".equals(chk))
{
	boolean isMultipart = ServletFileUpload.isMultipartContent(request); 
	if (isMultipart) 
	{  
 		 FileItemFactory factory = new DiskFileItemFactory();    
  		ServletFileUpload upload = new ServletFileUpload(factory);  
   		 List  items = upload.parseRequest(request);  
  		 Iterator iterator = items.iterator();  
  		 while (iterator.hasNext()) 
   		{  
   		  FileItem item = (FileItem) iterator.next();  
  		   if (!item.isFormField())  
   		   { 
  		     String fileName = item.getName();    
  		     File uploadedFile = new File("D:/Salary/Payroll/WebContent/SalaryDB/"+sid+".csv");  
  		      if(fileName!="")  
			{
  		 	    item.write(uploadedFile);
			 }  
     		    else  
			{
        		  out.println("file not found");
			 } 
    			    out.println("<h1>File Uploaded Successfully....:-)</h1>");
      			 response.sendRedirect("upload.jsp?chk=2");
   		        }  
 	           else  
 		     {  
        		String abc = item.getString();  
		      }  
   	}   
}
}
if("2".equals(chk))
{
		BufferedReader br=new BufferedReader(new FileReader("D:/Salary/Payroll/WebContent/SalaryDB/"+sid+".csv"));
		String deliminator=",";
		String line="";
		int tid,base_sal;
		String header[]=br.readLine().split(deliminator);
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection  cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","PAYROLL","jaydeep");int k=0;
		Statement st=cn.createStatement();String sql="";
		while((line=br.readLine())!=null)
		{
			sql="insert into salary_details(";
			String data[]=line.split(deliminator);
			for(int j=0;j<header.length;j++)
			{
				if(j==header.length-1)
				{
					sql=sql+header[j];
				}
				else
					sql=sql+header[j]+",";
			}
			sql=sql+") values(";
			for(int i=0;i<data.length;i++)
			{
				if(i==0 || i==1 || i==2 || i==6 || i==7)
				{
					sql=sql+"'"+data[i]+"'";
					sql=sql+",";
				}
				if(i==data.length-1)
				{
					sql=sql+data[i]+")";
				}
				if(i==3 || i==4 || i==5 || i==8 || i==9 || i==10 || i==11)
				{
					sql=sql+data[i];
					sql=sql+",";
				}
			}
			out.println(sql);
			int n=st.executeUpdate(sql);
		}
		out.println("<h1>Database Uploaded Successfully</h1>");
		response.sendRedirect("schoolhome.jsp");
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
	</p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <p><a href="#top" class="back-to-top">Back to Top</a>
    </p>
<!-- /footer -->
</div>
</body>
</html>