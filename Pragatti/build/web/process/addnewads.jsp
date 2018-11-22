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
<jsp:useBean id="lo" class="beanclass.newadsbeen"/>
<jsp:setProperty name="lo" property="*"/>
<%
    try
    {
    MyDb db = new MyDb();
    Connection con =db.getCon();
    
    PreparedStatement psmt=null,psmt1=null; 
    ResultSet rs=null,rs1=null;
    int res=0,res1=0;

   
   int wardno=Integer.parseInt(request.getParameter("wardno"));
   int userid=Integer.parseInt(request.getParameter("userid"));
   
   
   psmt=con.prepareStatement("update tbl_ads set ads_id=? where wardno=?");
   psmt.setInt(1,userid);
   psmt.setInt(2,wardno);
   
   res=psmt.executeUpdate();
   
   psmt=con.prepareStatement("update tbl_login set usertype='ads' where userid=?");
   psmt.setInt(1,userid);

   res=psmt.executeUpdate();        
   
   
    response.sendRedirect("../Admin/addnewads.jsp?msg=Successfully Added");
  

    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
