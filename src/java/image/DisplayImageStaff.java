package  image;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import MyPack.MyDb;

public class DisplayImageStaff extends  HttpServlet{
  public void doGet(HttpServletRequest request, HttpServletResponse 
  response) throws ServletException, IOException{
  //PrintWriter pw = response.getWriter();
  
  try{  
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  MyDb db = new MyDb();
  Connection con =db.getCon(); 
  Statement st1=con.createStatement();
  String piid=request.getParameter("pid");
  int pid=Integer.parseInt(piid);

  ResultSet rs1 = st1.executeQuery("select photo from"+
   " tbl_product where pid="+pid+"");
  String imgLen="";
  if(rs1.next()){
  imgLen = rs1.getString(1);
  System.out.println(imgLen.length());
  }  
  rs1 = st1.executeQuery
  ("select photo from tbl_product where pid="+pid+"");
  if(rs1.next()){
  int len = imgLen.length();
  byte [] rb = new byte[len];
  InputStream readImg = rs1.getBinaryStream(1);
  int index=readImg.read(rb, 0, len);  
  System.out.println("index"+index);
  st1.close();
  response.reset();
  response.setContentType("photo/jpg");
  response.getOutputStream().write(rb,0,len);
  response.getOutputStream().flush();  
  }
  }
  catch (Exception e){
  e.printStackTrace();
  }
  }
}