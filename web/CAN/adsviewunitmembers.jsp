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
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.io.*,java.util.Locale" %>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
<%@ page import="java.text.DateFormat,java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@page import="MyPack.MyDb"%>
<jsp:useBean id="lo" class="beanclass.newadsbeen"/>
<jsp:setProperty name="lo" property="*"/>
<%
    try
    {
    MyDb db = new MyDb();
    Connection con =db.getCon();
    
    PreparedStatement psmt=null,psmt1=null,psmt2=null;
    
    ResultSet rs=null,rs1=null,rs2=null;
    
    Locale locale = request.getLocale( );
	String date = DateFormat.getDateTimeInstance(
		  DateFormat.FULL, 
		  DateFormat.SHORT, 
		  locale).format(new Date( ));
							  
    Calendar cal = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String strDate = sdf.format(cal.getTime());
    
    int unitid=Integer.parseInt(request.getParameter("unitid"));
    int userid=0;
   
    
	%>
                    <h3>Unit Members</h3>
                    <h5 align="right"><a href="adsviewunitattendace.jsp?unitid=<%=unitid%>">Unit Attendance</a></h5>
                    
    </div>
   
    <div class="row bottom_grids text-center mt-5 pt-3">
	<div align="center">
            <table width="736" height="139">
            <tr>

            
              <td width="122" height="62"> <div align="left" class="style2 style3">Member ID</div></td>
              <td width="222" height="62"> <div align="left" class="style4">Name</div></td>
              <td width="191" height="62"> <div align="left" class="style4">Address</div></td>
              <td width="181" height="62"> <div align="left" class="style4">Phone</div></td>
              <td> </td>
            </tr>
             
<%
psmt=con.prepareStatement("select * from tbl_member where unitid=? and status='Verified'");
psmt.setInt(1,unitid);
rs=psmt.executeQuery();
while(rs.next())
{
userid=rs.getInt("userid");

    
%>

            <tr>
              <td height="46"> <div align="left" class="style4"><%out.print(userid);%></div></td>
              <td height="46"> <div align="left" class="style4">
                <a href="adsunitmemberdetails.jsp?userid=<%=userid%>">
                <%out.print(rs.getString("name"));%> 
                </a></div></td>
              <td height="46"> <div align="left" class="style4"><%out.print(rs.getString("address"));%></div></td>
              <td height="46"> <div align="left" class="style4"><%out.print(rs.getString("phone"));%></div></td>
              <td><a href="../process/removemember.jsp?userid=<%=userid%>&&unitid=<%=unitid%>" onClick="return fun_alert()"> Remove </a></td>
            </tr>   
                
                
            <%
}
%>
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

<script type="text/javascript">
    function fun_alert()
    {
	return confirm("Confirm your Selection");
	}
</script>
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
