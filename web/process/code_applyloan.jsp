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
<%@ page import="java.io.*,java.util.Locale" %>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
<%@ page import="java.text.DateFormat,java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<jsp:useBean id="lo" class="beanclass.applyloan"/>
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
    Date strDat=sdf.parse(strDate);
    Date ad;
    String usid=(String)session.getAttribute("usid");
    int userid=Integer.parseInt(usid);
    
    String unam=lo.getunam();
    String name=lo.getname();
    
    int loanamt=Integer.parseInt(lo.getloanamt());
    String purpose=lo.getpurpose();
    String aprvdate=null;
    //Date first=sdf.parse(date1);
    //Date second=sdf.parse(date2);
    //long difference=first.getTime()-second.getTime(); 
    //float d=(difference/(1000*60*60*24));
   // out.print(d);
    long diff;
    float d;
    psmt=con.prepareStatement("select * from tbl_loans where userid=?");
    psmt.setInt(1,userid);
    rs=psmt.executeQuery();
    if(rs.next())
    {
        if(rs.getString("status").equals("Pending") || rs.getString("status").equals("Applied"))
        {
            response.sendRedirect("../CAN/nhgloanapplication.jsp?msg=Pending loan found, so you can't apply for new one");
        }
        else
        {
            aprvdate=rs.getString("approvedate");
            ad=sdf.parse(aprvdate);
            diff=strDat.getTime()-ad.getTime();
            d=(diff/(1000*60*60*24));
            
            if(d<90)
            {
                response.sendRedirect("../CAN/nhgloanapplication.jsp?msg=Last loan is taken within 90 days so cant apply");
            }
            
        }
    }
    else
    {
        psmt=con.prepareStatement("insert into tbl_loans(userid,loanamt,purpose,verifyby,reqdate,approvedate,duepayment,status)"+"values(?,?,?,?,?,?,?,?)");
        psmt.setInt(1,userid);
        psmt.setInt(2,loanamt);
        psmt.setString(3,purpose);
        psmt.setString(4,"nil");
        psmt.setString(5,strDate);
        psmt.setString(6,"nil");
        psmt.setInt(7,0);
        psmt.setString(8,"Applied");
        res=psmt.executeUpdate();
        
        response.sendRedirect("../CAN/nhgloanapplication.jsp?msg=Successfully Applied");
            
    }
    
  
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
