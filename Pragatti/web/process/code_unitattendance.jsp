<%-- 
    Document   : regprocess
    Created on : Sep 30, 2018, 1:03:40 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
    </head>
    <body>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.io.*,java.util.Locale" %>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
<%@ page import="java.text.DateFormat,java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@page import="MyPack.MyDb"%>
<jsp:useBean id="lo" class="beanclass.applyloan"/>
<jsp:setProperty name="lo" property="*"/>
<%
    try
    {
    MyDb db = new MyDb();
    Connection con =db.getCon();
    
    PreparedStatement psmt=null,psmt1=null,psmt2=null; 
    ResultSet rs=null,rs1=null,rs2=null;
    int res=0,res1=0,res2=0;
    
    Locale locale = request.getLocale( );
    String date = DateFormat.getDateTimeInstance(
                              DateFormat.FULL, 
                              DateFormat.SHORT, 
                              locale).format(new Date( ));

    Calendar cal = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String strDate = sdf.format(cal.getTime());
    
    
    int crate=0;
    String datee=(String)request.getParameter("datee");
    String place=(String)request.getParameter("place");
    int unitid=Integer.parseInt(request.getParameter("unitid"));
    String attid[]=new String[20];
    int amtid[]=new int[20];
    int lamtid[]=new int[20];
    
    //out.print(datee+place+unitid);
    int i=0,flag=1,userid=0;
    psmt=con.prepareStatement("select * from tbl_unitmeetings where unitid=? and date=?");
    psmt.setInt(1,unitid);
    psmt.setString(2,datee);
    rs=psmt.executeQuery();
    if(rs.next())
    {   flag=0;
        response.sendRedirect("../CAN/unitattendance.jsp?msg=Attendance already taken in this day");
    }
    if(flag==1)
    {
       
        psmt1=con.prepareStatement("insert into tbl_unitmeetings(unitid,date,place)"+"values(?,?,?)");
        psmt1.setInt(1,unitid);
        psmt1.setString(2,datee);
        psmt1.setString(3,place);
        res1=psmt1.executeUpdate();

        psmt=con.prepareStatement("select * from tbl_member where unitid=? and status='Verified'");
        psmt.setInt(1,unitid);
        rs=psmt.executeQuery();
        while(rs.next())
        {   out.print("hello");
            userid=rs.getInt("userid");
            attid[i]=(String)request.getParameter("at"+userid);
            amtid[i]=Integer.parseInt(request.getParameter("amt"+userid));
            
            psmt1=con.prepareStatement("select * from tbl_unitmeetings where unitid=? order by mid desc limit 1");
            psmt1.setInt(1,unitid);
            out.print("hello");
            rs1=psmt1.executeQuery();

            if(rs1.next())
            {   out.print("hello");
                psmt1=con.prepareStatement("insert into tbl_attendance(mid,userid,attendance,pay_amt)"+"values(?,?,?,?)");
                psmt1.setInt(1,rs1.getInt("mid"));
                psmt1.setInt(2,rs.getInt("userid"));
                psmt1.setString(3,attid[i]);
                psmt1.setInt(4,amtid[i]);
                res1=psmt1.executeUpdate();
            }
// here to update payment status...
          
            psmt1=con.prepareStatement("update tbl_mempayment set totpay=totpay+? where userid=?");
            psmt1.setInt(1,amtid[i]);
            psmt1.setInt(2,rs.getInt("userid"));
            res1=psmt1.executeUpdate();
//loan payment if user exists  ..
            psmt1=con.prepareStatement("select * from tbl_loans where userid=? and status='Repayment Pending'");
            psmt1.setInt(1,userid);
            rs1=psmt1.executeQuery();
            if(rs1.next())
            {   
                int duebal=rs1.getInt("duepayment");
                int lid=rs1.getInt("loanid");
                String approvedate=rs1.getString("approvedate");
                Date apdate=sdf.parse(approvedate);
                
                lamtid[i]=Integer.parseInt(request.getParameter("lamt"+userid));
                
                if(duebal==lamtid[i])
                    {
                    psmt2=con.prepareStatement("update tbl_loans set duepayment=0,status='Closed' where loanid="+lid+"");
                    res2=psmt2.executeUpdate();
                    }
                else
                    {
                    psmt2=con.prepareStatement("update tbl_loans set duepayment=duepayment-? where loanid="+lid+"");
                    psmt2.setInt(1,lamtid[i]);
                    res2=psmt2.executeUpdate();    
                    }
                
                psmt2=con.prepareStatement("insert into tbl_loanpayment(loanid,amount,dateofpay)"+"values(?,?,?)");
                psmt2.setInt(1,lid);
                psmt2.setInt(2,lamtid[i]);
                psmt2.setString(3,strDate);
                res2=psmt2.executeUpdate();
                
            }
            
  //end of lona payment           
        i++;
        }    
    }
    
    response.sendRedirect("../CAN/unitattendance.jsp?msg=Attendance SUccessfully updated");
    
  
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%> 

    </body>
</html>
