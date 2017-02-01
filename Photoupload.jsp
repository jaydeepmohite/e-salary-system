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
<link rel="stylesheet" type="text/css" href="css/coolblue.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen">
<script src="JavaScript/jquery.js"></script>
<script src="JavaScript/teacher_valid.js"></script>
<script src="lib/scrollToTop.js"></script>
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
</div>
</div>
</div>
<!-- content-wrap -->
<div id="content-wrap">
<center>
<h2>Teacher Profile Photo Upload</h2>
<form action="Photoupload.jsp?chk=1" method="post" enctype="multipart/form-data" name="form1">
<br><br><input type="file" name="file1"><input type="submit" value="Upload" onclick=" return photoupload()"><br><label id="err"></label>
</form>
</center>
</div>
<%
int tid=(Integer)session.getAttribute("tid");
session.setAttribute("tid",tid);
String chk=request.getParameter("chk");
if("1".equals(chk))
{
boolean isMultipart = ServletFileUpload.isMultipartContent(request); 
if (isMultipart) 
{  
  // Create a factory for disk-based file items  
  FileItemFactory factory = new DiskFileItemFactory();  
  // Create a new file upload handler  
  ServletFileUpload upload = new ServletFileUpload(factory);  
 try 
 {  
    // Parse the request  
   List /* FileItem */ items = upload.parseRequest(request);  
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
       response.sendRedirect("tdesiredusrpass.jsp");
	}
	else  
          out.println("File not found ! Try Again !");
     }  
   }   
   } catch (Exception e) {}
}
}
%>
</body>
</html>