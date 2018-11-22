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
.style1 {font-size: 150%}
.style4 {font-size: 18px}
.style5 {font-size: 16px}
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
		<div class="heading style1">
                    <h4 align="left"> Select The Unit
		<h4>
		<h4 align="right"> 
		<a href="unitchangeapplication.jsp">Unit Change Application </a></div> 
		<h4>
                        
                        <table width="739" height="145"> 
                            <tr>
                                <td width="161" height="69"><span class="style4"> Unit Number</span></td>
                                <td width="189"><span class="style4"> Unit Name</span></td>
								<td width="373"> </td>
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
    int unitid=0,wardno=0;
    int userid=Integer.parseInt(usid);
    
	psmt=con.prepareStatement("select * from tbl_ads where ads_id=?");
	psmt.setInt(1,userid);
	rs=psmt.executeQuery();
	if(rs.next())
		{
		wardno=rs.getInt("wardno");
		}
    psmt=con.prepareStatement("select * from tbl_unit where wardno=?");
    psmt.setInt(1,wardno);
    rs=psmt.executeQuery();
    while(rs.next())
            {
                unitid=rs.getInt("unitid");
                
	%>
			
        <tr>
            <td height="68"> <span class="style5"><a href="adsviewunitmembers.jsp?unitid=<%=unitid%>">
                    
	        <%out.print(unitid);%>          
          </span></td>
            <td> 
		      <span class="style5">
		      <%out.print(rs.getString("unitname"));%>            
	      </span></td>
			<td> <a href="adsviewunitproducts.jsp?unitid=<%=unitid%>" class="style5">View Their Products </a></td>
            </tr>                        
		  
                        <%
}
              %>
      </table>		
  </div>

</section>
              <%
    }
    
 catch(Exception e)
    {
        e.printStackTrace();
    }
    %>
<!-- banner bottom -->

<!-- about -->
<section class="about py-5">
	<div class="container">
		<div class="inner-sec-w3ls py-lg-5 py-3">
			<div class="heading">
				<h3 class="head text-center">What are you looking for? </h3>
				<p class="my-3 head text-center"> Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus
				turpis sodales quis. Integer sit amet mattis quam.</p>
			</div>
			<div class="row mt-lg-5 mt-5 pt-md-3">
				<div class="col-lg-4 col-md-6 about-in text-left">
					<div class="card">
						<div class="card-body">
							<div class="icon-service"><img src="../images/s1.png" alt="" class="img-fluid"/></div>
							<div class="icon-service-info">
								<h4 class="card-title">Growth</h4>
								<p class="card-text">Lorem ipsum dolor amet.</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>

				</div>
				<div class="col-lg-4 col-md-6 about-in text-left">
					<div class="card">
						<div class="card-body">

							<div class="icon-service"><img src="../images/s2.png" alt="" class="img-fluid"/></div>
							<div class="icon-service-info">
								<h4 class="card-title">Security</h4>
								<p class="card-text">Lorem ipsum dolor amet.</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>

				</div>

				<div class="col-lg-4 col-md-6 about-in text-left">
					<div class="card">
						<div class="card-body">
							<div class="icon-service"><img src="../images/s3.png" alt="" class="img-fluid"/></div>
							<div class="icon-service-info">
								<h4 class="card-title">Company</h4>
								<p class="card-text">Lorem ipsum dolor amet.</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 about-in text-left">
					<div class="card">
						<div class="card-body mb-md-0">
							<div class="icon-service"><img src="../images/s4.png" alt="" class="img-fluid"/></div>
							<div class="icon-service-info">
								<h4 class="card-title"> Help Line</h4>
								<p class="card-text">Lorem ipsum dolor amet.</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>

				</div>
				<div class="col-lg-4 col-md-6 about-in text-left">
					<div class="card">
						<div class="card-body mb-md-0">
							<div class="icon-service"><img src="../images/s5.png" alt="" class="img-fluid"/></div>

							<div class="icon-service-info">
								<h4 class="card-title">Awards</h4>
								<p class="card-text">Lorem ipsum dolor amet.</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>

				</div>

				<div class="col-lg-4 col-md-6 about-in text-left">
					<div class="card">
						<div class="card-body mb-md-0">
							<div class="icon-service"><img src="../images/s6.png" alt="" class="img-fluid"/></div>
							<div class="icon-service-info">
								<h4 class="card-title">Mobile App</h4>
								<p class="card-text">Lorem ipsum dolor amet.</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
</section>
<!-- //about -->







<!-- footer -->
<footer class="footer py-5">
	<div class="container py-sm-4">
		<div class="row">
			<div class="col-lg-4 mb-lg-0 mb-4 footer-top">
				<h2>
				<a class="navbar-brand" href="index.jsp"><i class="fab fa-python"></i> Pragati</a>
				</h2>
				<p class="my-3 head"> A community organization of Self Help Groups (SHG's) of women in Kerala, has been recognized as an effective strategy for the empowerment of women.</p>
			</div>
			<div class="col-lg-2 col-sm-3 col-6 footv3-left">
				<h4 class="mb-4 w3f_title text-uppercase">Company</h4>
				<ul class="list-agileits">
					<li class="my-2">
						<a href="about.html">
							About Us
						</a>
					</li>
					<li class="mb-2">
						<a href="features.html">
							Features
						</a>
					</li>
					<li class="my-2">
						<a href="#">
							Projects
						</a>
					</li>
					<li class="my-2">
						<a href="blogs.html">
							Blog Posts
						</a>
					</li>
					<li>
						<a href="contact.html">
							Get In Touch
						</a>
					</li>
				</ul>
			</div>
			<div class="col-lg-2 col-sm-3 col-6">
				<h4 class="mb-4 w3f_title text-uppercase">Product</h4>
				<ul class="list-agileits">
					<li class="my-2">
						<a href="#">
							Why Us?
						</a>
					</li>
					<li class="mb-2">
						<a href="features.html">
							Features
						</a>
					</li>
					<li class="my-2">
						<a href="security.html">
							Security
						</a>
					</li>
					<li class="my-2">
						<a href="pricing.html">
							Pricing
						</a>
					</li>
					<li>
						<a href="#">
							Settings
						</a>
					</li>
				</ul>
			</div>

			<div class="col-lg-2 col-sm-3 col-6 mt-sm-0 mt-4">
				<h4 class="mb-4 w3f_title text-uppercase">Resources</h4>
				<ul class="list-agileits">
					<li class="my-2">
						<a href="#">
							Help Line
						</a>
					</li>
					<li class="mb-2">
						<a href="#">
							Steps To Follow
						</a>
					</li>
					<li class="my-2">
						<a href="#">
							Guidance
						</a>
					</li>
					<li class="my-2">
						<a href="#">
							Download
						</a>
					</li>
					<li>
						<a href="#">
							Mobile App
						</a>
					</li>
				</ul>
			</div>
			
			<div class="col-lg-2 col-sm-3 col-6 mt-sm-0 mt-4">
				<h4 class="mb-4 w3f_title text-uppercase">Extras</h4>
				<ul class="list-agileits">
					<li class="my-2">
						<a href="#">
							Extra Links
						</a>
					</li>
					<li class="mb-2">
						<a href="signin.html">
							Login
						</a>
					</li>
					<li class="my-2">
						<a href="register.html">
							Register
						</a>
					</li>
				</ul>
			</div>
			
		</div>
	</div>
	<!-- //footer bottom -->
</footer>
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

