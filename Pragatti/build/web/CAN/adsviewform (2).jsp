<%-- 
    Document   : adsviewform
    Created on : 25 Oct, 2018, 10:53:23 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View ADS</title>
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
    </head>
    <body>
        <!-- header -->
<header class="bg-white py-1">
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light">
			<h1>
				<a class="navbar-brand" href="index.jsp"><i class="fab fa-python"></i> HOME</a>
			</h1>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-lg-4 mr-auto">
				  <li class="nav-item active">
					<a class="nav-link" href="about.html">About Us <span class="sr-only">(current)</span></a>
				  </li>
				   <li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					  Activities
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					  <a class="dropdown-item" href="#">Products</a>
					  <a class="dropdown-item" href="#">Social work</a>
					  <a class="dropdown-item" href="#">Paliative care</a>
					</div>
				  </li>
                                  <li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					  CAN
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					  <a class="dropdown-item" href="../CAN/cdsviewform.jsp">CDS</a>
					  <a class="dropdown-item" href="../CAN/adsviewform">ADS</a>
					  <a class="dropdown-item" href="../CAN/nhgviewform">NHG</a>
					</div>
				  </li>
                                  
				  <li class="nav-item active">
					<a class="nav-link" href="#">Sanction Loan <span class="sr-only">(current)</span></a>
					
				  </li>
                                  <li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					  Edit
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					  <a class="dropdown-item" href="#">Edit Profile</a>
					  <a class="dropdown-item" href="#">Change Password</a>
					  
					</div>
				  </li>
                                  <li class="nav-item active">
					<a class="nav-link" href="#">Feedback <span class="sr-only">(current)</span></a>
					
				  </li>
                                  <li class="nav-item active">
					<a class="nav-link" href="#">Gallery <span class="sr-only">(current)</span></a>
					
				  </li>
                                  
				  <li class="nav-item">
					<a class="nav-link" href="contact.html">Contact</a>
				  </li>
				</ul>
				<div class="header-right">
					
					
                                        <li class="nav-item dropdown">
					<a href="#" class="contact">ADMIN</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					  <a class="dropdown-item" href="#">My Profile</a>
					  <a class="dropdown-item" href="#">Logout</a>
					  
					</div>
				  </li>
				</div>
			</div>
		</nav>
	</div>
</header>
<!-- //header -->

    </head>
    <body>
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

	<script src="../js/smoothscroll.js"></script><!-- Smooth scrolling -->

    </body>
</html>
