<%-- 
    Document   : feedbackform
    Created on : Sep 25, 2018, 11:33:49 PM
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
        <form action="../process/talukfeedbackprocess.jsp" method="get">
        <h1 align="center"> Send Feedback........</h1>
   <h3 align="center">You can send messages to others.</h3>
   <table align="center">
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
                    About
                </td>
                <td>
                    <select name="pstn">
                        <option>
                            SELECT
                        </option>
                        <option value="sugsn">
                          SUGGESTION
                        </option>
                        <option value="atndnce">
                            ATTENDANCE
                        </option>
                        <option value="pdt">
                            PRODUCT
                        </option>
                        <option value="loan">
                            LOAN
                        </option>
                    </select>
                </td>
            </tr>
                
      <tr>
           <td>
             Message
           </td>
       
      
           <td>
               <textarea name="msg">

               </textarea>
           </td>
       </tr>
       <tr>
           <td>

           </td>
       </tr>
       <tr align="right">
           <td>
             <input type="submit" value="send">
           </td>
       </tr>
   </table>
   </form>
    </body>

</html>
