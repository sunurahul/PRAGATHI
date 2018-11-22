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

   
   int wardno=Integer.parseInt(lo.getwardno());
   int userid=Integer.parseInt(lo.getuserid());
   int old=0;
   psmt=con.prepareStatement("select * from tbl_ads where wardno=?");
   psmt.setInt(1,wardno);
   rs=psmt.executeQuery();
   if(rs.next())
   {
       old=rs.getInt("ads_id");
   }
   
   psmt=con.prepareStatement("update tbl_ads set ads_id=? where wardno=?");
   psmt.setInt(1,userid);
   psmt.setInt(2,wardno);
   
   res=psmt.executeUpdate();
   
   psmt=con.prepareStatement("update tbl_login set usertype='ads' where userid=?");
   psmt.setInt(1,userid);

   res=psmt.executeUpdate();        
   
   psmt=con.prepareStatement("update tbl_login set usertype='unitadmin' where userid=?");
   psmt.setInt(1,old);

   res=psmt.executeUpdate();
   
   
    response.sendRedirect("../Admin/updateads.jsp?msg=Successfully Updated");
  

    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
