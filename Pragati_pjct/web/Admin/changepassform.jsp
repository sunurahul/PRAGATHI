<%-- 
    Document   : changepassform
    Created on : Sep 25, 2018, 10:36:57 PM
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
    <form action="../process/dmochangepass.jsp" method="post">
    
        <h1 align="center">Change Password....</h1>
        <table align="center">
            
             <tr>
                <td>
                    Username
                </td>
                <td>
                    <input type="text" name="uname">
                </td>
            </tr>
            <tr>
                <td>
                    Current password
                </td>
                <td>
                    <input type="password" name="pass">
                </td>
            </tr>
            <tr>
                <td>
                    New password
                </td>
                <td>
                    <input type="password" name="npass">
                </td>
            </tr>
            <tr>
                <td>
                    Conform password
                </td>
                <td>
                    <input type="password" name="cpass">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="submit" align="center">
                </td>
            </tr>
        </table>
   
    </form>
         </body>
</html>
