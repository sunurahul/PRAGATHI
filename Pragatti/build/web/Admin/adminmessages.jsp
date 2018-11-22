<%-- 
    Document   : index
    Created on : Oct 25, 2018, 12:43:13 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- css files -->
    <link href="../css/bootstrap.css" rel='stylesheet' type='text/css' /><!-- bootstrap css -->
    <link href="../css/style.css" rel='stylesheet' type='text/css' /><!-- custom css -->
    <link href="../css/fontawesome-all.css" rel="stylesheet"><!-- fontawesome css -->
	<!-- //css files -->
        <!-- google fonts -->
	<link href="//fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700,800&amp;subset=devanagari,latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Niramit:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext,thai,vietnamese" rel="stylesheet">
	<!-- //google fonts -->
    <style type="text/css">
<!--
.style2 {font-size: 18px; font-weight: bold; color: #0033FF; }
-->
    </style>
    </head>
    <body>
 <%
	String unam=(String)session.getAttribute("unam");
 	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
    if(session.getAttribute("unam")==null){
    session.invalidate();
    response.sendRedirect("../login.jsp?msg=Please login");

	} 
	%>
        <!-- header -->
<%@ include file="../adminheader.jsp" %>
<!-- //header -->
<!-- banner -->


<section class="banner">
    <br> <br>
</section>
<!-- //banner -->

<!-- banner bottom -->

<section class="banner-bottom py-5">
<div class="container py-md-3">
    <div class="heading">
        <h5 align="left">
<%
String m=null;
m=request.getParameter("msg");
if(m!=null)
out.println(m);

%> </h5><br>
<h4 align="right"><a href="adminsendmessage.jsp">Send a Messages</a></h4> <br>
            <h4 align="right"><a href="viewfeedback.jsp">View Feedbacks</a></h4>
			<h3>Messages</h3>
    </div>
   
    <div class="row bottom_grids text-center mt-5 pt-3">
	<div align="center">

            <table width="735" height="132">
            <tr>
              <td width="351" height="62"> <div align="left" class="style2">Message </div></td>
			  <td width="116" height="62"> <div align="left" class="style2">Date </div></td>
			  <td width="158" height="62"> <div align="left" class="style2">Sent From </div></td>
			  <td width="90" height="62"> <div align="left" class="style2"> </div></td>
            </tr>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="MyPack.MyDb"%>
<jsp:useBean id="lo" class="beanclass.newadsbeen"/>
<jsp:setProperty name="lo" property="*"/>
<%
    try
    {
    MyDb db = new MyDb();
    Connection con =db.getCon();
    
    PreparedStatement psmt=null,psmt1=null,psmt2=null,psmt3=null; 
    ResultSet rs=null,rs1=null,rs2=null,rs3=null;
    int id=0;
    String mesg=null;
    psmt=con.prepareStatement("select * from tbl_messagedetails where totype='admin'");
    rs=psmt.executeQuery();
    while(rs.next())
    {   id=rs.getInt("id");
        psmt1=con.prepareStatement("select * from tbl_message where msgid=?");
        psmt1.setInt(1,rs.getInt("msgid"));
        rs1=psmt1.executeQuery();
        if(rs1.next())
        {
             psmt2=con.prepareStatement("select * from tbl_login where userid=?");
             psmt2.setInt(1,rs1.getInt("fromid"));
             rs2=psmt2.executeQuery();
             if(rs2.next())
             {
                 psmt3=con.prepareStatement("select * from tbl_member where userid=?");
                 psmt3.setInt(1,rs1.getInt("fromid"));
                 rs3=psmt3.executeQuery();
                 if(rs3.next())
                 {
                     
                 
	%>
            <tr>
              <td height="62"><%out.print(rs1.getString("message"));%></td>
              <td height="62"><%out.print(rs1.getString("datee"));%></td>
              <td height="62"><%out.print(rs3.getString("name")+" ("+rs2.getString("usertype")+")");%></td>
              <td height="62"><a href="../process/deletemsg.jsp?id=<%=id%>&&utype=admin">Delete</a></td>
            </tr>
            
<%}}}}
    }
 catch(Exception e)
    {
        e.printStackTrace();
    }
    %>
      </table>
</form>
              
</div>
    </div>
</div>
</section>
<!-- banner bottom -->

<!-- about -->

<!-- copyright -->

    <!-- js -->
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <!-- //js -->
	
	<!-- dropdown nav -->
    <script>
        $(document).ready(function() {
            $(".dropdown").hover(
                function() {
                    $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function() {
                    $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                    $(this).toggleClass('open');
                }
            );
        });
    </script>
    <!-- //dropdown nav -->

	<script src="js/smoothscroll.js"></script><!-- Smooth scrolling -->


    </body>
</html>
