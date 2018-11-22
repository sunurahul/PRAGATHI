/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author admin
 */
/*package connectionclass;*/
       import java.sql.Connection;
       import java.sql.DriverManager;
       import java.sql.ResultSet;
       import java.sql.ResultSetMetaData;
       import java.sql.Statement;
       import java.util.Vector;
public class Dbconnection
{
    private ResultSetMetaData rsm=null;
    private Connection con=null;
    private Vector rowData=null;
    private Statement st=null;
    private ResultSet rs=null;
    public Dbconnection()
    {
        try
        {
            if(con==null)
            {
                Class.forName("com.mysql.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mysql://localhost:3306/pragati","root","");
                st=con.createStatement();
            }
        }
        catch(Exception er)
        {
            System.out.println(">>>>>"+er);
        }
    }
    public int putData(String qry)
    {
        try
        {
            return st.executeUpdate(qry);
        }
        catch(Exception e)
        {
            System.out.println("access faild"+e);
        }
        return 0;
    }

    public Vector getData(String qry)
    {
        try
        {
            rowData=new Vector();
            rs=st.executeQuery(qry);
            rsm=rs.getMetaData();
            int colCount=rsm.getColumnCount();
            while(rs.next())
            {
                Vector colVector=new Vector();
                for(int i=0;i<colCount;i++)
                {
                colVector.add(rs.getString((i+1)));
                }

            rowData.add(colVector);

            //return rowData;
            }
        }
        catch(Exception e)
        {
            System.out.println("acess failed..");
        }
        return rowData;
    }
}