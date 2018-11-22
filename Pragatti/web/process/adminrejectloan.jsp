<%-- 
    Document   : regprocess
    Created on : Sep 30, 2018, 1:03:40 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
    </head>
    <body>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="MyPack.MyDb"%>
<jsp:useBean id="lo" class="beanclass.regform2"/>
<jsp:setProperty name="lo" property="*"/>
<%
    try
    {
    MyDb db = new MyDb();
    Connection con =db.getCon();
    
    PreparedStatement psmt=null,psmt1=null; 
    ResultSet rs=null,rs1=null;
    int res=0,res1=0;
   
    int loanid=Integer.parseInt(request.getParameter("loanid"));
   
   psmt=con.prepareStatement("update tbl_loans set status='Admin Rejected' where loanid=?");
   psmt.setInt(1,loanid);
   res=psmt.executeUpdate();
  
   response.sendRedirect("../Admin/adminloans.jsp?msg=Rejected Successfully");     
  
  
     }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
