<%-- 
    Document   : FirstSearch
    Created on : Dec 19, 2017, 11:16:40 AM
    Author     : Esraa
--%>

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
            input{
                background-color:#008080;
                color: white;
                border-radius: 15px;
                width: 200px;
                height: 30px;
                margin-bottom: 30px;
                font-size: 15px;

            }
        </style>
        <form action="SearchServlet" >
        <input type="text" name="size" placeholder="Size"/>
        <input type="text" name="status" placeholder="Status"/>
        <input type="text" name="type" placeholder="Type"/>
        <input type="number" name="floor" placeholder="Floor"/>
        <input type="index"  name="area" placeholder="Area"/>
        <input type="submit" value="Search" />
        </form>
    </body>
</html>
