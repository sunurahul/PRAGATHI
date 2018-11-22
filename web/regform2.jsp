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
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="MyPack.MyDb"%>
<jsp:useBean id="lo" class="beanclass.regbeen"/>
<jsp:setProperty name="lo" property="*"/>
<%
    try
    {
    MyDb db = new MyDb();
    Connection con =db.getCon();
    
    PreparedStatement psmt=null,psmt1=null; 
    ResultSet rs=null;
    
    
    int wardno=Integer.parseInt(lo.getwardno());
    psmt=con.prepareStatement("select * from tbl_unit where wardno=? and status='Verified'");
    psmt.setInt(1,wardno);
    rs=psmt.executeQuery();
    if(rs.next())
        {
            ;
        }
    else
    {
        response.sendRedirect("regform.jsp?msg=No Unit in this Ward Number");
    }
    
%>
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

%> </h5><br>				
					<h3>Create account</h3>
					<p class="mt-2 mb-4">Enter your details to create account.</p>
                                        <form name="form1" id="form1" action="process/regprocess.jsp" method="post" onSubmit="return validation()">
						<div class="icon1">
							<input placeholder="Full Name" name="name" type="text" required="">
						</div>
						<div class="icon1">
							<input placeholder="Address" name="address" type="text" required="" >
						</div>
                                            <div class="icon2">
                                                <input  placeholder="DOB" name="dob" type="text" required="" >
						</div>
                                            <div class="icon2">
							<input  placeholder="Aadhar number" name="aadharno" type="text" required="" >
						</div>
                                            
                                            <div class="icon2">
							<input  placeholder="Phone number" name="phone" type="text" required="">
						</div>
                                            <div class="icon2">
							<input  placeholder="Ward number" name="wardno" type="text" value="<%out.print(wardno);%>" readonly="readonly">
						</div>
                                            
                                            <div class="icon2">
							<select name="unitname" id="unitname">
          
	  <option>-Select Your Unit-</option>
<%              String unitname=null;
                int unitid=0;
                psmt=con.prepareStatement("select * from tbl_unit where wardno=?");
		psmt.setInt(1,wardno);
		rs=psmt.executeQuery();
		while(rs.next())
		{
		unitid=rs.getInt("unitid");
                unitname=rs.getString("unitname");
		
		
		out.println("<option value="+unitid+">"+unitname+"</option>");
		}
	
	%> 
      </select>
						</div>
      <div class="icon2">
                    <input  placeholder="Username" name="username" type="text" required="">
            </div>
        <div class="icon2">
                    <input  placeholder="Password" name="password" type="password" required="">
            </div>

        <div class="icon2">
                    <input  placeholder="Confirm Password" name="cpassword" type="password" required="">
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
        <%
    }
 catch(Exception e)
    {
        e.printStackTrace();
    }
    %>
</section>
<!-- //signin -->
<!-- footer -->
<script type="text/javascript">
    function validation()
    {
         var dat = new Date;
	var mn=dat.getMonth()+1;
	var dy=dat.getDate();
	var yr=dat.getFullYear();
	
       
	if(!(document.form1.name.value.match(/^[a-zA-Z ]+$/)))
        {
            alert("You must enter alphabets only");
            return false;
        }
        var returnval=false;
if(!document.form1.dob.value.match(/^\d{2}([./-])\d{2}\1\d{4}$/))
{
alert("You must enter your date of birth correctly like dd/mm/yyyy");
return false;
}
else
{
	var dayfield=document.form1.dob.value.split("/")[0];
	var monthfield=document.form1.dob.value.split("/")[1];
	var yearfield=document.form1.dob.value.split("/")[2];
	var dayobj = new Date(yearfield, monthfield-1, dayfield);


	if ((dayobj.getMonth()+1!=monthfield)||(dayobj.getDate()!=dayfield)||(dayobj.getFullYear()!=yearfield))
                {
                alert("Invalid Day, Month, or Year range detected. Please correct and submit again.");
                return false;
                }
	if ((yearfield>yr)||((yearfield==yr) && (monthfield>mn)) || ((yearfield==yr) && ( monthfield==mn) && ( dayfield>dy)))
                {
                alert("Date of birth must be a past date");
                return false;
                }

}
if(isNaN(document.form1.aadharno.value))
		{
			alert("You must enter Aadhar number in numbers");
			return false;
		}
	if(!document.form1.aadharno.value.match(/^\d{12}$/))
		{
			alert("YAadhar have 12 digits");
			return false;
		}

if(isNaN(document.form1.phone.value))
		{
			alert("You must enter mobile number in numbers");
			return false;
		}
	if(!document.form1.phone.value.match(/^\d{10}$/))
		{
			alert("You must enter your mobile number in 10 digits");
			return false;
		}
                
                
        if(document.form1.unitname.selectedIndex==0||document.form1.unitname.value=="")
      	  {
           alert("You must Select a unit");
           return false;
        }         
		if(document.form1.username.value=="")
        {
            alert("You must  enter username");
            return false;
        }
		if(document.form1.password.value=="")
        {
            alert("you must enter password");
            return false;
        }
        if(document.form1.password.value!=document.form1.cpassword.value)
        {
            alert("Password Mismatchd");
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
