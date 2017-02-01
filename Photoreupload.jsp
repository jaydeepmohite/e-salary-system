<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Photo Upload</title>
</head>
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<script src="JavaScript/jquery.js"></script>
<script src="JavaScript/teacher_valid.js"></script>
<script src="lib/scrollToTop.js"></script>
<body id="top">
<!-- content-wrap -->
<div id="content-wrap">
<form action="Photoreupload.jsp?chk=1" method="post" enctype="multipart/form-data" name="form1">
<label>Select A New Photo</label><br><label id="err"></label>
<input type="file" name="file1"><input type="submit" value="Submit" onclick="return photoupload()">
</form>
</div>
<%
try
{
int tid=(Integer)session.getAttribute("tid");
session.setAttribute("tid",tid);
String chk=request.getParameter("chk");
if("1".equals(chk))
{
	boolean isMultipart = ServletFileUpload.isMultipartContent(request); 
	if (isMultipart) 
	{  
  		FileItemFactory factory = new DiskFileItemFactory();  
  		ServletFileUpload upload = new ServletFileUpload(factory); 
   		List items = upload.parseRequest(request);  
  		Iterator iterator = items.iterator();  
 	        while (iterator.hasNext()) 
  		 {  
 		    FileItem item = (FileItem) iterator.next();  
 		    if (!item.isFormField())  
 		     { 
 			      String fileName = item.getName();    
			       System.out.println(fileName);
 			      File uploadedFile = new File("D:/Salary/Payroll/WebContent/TeacherPhotosDB/"+tid+".jpg");  
 		       if(fileName!="") 
			{ 
  			     item.write(uploadedFile);  
  			      response.sendRedirect("teacherhome.jsp");
			}
			else  
   		     	    out.println("File not found ! Try Again !");
  		      }  
  		 }   
	}
}
}
catch(Exception e){}
%>
</body>
</html>