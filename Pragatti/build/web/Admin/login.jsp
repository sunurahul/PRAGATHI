<%-- 
    Document   : login
    Created on : Sep 25, 2018, 9:57:59 PM
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
        <form action="../process/loginadminprocess.jsp" method="get">
        <h1 align="center">LOGIN</h1>
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
                    User Type
                </td>
                <td>
                    <select name="utype">
                        <option>
                            SELECT
                        </option>
                        <option value="admin">
                           ADMIN
                        </option>
                        <option value="cds">
                            CDS
                        </option>
                        <option value="ads">
                            ADS
                        </option>
                        <option value="nhg">
                            NHG
                        </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    Password
                </td>
                <td>
                    <input type="password" name="pass">
                </td>
            </tr>
    <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="login">
                    </td>
                </tr>
        </table>
    
        </form>
    </body>
</html>
