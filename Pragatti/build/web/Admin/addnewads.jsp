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
.style10 {
	font-size: 110%;
	color: #0033FF;
	font-weight: bold;
}
.style11 {color: #333333}
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

	<form name="form1" method="get" onSubmit="return validation()" action="addnewads2.jsp">
	    <table width="685" height="255" border="0">
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
    ResultSet rs=null;
	
	%>
          <tr>
            <td height="57" colspan="2"><div align="center" class="style10 style11"> <%
String m=null;
m=request.getParameter("msg");
if(m!=null)
out.println(m);

%> </div></td>
          </tr>
		  <tr>
            <td height="50" colspan="2"><div align="center" class="style10">ADD NEW ADS TO A WARD </div></td>
          </tr>
          <tr>
            <td height="48">Select Ward No </td>
            <td><label><span class="icon2">
              <select name="wardno" id="wardno">
                <option>-Select Your Unit-</option>
                <%              
		String unitname=null;
		int unitid=0;
		psmt=con.prepareStatement("select * from tbl_ads where ads_id=0");
		rs=psmt.executeQuery();
		while(rs.next())
		{
		
		
		
		out.println("<option value="+rs.getInt("wardno")+">"+rs.getInt("wardno")+"</option>");
		}
	
	%>
              </select>
            </span></label></td>
          </tr>
          
          <tr>
            <td height="44" colspan="2"><div align="center">
              <label>
              <input type="submit" name="Submit" value="Submit">
              </label>
            </div></td>
          </tr>
		  <%
    }
 catch(Exception e)
    {
        e.printStackTrace();
    }
    %>
        </table>
		</form>
	  </div>
	</div>
</section>
<!-- //banner -->

<!-- banner bottom -->

<!-- //footer -->

<!-- copyright -->
<script type="text/javascript">
    function validation()
    {
        
                
        if(document.form1.wardno.selectedIndex==0||document.form1.wardno.value=="")
      	  {
           alert("You must Select a Ward Number");
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
