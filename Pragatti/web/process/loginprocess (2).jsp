<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arogyasree</title>
        
    </head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="MyPack.MyDb"%>
<jsp:useBean id="lo" class="beanclass.loginbeen"/>
<jsp:setProperty name="lo" property="*"/>
<%
    try
    {
    MyDb db = new MyDb();
    Connection con =db.getCon();
    
    PreparedStatement psmt=null,psmt1=null; 
    ResultSet rs=null;
    
    String username=lo.getusername();
    String password=lo.getpassword();
    
    psmt=con.prepareStatement("select * from tbl_login where username=? and password=?");
    psmt.setString(1,username);
    psmt.setString(2,password);
    rs=psmt.executeQuery();
    out.print(username+password);
    if(rs.next())
        {
        String usertype=rs.getString("usertype");
        int userid=rs.getInt("userid");
 
        session.setAttribute("unam",username);  
        session.setAttribute("utype",usertype); 
        session.setAttribute("uid",rs.getInt("userid"));
        if(usertype.equals("admin"))
            {
            response.sendRedirect("../Admin/adminhome.jsp");
            }
        psmt1=con.prepareStatement("select * from tbl_member where userid=?");
        psmt1.setInt(1,userid);
        ResultSet rs1=psmt1.executeQuery();
        if(rs1.next())
        {
        if(rs1.getString("status").equals("Verified"))
            {

            if(usertype.equals("cds"))
                {
                response.sendRedirect("../CDS/cdshome.jsp");        
                }
            else if(usertype.equals("ads"))
                {
                response.sendRedirect("../ADS/adshome.jsp");
                }
            else if(usertype.equals("Member"))
                {
                response.sendRedirect("../NHG/nhghome.jsp");
                }
            else if(usertype.equals("unitadmin"))
                {
                response.sendRedirect("../UADMIN/unitadminhome.jsp");
                }
            }
        else 
            {
            response.sendRedirect("../login.jsp?msg=Your Account Has not been verified yet");
            } 
       
        }
        }
    else
        {
        response.sendRedirect("../login.jsp?msg=Incorrect Username or Password");
        }
           
}
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 
    </body>
</html>
