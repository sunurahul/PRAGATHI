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
            <h3>Send a message </h3>
    </div>
   
    <div class="row bottom_grids text-center mt-5 pt-3">
	<div align="center">

<form id="form1" name="form1" method="post" onSubmit="return validation()" action="../process/adminsendmessage.jsp">
            <table width="464" height="210">
            <tr>
                <td width="221" height="54"> <div align="left" class="style2">Message sent to </div></td>
              <td width="205"> <div align="left">
                <label>
                <select name="msgto" id="msgto" required=""> 
                  <option selected>-select-</option>
                  <option value="allmembers">ALl Members</option>
                  <option value="allads">All ADS</option>
                  <option value="allunitadmins">All unit admins</option>
                  <option value="tocds">CDS</option>
                </select>
                </label>
                <input type="hidden" name="usertype" required="" value="admin">
				<input type="hidden" name="userid" required="" value="<%out.print(usid);%>">
              </div></td>
            </tr>
            <tr>
                <td width="221" height="54"> <div align="left" class="style2">Message</div></td>
              <td width="205"> <div align="left">
                 <textarea name="message" cols="30" rows="3" id="message" required=""></textarea> 
              </div></td>
            </tr>
            <tr>
                <td height="81" colspan="2">
                    
                  <div align="center">
                    <input type="submit" name="submit" value="submit">
                  </div></td>
            </tr>
      </table>
</form>
              
</div>
    </div>
</div>
</section>
<!-- banner bottom -->

<!-- about -->
<script type="text/javascript">
    function validation()
    {
        
                
        if(document.form1.msgto.selectedIndex==0||document.form1.msgto.value=="")
      	  {
           alert("You must recepient type");
           return false;
        }       
         
        return true;
    }
	</script>
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
