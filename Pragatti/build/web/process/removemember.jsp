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

    int userid=Integer.parseInt(request.getParameter("userid"));
    int unitid=Integer.parseInt(request.getParameter("unitid"));
    String usertype=null;
    
    
    psmt=con.prepareStatement("select * from tbl_login where userid=?");
    psmt.setInt(1,userid);
    rs=psmt.executeQuery();
    if(rs.next())
    {   usertype=rs.getString("usertype");
    }
    
    if(usertype.equals("unitadmin")||usertype.equals("ads")||usertype.equals("cds"))
    {
        response.sendRedirect("../CAN/adsviewunitmembers.jsp?unitid="+unitid+"&&msg=The member is "+usertype+" so cant remove");
    }

    
    psmt=con.prepareStatement("select * from tbl_loans where userid=? and status='Repayment Pending'");
    psmt.setInt(1,userid);
    rs=psmt.executeQuery();
    if(rs.next())
    {   
        response.sendRedirect("../CAN/adsviewunitmembers.jsp?unitid="+unitid+"&&msg=The member has balance duepayement of loans so cant be removed");
    }

    else
    {
        psmt=con.prepareStatement("delete from tbl_login where userid=?");
        psmt.setInt(1,userid);
        res=psmt.executeUpdate();
        
        psmt=con.prepareStatement("delete from tbl_member where userid=?");
        psmt.setInt(1,userid);
        res=psmt.executeUpdate();
        
        response.sendRedirect("../CAN/adsviewunitmembers.jsp?unitid="+unitid+"&&msg=Removed Successfully");
    }
    
    
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>

