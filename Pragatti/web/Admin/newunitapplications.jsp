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
	<script type="text/javascript">
    function fun_alert()
    {
	return confirm("Confirm your Selection");
	}
</script>
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
.style9 {color: #006699}
-->
    </style>
    </head>
    <body>
        <!-- header -->
<%@ include file="../adminheader.jsp" %>
<!-- //header -->
<!-- banner -->
<section class="banner">
	<div class="container">
		<div class="row banner-grids">
      <table width="1091">
	  <tr> <td colspan="7"> <div align="center">
	    <%
String m=null;
m=request.getParameter("msg");
if(m!=null)
out.println(m);

%> 
	    </div></td>
	  </tr>
	  <tr>
                        <td width="147" height="48"><span class="style9"> Unit Number </span></td>
                        <td width="157"><span class="style9"> Unit Name </span></td>
                        <td width="134"><span class="style9"> Ward Number </span></td>
                        <td width="207"><span class="style9"> Applicant Name </span></td>
                        <td width="163"><span class="style9"> Address </span></td>
                        <td width="113"><span class="style9"> Phone </span></td>
                        <td width="138"> </td>
          </tr>              
                            
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
    ResultSet rs=null,rs1=null;
    
    int unitid=0,wardno=0,applicantid=0;
    String unitname=null;
    psmt=con.prepareStatement("select * from tbl_unit where status='Not Verified'");
    rs=psmt.executeQuery();
    while(rs.next())
    {
    unitid=rs.getInt("unitid");
    wardno=rs.getInt("wardno");
    applicantid=rs.getInt("applicantid");
    unitname=rs.getString("unitname");
     
    psmt1=con.prepareStatement("select * from tbl_member where userid=?");
    psmt1.setInt(1,applicantid);
    rs1=psmt1.executeQuery();
    if(rs1.next())
    {   
%>
          <tr>    
              <td height="40"> 
                <div align="left">
                  <%out.print(unitid);%> 
                </div></td>
              <td> 
                <div align="left">
                  <%out.print(unitname);%>
                </div></td>
              <td>
                <div align="left">
                  <%out.print(wardno);%> 
                </div></td>
              <td>
                <div align="left">
                  <%out.print(rs1.getString("name"));%> 
                </div></td>
              <td>
                <div align="left">
                  <%out.print(rs1.getString("address"));%> 
                </div></td>
              <td>
                <div align="left">
                  <%out.print(rs1.getString("phone"));%> 
                </div></td>
              <td> <div align="center"><a href="../process/verifyunit.jsp?unitid=<%=unitid%>&&wardno=<%=wardno%>&&userid=<%=applicantid%>" onClick="return fun_alert()"> Verify </a> &nbsp;&nbsp;&nbsp;<a href="../process/rejectunit.jsp?unitid=<%=unitid%>" onClick="return fun_alert()">Reject </a> </div></td>
          </tr>
 <%
    }
    }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 
          </table>
			
		</div>
	</div>
</section>
<!-- //banner -->

<!-- banner bottom -->

<!-- //footer -->

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
