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
            <h3>Todays Attendance</h3>
    </div>
   
    <div class="row bottom_grids text-center mt-5 pt-3">
	<div align="center">
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
<form id="form1" name="form1" method="post" onSubmit="return validation()" action="../process/code_unitattendance.jsp">
            <table width="967" height="311">
            <tr>
              <td width="194" height="54"> <div align="left" class="style2">Date</div></td>
              <td colspan="3"> <div align="left">
                <input type="text" name="datee" required="" value="<%out.print(strDate);%>"> 
                <input type="hidden" name="unitid" required="" value="<%out.print(unitid);%>">
              </div></td>
            </tr>
            
            <tr>
              <td width="194" height="54"> <div align="left" class="style2">Place of meeting</div></td>
              <td colspan="3"> <div align="left">
                <input type="text" name="place" required="" > 
              </div></td>
            </tr>
            
            
            <tr>
              <td height="96"> <div align="left" class="style2">Member Name </div></td>
                <td width="186"> <div align="left">
                  Attendance
              </div></td> 

              <td width="293"> <div align="left">
                  Amount
              </div></td> 
			  <td width="293"> <div align="left">
                 Loan Repayment Amount
              </div></td> 
            </tr>
<%
                int userid=0;
psmt=con.prepareStatement("select * from tbl_member where unitid=? and status='Verified'");
psmt.setInt(1,unitid);
rs=psmt.executeQuery();
while(rs.next())
{
userid=rs.getInt("userid");
psmt1=con.prepareStatement("select * from tbl_loans where userid=? and status='Repayment Pending'");
psmt1.setInt(1,userid);
rs1=psmt1.executeQuery();

    
%>

            <tr>
              <td height="46"> <div align="left" class="style2"><%out.print(rs.getString("name"));%></div></td>
                
                <td> <div align="left">
                 
                            <input name="at<%out.print(userid);%>" type="radio" value="Present"  required=""/>   Present
                <input name="at<%out.print(userid);%>" type="radio" value="Abssent" />    Absent
              </div></td>
              
              
              <td> <div align="left">
                 
                      <input name="amt<%out.print(userid);%>" type="text" pattern="\d*" required=""/>
                      
              </div></td>
              <% if(rs1.next()){ %>
              <td width="274"><input name="lamt<%out.print(userid);%>" type="text" pattern="\d*" required=""/> </td>
             <%} %>
            </tr>
            <%
}
%>
            <tr>
                <td height="47" colspan="4">
                    
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
