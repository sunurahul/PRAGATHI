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
    int res=0,res1=0,count=0;

   int ucid=Integer.parseInt(request.getParameter("ucid"));
   
   
   psmt=con.prepareStatement("select * from tbl_unitchange where ucid=?");
   psmt.setInt(1,ucid);
   rs=psmt.executeQuery();
   if(rs.next())
   {
       psmt1=con.prepareStatement("update tbl_unitchange set status='Verified' where ucid="+ucid+"");
       res1=psmt1.executeUpdate();
       
       psmt1=con.prepareStatement("update tbl_member set unitid=? where userid=?");
       psmt1.setInt(1,rs.getInt("too"));
       psmt1.setInt(2,rs.getInt("userid"));
       
       response.sendRedirect("../CAN/unitchangeapplication.jsp?msg=Successfully Verified");
   }
        
  
     }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
