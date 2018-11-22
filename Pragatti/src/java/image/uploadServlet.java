package image;
import java.io.*;
import java.io.File;
import java.io.InputStream;
import java.io.FileInputStream;
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
import com.oreilly.servlet.MultipartRequest;  
import java.sql.*;
import java.sql.Connection;
import java.util.Vector;
import java.util.Iterator;
import java.util.Calendar;
import java.util.Date;

import java.util.Locale;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.sql.SQLException;
import java.sql.DriverManager;
import MyPack.MyDb;

public class uploadServlet extends  HttpServlet {  
  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
    throws ServletException, IOException {  
  
   ////////////////////////////////////////////////



        FileInputStream fis,fis1,fis2;
        PreparedStatement psmt=null,psmt1=null,psmt2=null;
        try{
        Class.forName("com.mysql.jdbc.Driver");

MyDb db = new MyDb();
  Connection con =db.getCon();         //////////////////////////////////////////////
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
MultipartRequest m=new MultipartRequest(request,"c:/pragati");  

Locale locale = request.getLocale( );
	String date = DateFormat.getDateTimeInstance(
		  DateFormat.FULL, 
		  DateFormat.SHORT, 
		  locale).format(new Date( ));
							  
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String strDate = sdf.format(cal.getTime());

String photo_name=m.getParameter("photo_name");
//String photo_name1=m.getParameter("photo_name1");

int unitid =Integer.parseInt(m.getParameter("unitid"));

String pname=(String)m.getParameter("pname");
String descri=(String)m.getParameter("descri");


//image data
File image1=new File(photo_name);
//File image2=new File(photo_name1);
ResultSet rs;

out.print("hellao");
out.print(pname+descri+image1);

           
psmt1=con.prepareStatement("insert into tbl_product(unitid,pname,descri,status,photo)"+"values(?,?,?,?,?)");
psmt1.setInt(1,unitid);
psmt1.setString(2,pname);
psmt1.setString(3,descri);
psmt1.setString(4,"Applied");
out.print("hellao");

fis=new FileInputStream(image1);
out.print("hellao");

psmt1.setBinaryStream(5, (InputStream)fis, (int)(image1.length()));

//fis1=new FileInputStream(image2);
//psmt1.setBinaryStream(21, (InputStream)fis1, (int)(image2.length()));
int res=psmt1.executeUpdate();

out.print("hellao");

response.sendRedirect("CAN/applyproducts.jsp?msg=Successfully Applied New product");

con.close();

psmt.close();

 }
        catch(ClassNotFoundException e)
        {
            e.printStackTrace();
        }
catch (SQLException e)
    {
        // do something appropriate with the exception, *at least*:
        e.printStackTrace();
    }
         catch(NullPointerException e)
        {
            e.printStackTrace();
        }
}  
}  