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
        <script type="text/javascript">
            function photo_path(input)
            {
                
                if (input.files && input.files[0]) {
                        var reader = new FileReader();
                         reader.onload = function (e) {
						  var image=new Image();
						 image.src=e.target.result;
						 
						 image.onload = function () {
                    var height = this.height;
                    var width = this.width;
                    
                    return true;
                };
                           document.getElementById('img1').src=e.target.result;
                           
                  }
                reader.readAsDataURL(input.files[0]);
    }
               var filePath = document.getElementById('photo').value;
               // alert(filePath);
               var url = filePath.replace("C:\\fakepath\\", "C:\\pragati\\");
                
                 document.getElementById("photo_hidden").value=url;
                   
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
        <!-- header -->
<%@ include file="../unitadminheader.jsp" %>
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
            <h3>Apply for Product </h3>
    </div>
   
    <div class="row bottom_grids text-center mt-5 pt-3">
	<div align="center">
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
    
    int unitid=0,ussid=0;
    psmt1=con.prepareStatement("select * from tbl_login where username='"+unam+"'");
    rs1=psmt1.executeQuery();
    if(rs1.next())
    {
        ussid=rs1.getInt("userid");
    }
    psmt=con.prepareStatement("select * from tbl_member where userid=?");    
    psmt.setInt(1,ussid);
    rs=psmt.executeQuery();
    if(rs.next())
    {
    unitid=rs.getInt("unitid");
    }
    
	%>
<form id="form1" name="form1" method="post" enctype="multipart/form-data" onSubmit="return validation()" action="../go">
            <table width="464" height="254">
            <tr>
                <td width="221" height="54"> <div align="left" class="style2">Product Name </div></td>
              <td width="205"> <div align="left">
                <input type="text" name="pname" required=""> 
                <input type="hidden" name="unitid" required="" value="<%out.print(unitid);%>">
              </div></td>
            </tr>
            <tr>
                <td height="119"> <div align="left" class="style2">Product Description </div></td>
                <td> <div align="left">
                  <textarea name="descri" cols="25" rows="2" required=""></textarea>
              </div></td> <td width="2"></td>
            </tr>
            <tr>
                <td> <div align="left" class="style2">Upload Photo </div></td>
                <td> <div align="left">
                  <input type="file"  id="photo" name="photos" onChange="photo_path(this)" required="" />
                  <input type="hidden" name="photo_name" id="photo_hidden"/>
              </div></td>
            </tr>
            <tr>
                <td colspan="2">
                    
                  <div align="center">
                    <input type="submit" name="submit" value="submit">
                  </div></td>
            </tr>
      </table>
</form>
              <%
    }
    
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
