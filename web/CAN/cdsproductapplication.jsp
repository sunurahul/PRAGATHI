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
    <!-- css files -->
    <link href="../css/bootstrap.css" rel='stylesheet' type='text/css' /><!-- bootstrap css -->
    <link href="../css/style.css" rel='stylesheet' type='text/css' /><!-- custom css -->
    <link href="../css/fontawesome-all.css" rel="stylesheet"><!-- fontawesome css -->
	<!-- //css files -->
        <!-- google fonts -->
	<link href="//fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700,800&amp;subset=devanagari,latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Niramit:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext,thai,vietnamese" rel="stylesheet">
	<!-- //google fonts -->
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
<%@ include file="../cdsheader.jsp" %>
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

                    <h4 align="left"> Product Application</div> <h4>
                        
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
    int pid=0;
    
    psmt=con.prepareStatement("select * from tbl_product where status='Applied'");
   
    rs=psmt.executeQuery();
    
	%>
			
		</div>
		<div class="row bottom_grids text-center mt-5 pt-3">
                    
    <%
    int unitid=0,wardno=0;
	String uniname=null;
    while(rs.next())
        {   
        pid=rs.getInt("pid");   
        unitid=rs.getInt("unitid");
        psmt1=con.prepareStatement("select * from tbl_unit where unitid=?");
        psmt1.setInt(1,unitid);
        rs1=psmt1.executeQuery();
        if(rs1.next())
        {
            wardno=rs1.getInt("wardno");
			uniname=rs1.getString("unitname");
			
        }
        
    
    %>
			<div class="col-lg-4 col-md-6">
				<img src="../DisplayImageStaff?pid=<%=pid%>"   class="img-responsive" name="photo1" width="250" height="250" id="img1" >
                                <h3 class="my-3"><%out.print(rs.getString("pname"));%></h3>
                                <p class="mb-4"><%out.print(rs.getString("descri"));%></p><br>
                                <p class="mb-4"><%out.print("Applied By "+uniname+" ward Number "+wardno);%></p>
                                <p class="mb-4"><a href="../process/verifyproduct.jsp?pid=<%=pid%>" onClick="return fun_alert()">Verify </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../process/rejectproduct.jsp?pid=<%=pid%>" onClick="return fun_alert()">Reject</a> </p>
			</div>
                        <%
}
              %>
			
		</div>
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
