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
.style11 {
	font-size: 110%;
	font-weight: bold;
	color: #0033FF;
}
.style14 {color: #0033FF; font-weight: bold; }
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

	
	    
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="MyPack.MyDb"%>
<jsp:useBean id="lo" class="beanclass.addcds"/>
<jsp:setProperty name="lo" property="*"/>
<%
    try
    {
    MyDb db = new MyDb();
    Connection con =db.getCon();
    
    PreparedStatement psmt=null,psmt1=null; 
    ResultSet rs=null;
	
    int ads_id=Integer.parseInt(lo.getads_id());

    psmt=con.prepareStatement("select * from tbl_member where userid=?");
    psmt.setInt(1,ads_id);
    rs=psmt.executeQuery();
    if(rs.next())
    {
    
    
	%>
        <form name="form1" method="get" onSubmit="return validation()" action="../process/updatecds.jsp">
        <table width="875" height="287" border="0">
      <tr>
        <td colspan="4"><div align="center" class="style11">NEW CDS </div></td>
        </tr>
      <tr>
        <td width="197"><span class="style14">Member ID or ADS _ ID </span></td>
        <td width="228"><span class="icon1">
          <input name="ads_id" type="hidden" id="ads_id" placeholder="ads_id" required="" value="<%out.print(ads_id);%>"><%out.print(ads_id);%>
        </span></td>
        <td width="310"><span class="style14"> </span></td>
        <td width="122"><span class="icon1"> </span></td>
      </tr>
      <tr>
        <td><span class="style14">Member Name </span></td>
        <td><span class="icon1">
          <%out.print(rs.getString("name"));%>
        </span></td>
        <td><span class="style14">Address</span></td>
        <td>
            <span class="icon1">
                <%out.print(rs.getString("address"));%>
        </span></td>
      </tr>
      <tr>
        <td><span class="style14">Phone</span></td>
        <td><span class="icon1">
                <%out.print(rs.getString("phone"));%>
        </span></td>
        <td><span class="style14">Adhar Number </span></td>
        <td><span class="icon1">
                <%out.print(rs.getString("aadhar"));%>
        </span></td>
      </tr>
      <tr>
        <td colspan="4"><div align="center">
          <label>
          <input type="submit" name="Submit" value="Confirm">
          </label>
        </div></td>
        </tr>
    </table>
        </form>
	<%
    }}
    
 catch(Exception e)
    {
        e.printStackTrace();
    }
    %>
	  </div>
	</div>
</section>
<!-- //banner -->

<!-- banner bottom -->

<!-- //footer -->

<!-- copyright -->
<section class="copy-right bg-light py-4">
	<div class="container">
		<div class="row">
			<div class="col-lg-7 col-md-9">
				<p class="">© 2018 Pragati. All rights reserved | Design by MPS!!!
					 
				</p>
			</div>
			<div class="col-lg-5 col-md-3">
				<ul class="social-iconsv2 agileinfo d-flex">
					<li>
						<a href="#">
							<i class="fab fa-facebook-square"></i>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fab fa-twitter-square"></i>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fab fa-google-plus-square"></i>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fab fa-linkedin"></i>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</section>
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
