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

	    <table width="685" height="196" border="0">
                <tr><td colspan="2" align="center"> 
                    		<h5 align="left">
<%
String m=null;
m=request.getParameter("msg");
if(m!=null)
out.println(m);

%> </h5><br></td></tr>
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
	
	int wardno=Integer.parseInt(request.getParameter("wardno"));
        int userid=Integer.parseInt(request.getParameter("ads_id"));
        psmt=con.prepareStatement("select * from tbl_login where userid="+userid+" and usertype='cds'");
        rs=psmt.executeQuery();
        if(rs.next())
        {
           response.sendRedirect("updateads.jsp?msg=The selected Member is an CDS so cant proceed"); 
        }
       
	%>
          <tr>
            <td height="50" colspan="5"><div align="center" class="style10">NEW ADS For </div></td>
          </tr>
          <tr>
            <td height="48">Ward No </td>
            <td colspan="4"><label><span class="icon2">
              <input type="text" name="wardno" readonly="readonly" value="<%out.print(wardno);%>">
            </span></label></td>
          </tr>
          <tr>   
        <td width="197"><span class="style14">Member Id </span></td>
        <td width="197"><span class="style14">Member Name </span></td>
        <td width="197"><span class="style14">Address </span></td>
        <td width="197"><span class="style14">Phone</span></td>
        <td width="197"><span class="style14">   </span></td>
      </tr>
<%
  psmt=con.prepareStatement("select * from tbl_member where wardno=? and status='Verified'");
  psmt.setInt(1,wardno);
  rs=psmt.executeQuery();
  while(rs.next())
  {
      psmt1=con.prepareStatement("select * from tbl_login where usertype='unitadmin' and userid=?");
      psmt1.setInt(1,rs.getInt("userid"));
      rs1=psmt1.executeQuery();
      if(rs1.next())
      {
      int uss=rs.getInt("userid");    

%>
              
          <tr>
        <td><span class="icon1">
          <%out.print(rs.getInt("userid"));%>
        </span></td>
        <td><span class="icon1">
          <%out.print(rs.getString("name"));%>
        </span></td>
        <td><span class="icon1">
          <%out.print(rs.getString("address"));%>
        </span></td>
        <td><span class="icon1">
          <%out.print(rs.getString("phone"));%>
        </span></td>
        <td><span class="icon1"> <a href="../process/updateads.jsp?userid=<%=uss%>&&wardno=<%=wardno%>"  onClick="return fun_alert()" >Select</a> </span></td>
        
      </tr>
		  <%
    }}}
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
<script type="text/javascript">
    function fun_alert()
    {
	return confirm("Confirm your Selection");
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
