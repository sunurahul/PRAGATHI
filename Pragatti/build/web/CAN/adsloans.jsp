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
    <div class="heading">
 <h5 align="left">
<%
String m=null;
m=request.getParameter("msg");
if(m!=null)
out.println(m);

%> </h5><br>       
            <h3>Applied Loans</h3>
    </div>
   
    <div class="row bottom_grids text-center mt-5 pt-3">
	<div align="center">
            <table width="812" height="111">
            <tr>
                <td width="87" height="50"> Loan ID</td>
                <td width="141" height="50"> Loan Amount</td>
                <td width="148" height="50"> Requestd Date</td>
                <td width="130" height="50"> Applicant Name</td>
                <td> </td>
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
    int userid=Integer.parseInt(usid);
    int wardno=0,loanid=0,uid=0;
    psmt=con.prepareStatement("select * from tbl_ads where ads_id=?");
    psmt.setInt(1,userid);
    rs=psmt.executeQuery();
    if(rs.next())
    {
        wardno=rs.getInt("wardnO");
    }
    psmt=con.prepareStatement("select * from tbl_loans where status='Applied'");
    rs=psmt.executeQuery();
    while(rs.next())
    {	loanid=rs.getInt("loanid");
		uid=rs.getInt("userid");
        psmt1=con.prepareStatement("select * from tbl_member where userid=? and wardno=?");
        psmt1.setInt(1,uid);
        psmt1.setInt(2,wardno);
        rs1=psmt1.executeQuery();
        if(rs1.next())
        {      
        
        %>

            <tr>
                <td height="53"> <%out.print(rs.getInt("loanid"));%> </td>
                <td> <%out.print(rs.getInt("loanamt"));%> </td>
                <td> <%out.print(rs.getString("reqdate"));%> </td>
                <td> <a href="adsunitmemberdetails.jsp?userid=<%=uid%>">
                <%out.print(rs1.getString("name"));%> 
                </a></td>
                <td> <a href="../process/adsverifyloan.jsp?loanid=<%=loanid%>" onClick="retur fun_alert()">Verify</a> &nbsp;&nbsp;&nbsp;&nbsp;  <a href="../process/adsrejectloan.jsp?loanid=<%=loanid%>" onClick="return fun_alert()">Reject</a> </td>
                
                
            </tr>
      </table>

              <%}}
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
<script type="text/javascript">
    function fun_alert()
    {
	return confirm("Confirm your Selection");
	}
</script>
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

