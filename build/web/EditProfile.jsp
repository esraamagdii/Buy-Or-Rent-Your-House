<%-- 
    Document   : EditProfile
    Created on : Dec 8, 2017, 10:05:04 PM
    Author     : Esraa
--%>

<%@page import="DBConnection.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User x =new User();
    x =(User) session.getAttribute("mydata");
   
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <style>
            *{
                padding:0;
                margin:0;
                border: 0;
                font-family:sans-serif;
            }
            form{
                margin-top: 50px;
            }
            input{
                background-color:#008080;
                color: black;
                border-radius: 15px;
                width: 500px;
                height: 30px;
                margin-bottom: 30px;
                font-size: 20px;

            }
            body{
                background-color: #004d4d ;
                color:#008080;
            }
             h3{
                text-align: center;
                margin-top: 40px;
                font-family: serif;
                font-size: 30px;
                font-weight: bold;
                color: #008080;
            }
            ::-ms-input-placeholder { 
                color: white;
            }
            button{
                width: 300px;
                height: 40px;
                color: white;
                background:#008080 ;
                font-weight: bold;
                border-radius: 20px;
                font-size: 20px;
            }    
            select{
              margin-bottom: 30px; 
              width:500px;
              height: 30px;
              background-color:#008080;
              color: white;
              border-radius: 15px;
            }
            ::-ms-input-placeholder { 
                color: white;
            }
            div{
                border-radius: 20px;
                text-align: center;
                border:1px solid gray;
                background-color:#f2f2f2;           
            }
    </style>
    </head>
    <body>
        <div style="width: 600px;height:800px; margin-left:28% ;margin-top: 50px;">
    	 <h3> Edit Your Profile </h3>
         <form class="register" method="Post" action="SaveEditServlet">
            Name <input type="text" name="name" placeholder=  <%=x.getName() %>>
            <br/><br/>
            Email <input type="email" name="email" placeholder=  <%= x.getEmail()  %>>
            <br/><br/>
            Password <input type="password" name="password" placeholder=  <%= x.getPassword() %>>
            <br/><br/>
            Phone <input type="text" name="phone" placeholder=<%= x.getPhone() %> />
            <br/><br/>
            <button type="submit">Save</button>
         </form> 
        </div>
    </body>
</html>

