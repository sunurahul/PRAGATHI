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
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' /><!-- bootstrap css -->
    <link href="css/style.css" rel='stylesheet' type='text/css' /><!-- custom css -->
    <link href="css/fontawesome-all.css" rel="stylesheet"><!-- fontawesome css -->
	<!-- //css files -->
        <!-- google fonts -->
	<link href="//fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700,800&amp;subset=devanagari,latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Niramit:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext,thai,vietnamese" rel="stylesheet">
	<!-- //google fonts -->
    </head>
    <body>
       
        <!-- header -->
        <%@ include file="indexheader.jsp" %>
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
				<h5 align="center">
  <%
String m=null;
m=request.getParameter("msg");
if(m!=null)
out.println(m);

%> 
	
</h5><br>
					<h3>Create account</h3>
					<p class="mt-2 mb-4">Enter your details to create account.</p>
					<form action="regform2.jsp" method="post">
						<div class="icon1">
							<input placeholder="Your Ward Number" name="wardno" type="text" pattern="\d*" required="">
						</div>
						
						<input type="submit" value="Continue">
						<p><a href="createnewunit.jsp" class="ml-2"><strong>Create a new unit</strong></a></p>
					</form>
				</div>
			</div>
			<div class="col-md-6">
				<img src="images/banner.png" alt="" class="img-fluid"/>
			</div>
		</div>
	</div>
</section>
<!-- //signin -->


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
