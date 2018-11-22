<%-- 
    Document   : viewregform
    Created on : Oct 8, 2018, 11:21:08 AM
    Author     : USER
--%>

<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="data.Dbconnection"/>

<!DOCTYPE html>
<html>
    <head>
        <jsp:setProperty name="reg" property="*"/>
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../process/updategrpprocess.jsp" method="get" name="form2">
            <table align="center">
                <tr><th colspan="2">New Registration</th></tr>
            </table>
            <table   border="1" align="center"><tr>
                    <th>Name of user</th>
                    <th>Address</th>
                    <th>Date of Birth</th>
                    <th>Adhar No</th>
                    <th>Phone No</th>
                    <th>Ward No</th>
                    <th>Group name</th>
                    <th>Accept </th>
                    <th> Reject</th>
                    
                   
                    </tr> 

                <%
                  //String qry = "SELECT * FROM `tbl_feedback` WHERE userid like 'supp%' " ;
                        String sel = "select *from tbl_registration";
                        //out.println(sel);
                        Iterator it = db.getData(sel).iterator();
                        while (it.hasNext()) {
                            Vector v = (Vector) it.next();

                %>
               
                <tr>
                    <td><% out.println(v.get(1));%></td>
                    <td><% out.println(v.get(2));%></td>
                    <td><% out.println(v.get(3));%></td>
                    <td><% out.println(v.get(4));%></td>
                    <td><% out.println(v.get(5));%></td>
                    <td><% out.println(v.get(6));%></td>
                   
                     <td><select name="grp">
                             <option>
                            SELECT
                             </option>
                            <%
                            String qry="select * from tbl_group";
                            //out.println(qry);
                            Iterator itt = db.getData(qry).iterator();
                            while (itt.hasNext()) {
                            Vector v1 = (Vector) itt.next();
                            %>
               
                        
                        <option value="mnm" id="nm">
                        <%
                            out.println(v1.get(1));
                        %>
                        </option>  
                        
                        <%
                       }
                     %>
                         </select></td>
                    
                    <td> <input type="submit" value="ACCEPT" formaction="../process/updategrpprocess.jsp"></td>
                    <td> <input type="submit" value="REJECT" formaction="../process/deleteregprocess.jsp"></td>
                    
                </tr>
                <%
                    }
                    
                %>
            </table>
        </form>
    </body>
</html>
