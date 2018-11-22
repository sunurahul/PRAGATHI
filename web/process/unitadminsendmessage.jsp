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
<jsp:useBean id="lo" class="beanclass.sendmessage"/>
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
    
    
    
    String usertype=lo.getusertype();
    String msgto=lo.getmsgto();
    String message=lo.getmessage();
    int userid=Integer.parseInt(lo.getuserid());
    String[] msgsto=new String[20];
    int msgid=0;
    //out.print(usertype+msgto+strDate+userid);
    
    psmt=con.prepareStatement("insert into tbl_message(message,datee,fromid,usertype)"+"values(?,?,?,?)");
    psmt.setString(1,message);
    psmt.setString(2,strDate);
    psmt.setInt(3,userid);
    psmt.setString(4,usertype);
    res=psmt.executeUpdate();
    
    
    
    psmt=con.prepareStatement("select * from tbl_message order by msgid desc limit 1");
    rs=psmt.executeQuery();
    if(rs.next())
    {
        msgid=rs.getInt("msgid");
    }
    
    
    if(msgto.equals("members"))
    {   psmt2=con.prepareStatement("select * from tbl_unit where admin_id=?");
        psmt2.setInt(1,userid);
        rs2=psmt2.executeQuery();
        if(rs2.next())
        {   
            psmt1=con.prepareStatement("select * from tbl_member where unitid=?");
            psmt1.setInt(1,rs2.getInt("unitid"));
            rs1=psmt1.executeQuery();
            while(rs1.next())
            {
            
            psmt=con.prepareStatement("insert into tbl_messagedetails(toid,msgid,totype)"+"values(?,?,?)");
            psmt.setInt(1,rs1.getInt("userid"));
            psmt.setInt(2,msgid);
            psmt.setString(3,"member");
            res=psmt.executeUpdate();
            
            }
        }
    }
    
    if(msgto.equals("ads"))
    {   psmt2=con.prepareStatement("select * from tbl_member where userid=?");
        psmt2.setInt(1,userid);
        rs2=psmt2.executeQuery();
        if(rs2.next())
        {   
            psmt1=con.prepareStatement("select * from tbl_ads where wardno=?");
            psmt1.setInt(1,rs2.getInt("wardno"));
            rs1=psmt1.executeQuery();
            if(rs1.next())
            {
            
            psmt=con.prepareStatement("insert into tbl_messagedetails(toid,msgid,totype)"+"values(?,?,?)");
            psmt.setInt(1,rs1.getInt("ads_id"));
            psmt.setInt(2,msgid);
            psmt.setString(3,"ads");
            res=psmt.executeUpdate();
            
            }
        }
    }
    
    
    if(msgto.equals("cds"))
    {   
        psmt1=con.prepareStatement("select * from tbl_login where usertype='cds'");
        rs1=psmt1.executeQuery();
        if(rs1.next())
        {
        psmt=con.prepareStatement("insert into tbl_messagedetails(toid,msgid,totype)"+"values(?,?,?)");
        psmt.setInt(1,rs1.getInt("userid"));
        psmt.setInt(2,msgid);
        psmt.setString(3,"cds");
        res=psmt.executeUpdate();

            
        }
    }
    
    
    if(msgto.equals("admin"))
    {
     
        psmt=con.prepareStatement("insert into tbl_messagedetails(toid,msgid,totype)"+"values(?,?,?)");
        psmt.setInt(1,0);
        psmt.setInt(2,msgid);
        psmt.setString(3,"admin");
        res=psmt.executeUpdate();
        
    }

    
   
    response.sendRedirect("../CAN/unitadminsendmessage.jsp?msg=Successfully Send Message");
  

    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
