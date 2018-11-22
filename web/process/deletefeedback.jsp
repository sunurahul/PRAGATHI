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
<jsp:useBean id="lo" class="beanclass.sendfeedback"/>
<jsp:setProperty name="lo" property="*"/>
<%
    try
    {
    MyDb db = new MyDb();
    Connection con =db.getCon();
    
    PreparedStatement psmt=null,psmt1=null; 
    ResultSet rs=null,rs1=null;
    int res=0,res1=0,count=0;

    
    int fid=Integer.parseInt(request.getParameter("fid"));
    
    psmt=con.prepareStatement("delete from tbl_feedback where fid="+fid+"");
    res=psmt.executeUpdate();

        response.sendRedirect("../Admin/viewfeedback.jsp?msg=Deleted the Feedback");
         
    
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>

