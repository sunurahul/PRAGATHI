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
<%@ page import="java.io.*,java.util.Locale" %>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
<%@ page import="java.text.DateFormat,java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
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
    Locale locale = request.getLocale( );
    String date = DateFormat.getDateTimeInstance(
                              DateFormat.FULL, 
                              DateFormat.SHORT, 
                              locale).format(new Date( ));

    Calendar cal = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String strDate = sdf.format(cal.getTime());
    int loanamt=0;
    int loanid=Integer.parseInt(request.getParameter("loanid"));
    psmt=con.prepareStatement("select * from tbl_loans where loanid=?");
    psmt.setInt(1,loanid);
    rs=psmt.executeQuery();
    if(rs.next())
    {
        loanamt=rs.getInt("loanamt");
    }
    
    out.print(loanamt);
    
    psmt=con.prepareStatement("update tbl_loans set status='Repayment Pending',approvedate=?,duepayment=? where loanid=?");
    psmt.setString(1,strDate);
    psmt.setInt(2,loanamt);
    psmt.setInt(3,loanid);
    res=psmt.executeUpdate();

    response.sendRedirect("../Admin/adminloans.jsp?msg=Approved Successfully");     
  
  
     }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
