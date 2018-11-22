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
<jsp:useBean id="lo" class="beanclass.unitchange"/>

<jsp:setProperty name="lo" property="*"/>
<%
    try
    {
    MyDb db = new MyDb();
    Connection con =db.getCon();
    
    PreparedStatement psmt=null,psmt1=null,psmt2=null; 
    ResultSet rs=null,rs1=null,rs2=null;
    int res=0,res1=0,res2=0;
    Locale locale = request.getLocale( );
    String date = DateFormat.getDateTimeInstance(
                              DateFormat.FULL, 
                              DateFormat.SHORT, 
                              locale).format(new Date( ));

    Calendar cal = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String strDate = sdf.format(cal.getTime());
    
    
    
    int userid=Integer.parseInt(lo.getuserid());
    int unitid=Integer.parseInt(lo.getunitid());
    
    String[] msgsto=new String[20];
    int old=0,wardno=0,count=0;
    
    //out.print(usertype+msgto+strDate+userid);
    psmt=con.prepareStatement("select * from tbl_member where userid="+userid+"");
    rs=psmt.executeQuery();
    if(rs.next())
    {
        old=rs.getInt("unitid");
        wardno=rs.getInt("wardno");
    }
    out.print(userid);
    out.print(unitid);
    out.print(old);
    
    psmt=con.prepareStatement("select count(*) from tbl_member where unitid=? and status='Verified'");
   psmt.setInt(1,unitid);
   rs=psmt.executeQuery();
   if(rs.next())
   {
       count=rs.getInt(1);
   }
    if(count>19)
    {
        response.sendRedirect("../CAN/applyunitchange.jsp?untid="+old+"&&wardno="+wardno+"msg=Maximum number of member so cant apply");
    }
    psmt=con.prepareStatement("delete from tbl_unitchange where userid="+userid+" and status='Applied'");
    res=psmt.executeUpdate();    
    
    psmt=con.prepareStatement("insert into tbl_unitchange(userid,fromm,too,status)"+"values(?,?,?,?)");
    psmt.setInt(1,userid);
    psmt.setInt(2,old);
    psmt.setInt(3,unitid);
    psmt.setString(4,"Applied");
        out.print(old);

    res=psmt.executeUpdate();
        out.print(old);

    
    
    
    response.sendRedirect("../CAN/nhgprofile.jsp?msg=Successfully APplied");
  

    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
