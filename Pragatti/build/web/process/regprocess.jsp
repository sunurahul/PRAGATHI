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
    int res=0,res1=0;

   String name=lo.getname();
   String phone=lo.getphone();
   String aadharno=lo.getaadharno();
   int wardno=Integer.parseInt(lo.getwardno());
   String address=lo.getaddress();
   String username=lo.getusername();
   String password=lo.getpassword();
   String dob=lo.getdob();
   int unitid=Integer.parseInt(lo.getunitname());
   
   psmt=con.prepareStatement("select * from tbl_login where username=?");
   psmt.setString(1,username);
   rs=psmt.executeQuery();
   if(rs.next())
   {
       response.sendRedirect("../regform2?wardno="+wardno+"&&msg=Username already exists");   
   }
   
   psmt=con.prepareStatement("select * from tbl_member where aadhar=?");
   psmt.setString(1,aadharno);
   rs=psmt.executeQuery();
   if(rs.next())
   {
       response.sendRedirect("../regform2?wardno="+wardno+"&&msg=SAme Aafhar Number already used");   
   }
           
   
   psmt=con.prepareStatement("insert into tbl_member(wardno,unitid,name,address,phone,dob,aadhar,status)"+"values(?,?,?,?,?,?,?,?)");
   psmt.setInt(1,wardno);
   psmt.setInt(2,unitid);
   psmt.setString(3,name);
   psmt.setString(4,address);
   psmt.setString(5,phone);
   psmt.setString(6,dob);
   psmt.setString(7,aadharno);
   psmt.setString(8,"Not Verified");
   
   res=psmt.executeUpdate();
   int userid=0;
   psmt=con.prepareStatement("select * from tbl_member order by userid desc limit 1");
   rs=psmt.executeQuery();
   if(rs.next())
   {
       userid=rs.getInt("userid");
   }
   
   out.print(userid);
   psmt=con.prepareStatement("insert into tbl_login(userid,username,password,usertype)"+"values(?,?,?,?)");
   psmt.setInt(1,userid);
   psmt.setString(2,username);
   psmt.setString(3,password);
   psmt.setString(4,"Member");
   
   res=psmt.executeUpdate();
   
   if(res>0)
   {
      response.sendRedirect("../login.jsp?msg=Successfully Registered");
   }
   
    else 
        {
        out.println("Error in page");
        }

     }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
