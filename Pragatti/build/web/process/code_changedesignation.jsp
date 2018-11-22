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

   
   int unitid=Integer.parseInt(request.getParameter("unitid"));
   int userid=Integer.parseInt(request.getParameter("userid"));
   int old=0;
   psmt=con.prepareStatement("select * from tbl_unit where unitid=?");
   psmt.setInt(1,unitid);
   rs=psmt.executeQuery();
   if(rs.next())
   {
       old=rs.getInt("admin_id");
   }
   
   psmt=con.prepareStatement("update tbl_unit set admin_id=? where unitid=?");
   psmt.setInt(1,userid);
   psmt.setInt(2,unitid);
   
   res=psmt.executeUpdate();
   
   psmt=con.prepareStatement("update tbl_login set usertype='Member' where userid=?");
   psmt.setInt(1,old);

   res=psmt.executeUpdate();        
   
   psmt=con.prepareStatement("update tbl_login set usertype='unitadmin' where userid=?");
   psmt.setInt(1,userid);

   res=psmt.executeUpdate();
   
   
    response.sendRedirect("../login.jsp?msg=Successfully Change Desigantion");
  

    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
