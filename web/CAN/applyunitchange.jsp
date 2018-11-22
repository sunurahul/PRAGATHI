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
<%@ include file="../nhgheader.jsp" %>
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
            <h3>Unit Change Application Form</h3>
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
 
    int userid=Integer.parseInt(usid);
    int wardno=Integer.parseInt(request.getParameter("wardno"));
    int unitid=Integer.parseInt(request.getParameter("unitid"));
    
    psmt=con.prepareStatement("select * from tbl_login where userid="+userid+"");
    rs=psmt.executeQuery();
    if(rs.next())
    {
        if(rs.getString("usertype").equals("ads")||rs.getString("usertype").equals("cds")||rs.getString("usertype").equals("unitadmin"))
        {
            response.sendRedirect("nhgprofile.jsp?msg=You cant change unit because you are an "+rs.getString("usertype")+"");
        }
            
    }
    
    psmt=con.prepareStatement("select * from tbl_member where userid="+userid+"");
    
    rs=psmt.executeQuery();
    if(rs.next())
    {
        
        %>
    
<form id="form1" name="form1" method="post" onSubmit="return validation()" action="../process/applyunitchange.jsp">
            <table width="464" height="168">
            <tr>
              <td width="221" height="54"> <div align="left" class="style2">Name of Applicant</div></td>
              <td width="205"> <div align="left">
                <input name="name" type="text" id="name" required=""value="<%out.print(rs.getString("name"));%>" readonly="readonly">
                <input name="userid" type="hidden" id="userid" required=""value="<%out.print(userid);%>" readonly="readonly">
                
              </td>
              </tr>
                <tr>
                  <td width="221" height="33"> <div align="left" class="style2">Select the Unit </div></td>
              <td width="205"> <div align="left">  
               
                <select name="unitid" id="unitid">
          
	  <option>-Select Your Unit-</option>
<%              String unitname=null;
                psmt=con.prepareStatement("select * from tbl_unit where wardno="+wardno+" and unitid<>"+unitid+"");
		rs=psmt.executeQuery();
		while(rs.next())
		{
		unitid=rs.getInt("unitid");
                unitname=rs.getString("unitname");
		
		
		out.println("<option value="+unitid+">"+unitname+"</option>");
		}
	
	%> 
      </select>
              </div></td>
            </tr>
            
            <tr>
                <td height="61" colspan="2">
                    
                  <div align="center">
                    <input type="submit" name="submit" value="submit">
              </div></td>
            </tr>
      </table>
</form>
              <%}
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

<!-- about -->

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
