<%-- 
    Document   : productrequestform
    Created on : Sep 25, 2018, 11:23:45 PM
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
        <h1 align="center">Product request Form</h1><br><br><br><br>
        <form name="form1" action="../process/hospitalreg.jsp" method="get">
            <table border="0" align="center">
                <tr>
                    <th colspan="2"> Request Product Now</th>
                </tr>
                <tr>
                    <td>
                        Group Name
                    </td>
                    <td>
                        <input type="text" name="gname">
                    </td>
                </tr>
                 <tr>
                    <td>
                        Product Name
                    </td>
                    <td>
                        <input type="text" name="pname">
                    </td>
                </tr>
                <tr>
                    <td>
                        Description
                    </td>
                    <td>
                        <input type="text" name="desc">
                    </td>
                </tr>
                <tr>
                    <td>
                       Expected Amount
                    </td>
                    <td>
                        <input type="text" name="eamnt">
                    </td>
                </tr>
                 <tr>
                    <td>
                    Date
                    </td>
                   
                    <td>
                        <select name="yr">
                            <%
                           
                    for(int i=2000;i<=2019;i++)
                        {
                        out.println("<option >"+i+"</option>");
                        }
                         %>       
                        </select>
                    
                        
                      
                   
                        <select name="month">
                            <%
                           
                    for(int i=1;i<=12;i++)
                        {
                        out.println("<option >"+i+"</option>");
                        }
                         %>       
                        </select>
                    
                        
                      
                   
                   
                        <select name="day">
                            <%
                           
                    for(int i=1;i<=31;i++)
                        {
                        out.println("<option >"+i+"</option>");
                        }
                         %>       
                        </select>
                    
                        
                      
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <input  type="submit" value="submit">
                    </td>
                </tr>
            </table>

        </form>
    </body>
</html>
