<%-- 
    Document   : updategrpprocess
    Created on : Oct 8, 2018, 2:02:39 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:useBean id="dbc" class="data.Dbconnection"/>
        <jsp:useBean id="gr" class="beanclass.viewregbean"/>
        <jsp:setProperty name="gr" property="*"/>
        <jsp:useBean id="hr" class="beanclass.registration"/>
        <jsp:setProperty name="hr" property="*"/>
    </head>
    <body>
        <% 
      
        String qry="update tbl_registration set grpname='"+gr.getNm()+"' ";
        
        if (dbc.putData(qry) > 0)
        {
            response.sendRedirect("../Admin/home_admin.jsp");
        }
        else
                       {
         response.sendRedirect("../CAN/regform.jsp");
        }
        %>
    </body>
</html>
