<%-- 
    Document   : contact
    Created on : 1 Nov, 2018, 9:59:12 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact us</title>
         <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);<head>
     

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
				<a class="navbar-brand" href="index.jsp"><i class="fab fa-python"></i> Home</a>
			</h1>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-lg-4 mr-auto">
				  <li class="nav-item active">
					<a class="nav-link" href="about.jsp">About Us <span class="sr-only">(current)</span></a>
				  </li>
				   <li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					  Activities
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					  <a class="dropdown-item" href="product.jsp">Products</a>
					  <a class="dropdown-item" href="social.jsp">Social work</a>
					  <a class="dropdown-item" href="agriculture.jsp">Agriculture</a>
					</div>
				  </li>
				  <li class="nav-item active">
					<a class="nav-link" href="gallery.jsp">Gallery <span class="sr-only">(current)</span></a>
					
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="contact.jsp">Contact</a>
				  </li>
				</ul>
				<div class="header-right">
					<a href="loginform.jsp" class="signin mr-4"> Sign in <i class="fas fa-sign-in-alt"></i></a>
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
<!-- Contact -->
<section class="contact py-5">
	<div class="container py-md-3">
		<div class="heading">
			<h3 class="head text-center">Contact Us!!! </h3>
			<p class="my-3 head text-center"> </p>
		</div>
		<div class="contact-form mt-5">
			<div class="row">
				<div class="col-lg-7 col-md-10 mx-auto">
					<form name="contactform" id="contactform" method="post" action="#" onsubmit="return(validate());" novalidate="novalidate">
						<div class="form-group">
						  <label>Name</label>
						  <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
						</div>
						<div class="form-group">
						  <label>Group name</label>
						  <input type="text" class="form-control" id="grpname" placeholder="Enter Group Name" name="grpname">
						</div>
						
						<div class="form-group">
						  <label>Phone No.</label>
						  <input type="text" class="form-control" id="phone" placeholder="Enter Phone no." name="phone">
						</div>
						<div class="form-group">
						  <label>Subject</label>
						  <input type="text" class="form-control" id="subject" placeholder="Subject" name="subject">
						</div>
						<div class="form-group">
						  <label>How can we help?</label>
						  <textarea name="issues" class="form-control" id="iq" placeholder="Enter Your Message Here"></textarea>
						</div>				
						<center><button type="submit" class="btn btn-default">Submit</button><center>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Contact -->




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

	<script src="../js/smoothscroll.js"></script><!-- Smooth scrolling -->


    </body>

</html>
