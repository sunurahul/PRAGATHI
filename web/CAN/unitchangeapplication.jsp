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
	String usid=(String)session.getAttribute("usid");
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
<%@ include file="../adsheader.jsp" %>
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
            <h3>Unit Change Applications</h3>
    </div>
   
    <div class="row bottom_grids text-center mt-5 pt-3">
	<div align="center">
            <table width="812" height="111">
            <tr>
                <td width="87" height="50"> Applicant Name</td>
                <td width="141" height="50"> Present Unit</td>
                <td width="148" height="50"> Requested Unit</td>
                <td width="130" height="50"> </td>

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
    
    PreparedStatement psmt=null,psmt1=null; 
    ResultSet rs=null,rs1=null;
    int userid=Integer.parseInt(usid);
    int wardno=0,loanid=0,uid=0,fromm=0,too=0,ucid=0;
    String uname=null,fname=null,tname=null;
    
    psmt=con.prepareStatement("select * from tbl_unitchange where status='Applied' order by ucid desc");
    rs=psmt.executeQuery();
    while(rs.next())
    {
        ucid=rs.getInt("ucid");
		userid=rs.getInt("userid");
		fromm=rs.getInt("fromm");
		too=rs.getInt("too");
        psmt1=con.prepareStatement("select * from tbl_member where userid="+userid+"");
		rs1=psmt1.executeQuery();
		if(rs1.next())
		{
		uname=rs1.getString("name");
		}
		psmt1=con.prepareStatement("select * from tbl_unit where unitid="+fromm+"");
		rs1=psmt1.executeQuery();
		if(rs1.next())
		{
		fname=rs1.getString("unitname");
		}
		psmt1=con.prepareStatement("select * from tbl_unit where unitid="+too+"");
		rs1=psmt1.executeQuery();
		if(rs1.next())
		{
		tname=rs1.getString("unitname");
		}
        %>

            <tr>
                <td height="53"> <%out.print(uname);%> </td>
                <td> <%out.print(fname);%> </td>
                <td> <%out.print(tname);%> </td>
                
                <td> <a href="../process/verifychange.jsp?ucid=<%=ucid%>">Verify</a> &nbsp;&nbsp;&nbsp;&nbsp;  <a href="../process/rejectchange.jsp?ucid=<%=ucid%>">Reject</a> </td>
                
                
            </tr>
      </table>

              <%}}
   
 catch(Exception e)
    {
        e.printStackTrace();
    }
    %>
              
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

