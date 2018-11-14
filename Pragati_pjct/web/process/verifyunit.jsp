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

   int unitid=Integer.parseInt(request.getParameter("unitid"));
   int wardno=Integer.parseInt(request.getParameter("wardno"));
   int userid=Integer.parseInt(request.getParameter("userid"));
   
   psmt=con.prepareStatement("select count(*) from tbl_unit where wardno=? and status='Verified'");
   psmt.setInt(1,wardno);
   rs=psmt.executeQuery();
   if(rs.next())
   {
       count=rs.getInt(1);
   }
   if(count<2)
   {
   psmt=con.prepareStatement("update tbl_unit set status='Verified',admin_id=? where unitid=?");
   psmt.setInt(1,unitid);
   psmt.setInt(2,userid);
   res=psmt.executeUpdate();
   
   psmt=con.prepareStatement("update tbl_member set status='Verified' where userid=?");
   psmt.setInt(1,userid);
   res=psmt.executeUpdate();
   
   response.sendRedirect("../Admin/newunitapplications.jsp?msg=Verified Successfully");   
   }
   else
   {
       response.sendRedirect("../Admin/newunitapplications.jsp?msg=Maximum Unit Number Added Already");
   }
        
  
     }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
