<%-- 
    Document   : addattendanceform
    Created on : Sep 25, 2018, 10:50:00 PM
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
        <h1 align="center">Attendance Register</h1><br><br><br><br>
        <form name="form1" action="../process/hospitalreg.jsp" method="get">
            <table border="0" align="center">
                <tr>
                    <th colspan="2"> ADD ATTENDANCE NOW</th>
                </tr>
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <input type="text" name="name">
                    </td>
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
                        Date
                    </td>
                    <td>
                        <input type="text" name="date">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        Attendance Status
                    </td>
                    <td>
                        <input type="radio" value="present" name="abc">PRESENT<br>
                         <input type="radio" value="absent" name="abc">ABSENT

                    </td>
                </tr>
               
                <tr>
                    <td colspan="2" align="center">
                        <input  type="submit" value="ADD">
                    </td>
                </tr>
            </table>

        </form>
    </body>
</html>
