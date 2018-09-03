<%-- 
    Document   : Advertise
    Created on : Dec 6, 2017, 2:20:02 PM
    Author     : Esraa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
              *{
                padding:0;
                margin:0;
                border: 0;
                font-family:sans-serif;
            }
              input{
                background-color:#008080;
                color: white;
                border-radius: 15px;
                width: 500px;
                height: 40px;
                font-size: 20px;

            }
               body{
                background-color: #004d4d ;
                color: white;
            }
            h3{
                text-align: center;
                margin-top: 60px;
                font-family: serif;
                font-size: 30px;
                font-weight: bold;
                color:#008080;
            }
             form{
                text-align: center;
                margin-top: 30px;
            }
           .button1{
                width: 230px;
                height: 40px;
                color: white;
                background:#008080;
                font-weight: bold;
                margin-right: 270px;
                border-radius: 20px;
                font-size: 20px;
                
                
            }
            .button2{
                width: 230px;
                height: 40px;
                color: white;
                margin-left:250px;
                background:#008080;
                font-weight: bold;
                border-radius: 20px;
                font-size: 20px;
                margin-top: 1px;
                
                
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
    <body>
        <div style="width: 600px;height:500px; margin-left:28% ;margin-top: 100px;">
            <h3>Add Advertise Login</h3>
        <form action="AdvertiseServlet">
            <input type="email" name="useremail" placeholder=" Email" style="margin-bottom: 30px;"/><br/><br/>
           <input type="password" name="userpassword" placeholder=" Password" style="margin-bottom: 30px;"/><br/><br/>
            <input class="button1" type="submit" value="Login" >
            <a href="Register.jsp"><input class="button2" type="button" value="Register now"></a>
        </form>
        </div>
    </body>
</html>
