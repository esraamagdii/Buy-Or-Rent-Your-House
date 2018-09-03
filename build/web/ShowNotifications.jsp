<%-- 
    Document   : ShowNotifications
    Created on : Dec 20, 2017, 5:29:17 PM
    Author     : Esraa
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
            body{
            background-color: #004d4d ;
            color: white;
        }
        div{
            border:2px solid gray;
            border-radius: 5px;
            width:400px;
        }
        </style>
            
        <%
         ArrayList<String> notifications=(ArrayList<String>)session.getAttribute("notifications");
         for(int i=0;i<notifications.size();i++)
         {
             String onenotification=notifications.get(i);
             %>
             <div class="notify">
                 <p><%=onenotification%></p>       
             </div>
             <%
         }
        %>
    </body>
</html>
