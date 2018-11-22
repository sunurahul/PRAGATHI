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
<jsp:useBean id="lo" class="beanclass.changepass"/>
<jsp:setProperty name="lo" property="*"/>
<%
    try
    {
    MyDb db = new MyDb();
    Connection con =db.getCon();
    
    PreparedStatement psmt=null,psmt1=null; 
    ResultSet rs=null,rs1=null;
    int res=0,res1=0;

    String usertype=lo.getusertype();
    String unam=lo.getunam();
    String pass=lo.getpass();
    String npass=lo.getnpass();
   
    psmt=con.prepareStatement("update tbl_login set password=? where username=? and password=?");
    psmt.setString(1,npass);
    psmt.setString(2,unam);
    psmt.setString(3,pass);
    res=psmt.executeUpdate();

    if(res>0)
    {
        if(usertype.equals("admin"))
        {
          response.sendRedirect("../Admin/adminchangepass.jsp?msg=Changed Successfully");  
        }
        else if(usertype.equals("cds"))
        {
          response.sendRedirect("../CAN/cdschangepass.jsp?msg=Changed Successfully");  
        
        }
        else if(usertype.equals("ads"))
        {
          response.sendRedirect("../CAN/adschangepass.jsp?msg=Changed Successfully");  
        
        }
        else if(usertype.equals("unitadmin"))
        {
          response.sendRedirect("../CAN/unitadminchangepass.jsp?msg=Changed Successfully"); 
        }
        else if(usertype.equals("nhg"))
        {
          response.sendRedirect("../CAN/nhgchangepass.jsp?msg=Changed Successfully"); 
        }
    }
    else
    {
        if(usertype.equals("admin"))
        {
          response.sendRedirect("../Admin/adminchangepass.jsp?msg=Incoreect Password");  
        }
        else if(usertype.equals("cds"))
        {
          response.sendRedirect("../CAN/cdschangepass.jsp?msg=Incoreect Password");  
        
        }
        else if(usertype.equals("ads"))
        {
          response.sendRedirect("../CAN/adschangepass.jsp?msg=Incoreect Password");    
        
        }
        else if(usertype.equals("unitadmin"))
        {
          response.sendRedirect("../CAN/unitadminchangepass.jsp?msg=Incoreect Password");  
        }
        else if(usertype.equals("nhg"))
        {
          response.sendRedirect("../CAN/nhgchangepass.jsp?msg=Incoreect Password");  
        }
    }
         
  
  
     }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
