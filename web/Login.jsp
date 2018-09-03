<%-- 
    Document   : Login
    Created on : Dec 6, 2017, 2:21:48 AM
    Author     : Esraa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        function validate() {
            var useremail = document.form.email.value;
            var password = document.form.password.value;
            if (useremail == "") {
                alert("Enter UserEmail!");
                return false;
            }
            if (password == "") {
                alert("Enter Password!");
                return false;
            }
            return true;
        }
    </script>
    <body>
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
                margin-bottom: 30px;
                font-size: 20px;

            }
            body{
                background-color:#004d4d ;
                color: white;
            }
            form{
                margin-top: 50px;
            }
            h3{
                text-align: center;
                margin-top: 90px;
                font-family: serif;
                font-size: 30px;
                font-weight: bold;
                color: #000000;
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
            ::-ms-input-placeholder { 
                color: white;
            }
            div{
                border-radius: 20px;
                text-align: center;
                border:1px solid gray;
                background-color: #f2f2f2;           
            }
             h3{
                text-align: center;
                margin-top: 40px;
                font-family: serif;
                font-size: 30px;
                font-weight: bold;
                color: #008080;
            }
        </style>

        <div style="width: 600px;height:500px; margin-left:28% ;margin-top: 100px;">
            <h3>Login Form</h3>
            <form method="post" action="LoginServlet" onsubmit="javascript:return validate();">
                <input type="email" name="email" title="Email" placeholder=" Email"/>
                <br/><br/>
                <input type="password" name="password" placeholder=" Password"/>
                <br/><br/>
                <button type="submit">Login</button>
            </form>
        </div>
    </body>
    
</html>
