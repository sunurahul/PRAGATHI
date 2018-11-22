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

    int id=Integer.parseInt(request.getParameter("id"));
    String utype=(String)request.getParameter("utype");
    
    
    psmt=con.prepareStatement("delete from tbl_messagedetails where id=?");
    psmt.setInt(1,id);
    res=psmt.executeUpdate();

    if(utype.equals("admin"))
        {
        response.sendRedirect("../Admin/adminmessages.jsp");
        }
    else
    {
        response.sendRedirect("../CAN/"+utype+"messages.jsp");
    }
         
    
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>

