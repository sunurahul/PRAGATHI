<%-- 
    Document   : regform
    Created on : Sep 25, 2018, 10:11:52 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
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
    </head>
    <body>
        
    
        <!-- header -->
<header class="bg-white py-1">
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light">
			<h1>
				<a class="navbar-brand" href="../Admin/index.jsp"><i class="fab fa-python"></i> Home</a>
			</h1>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-lg-4 mr-auto">
				  <li class="nav-item active">
					<a class="nav-link" href="../Admin/about.jsp">About Us <span class="sr-only">(current)</span></a>
				  </li>
				   <li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					  Activities
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					  <a class="dropdown-item" href="../Admin/product.jsp">Products</a>
					  <a class="dropdown-item" href="../Admin/social.jsp">Social work</a>
					  <a class="dropdown-item" href="../Admin/agriculture.jsp">Agriculture</a>
					</div>
				  </li>
				  <li class="nav-item active">
					<a class="nav-link" href="../Admin/gallery.jsp">Gallery <span class="sr-only">(current)</span></a>
					
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="../Admin/contact.jsp">Contact</a>
				  </li>
				</ul>
				<div class="header-right">
					<a href="../Admin/loginform.jsp" class="signin mr-4"> Sign in <i class="fas fa-sign-in-alt"></i></a>
					<a href="../CAN/regform.jsp" class="contact">Registration</a>
				</div>
			</div>
		</nav>
	</div>
</header>
<!-- //header -->
<!-- banner -->
<section class="inner-banner">
	<div class="container">
	</div>
</section>
<!-- //banner -->

<!-- signin -->
<section class="signin py-5">
	<div class="container">
		<div class="row main-content-agile">
			<div class="col-md-6">	
				<div class="sub-main-w3 text-center">	
					<h3>Create account</h3>
					<p class="mt-2 mb-4">Enter your details to create account.</p>
					<form action="../process/regprocess.jsp" method="post">
						<div class="icon1">
							<input placeholder="Full Name" name="name" type="text" required="">
						</div>
						<div class="icon1">
							<input placeholder="Address" name="add" type="text" required="">
						</div>
                                            <div class="icon2">
							<input  placeholder="DOB" name="dob" type="text" required="">
						</div>
                                            <div class="icon2">
							<input  placeholder="Aadhar number" name="adharno" type="text" required="">
						</div>
                                            <div class="icon1">
                                             <li class="nav-item dropdown">
                                                <select name="pstn"   class="form-control" id="navbarDropdown"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					  <option>User Type</option>
                                               
                                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
					  <option class="dropdown-item" >cds</option>
                                           <option class="dropdown-item" >ads</option>
                                            <option class="dropdown-item" >nhg</option>
                                                </div>
                                          </select>
					
                                                 </li>
						</div>
                                            <div class="icon2">
							<input  placeholder="Phone number" name="phno" type="text" required="">
						</div>
                                            <div class="icon2">
							<input  placeholder="Ward number" name="wrdno" type="text" required="">
						</div>
                                            <div class="icon1">
							<input  placeholder="Username" name="uname" type="text" required="">
						</div>
						<div class="icon2">
							<input  placeholder="Password" name="pass" type="password" required="">
						</div>
                                            <div class="icon2">
							<input  placeholder="Confirm Password" name="pass1" type="password" required="">
						</div>
						<input type="submit" value="Create Account">
						<p>Already have an Account ? <a href="../Admin/loginform.jsp" class="ml-2"><strong>Sign in to your Account</strong></a></p>
					</form>
				</div>
			</div>
			<div class="col-md-6">
				<img src="../images/banner.png" alt="" class="img-fluid"/>
			</div>
		</div>
	</div>
</section>
<!-- //signin -->
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
				<h4 class="mb-4 w3f_title text-uppercase">Pragathi</h4>
				<ul class="list-agileits">
					<li class="my-2">
						<a href="about.jsp">
							About Us
						</a>
					</li>
					<li class="mb-2">
						<a href="gallery.jsp">
							Gallery
						</a>
					</li>
					
					<li>
						<a href="contact.jsp">
							Get In Touch
						</a>
					</li>
				</ul>
			</div>
			<div class="col-lg-2 col-sm-3 col-6">
				<h4 class="mb-4 w3f_title text-uppercase">Activities</h4>
				<ul class="list-agileits">
					<li class="my-2">
						<a href="product.jsp">
							Our products
						</a>
					</li>
					<li class="mb-2">
						<a href="social.jsp">
						Social Works
						</a>
					</li>
					<li class="my-2">
						<a href="agriculture.jsp">
							Agriculture
						</a>
					</li>
					
				</ul>
			</div>

			<div class="col-lg-2 col-sm-3 col-6 mt-sm-0 mt-4">
				<h4 class="mb-4 w3f_title text-uppercase">Hierarchy</h4>
				<ul class="list-agileits">
					<li class="my-2">
						<a href="http://www.kudumbashree.org/pages/171">
							CDS
						</a>
					</li>
					<li class="mb-2">
						<a href="http://www.kudumbashree.org/pages/171">
							ADS
						</a>
					</li>
					<li class="my-2">
						<a href="http://www.kudumbashree.org/pages/171">
							NHG
						</a>
					</li>
					
				</ul>
			</div>
			
			<div class="col-lg-2 col-sm-3 col-6 mt-sm-0 mt-4">
				<h4 class="mb-4 w3f_title text-uppercase">Extras</h4>
				<ul class="list-agileits">
					
					<li class="mb-2">
						<a href="loginform.jsp">
							Login
						</a>
					</li>
					<li class="my-2">
						<a href="../CAN/regform.jsp">
							Register
						</a>
					</li>
                                        <li class="my-2">
						<a href="#">
							Create unit
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
    <script src="../js/jquery-2.2.3.min.js"></script>
    <script src="../js/bootstrap.js"></script>
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
