<%-- 
    Document   : Register
    Created on : Dec 6, 2017, 2:23:00 AM
    Author     : Esraa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function validate()
            {
       
                if (document.myForm.name.value === "")
                {
                    alert("Please provide your name!");
                    document.myForm.name.focus();
                    return false;
                }

                if (document.myForm.email.value === "")
                {
                    alert("Please provide your Email!");
                    document.myForm.email.focus();
                    return false;
                }
                if (document.myForm.password.value.length < 8) {
                    alert("your password length must be 8 at least!");
                    document.myForm.password.focus();
                    return false;
                }

                if (document.myForm.phone.value === "")
                {
                    alert("Please provide a phone number.");
                    document.myForm.phone.focus();
                    return false;
                }
                if (isNaN(document.myForm.phone.value)) {
                    document.getElementById("phone").innerHTML = "Enter valid phone number";
                    return false;
                }

                if (document.myForm.birth.value === "")
                {
                    alert("Please provide your birthdate!");
                    document.myForm.birth.focus();
                    return false;
                }

                return(true);
                cosole.log("nnnnn");
            }
            function checkname(){
                       
            var name = document.getElementById("name").value;
            var xmlhttp = new XMLHttpRequest();
            
            xmlhttp.open("GET","RegisterServlet?name="+name,true);
            xmlhttp.send();
            
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    
                    //alert("reponse = " + xmlhttp.responseText);
                    document.getElementById("checkname").innerHTML = xmlhttp.responseText;
                }
            }
        }
            
        </script>
        
    </head>
    <body>
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
                color: white;
                border-radius: 15px;
                width: 500px;
                height: 40px;
                margin-bottom: 30px;
                font-size: 15px;

            }
            body{
                background-color: #004d4d ;
                color: white;
            }
            h3{
                text-align: center;
                margin-top: 40px;
                font-family: serif;
                font-size: 30px;
                font-weight: bold;
                color: #008080;
            }
            button{
                width: 300px;
                height: 40px;
                color: white;
                background:#008080;
                font-weight: bold;
                border-radius: 20px;
                font-size: 15px;
            }
            select{
              margin-bottom: 30px; 
              width:500px;
              height: 30px;
              background-color:#008080;
              color: white;
              border-radius: 15px;
              font-size: 15px;
              
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
        <div style="width: 700px;height:auto; margin-left:28% ;margin-top: 30px;">
        <h3> Registration Form </h3>
        <form class="register" method="Post" action="RegisterServlet" name="myForm" onsubmit="return(validate());">
            <input type="text" id="name" name="name" placeholder=" Name" onkeyup="checkname()"/>
            <p id="checkname" style="color:red"> </p>
            <br/><br/>
            <input type="email" name="email" placeholder=" Email"/>
            <br/><br/>
            <input type="password" name="password" placeholder=" Password"/>
            <br/><br/>
            <input type="text" name="phone" placeholder=" Phone Number"/><br>
            <span style="color:red;" id="phone"></span>
            <br/><br/>
            <select name="item">
                <option value="empty"> Select your gender</option>
                <option value="Female"> Female</option>
                <option value="Male"> Male</option>
            </select>
            <br/><br/>
            <input type="text" name="birth" placeholder=" Birth date"/>
            <br/><br/>
            <font color="#000000">Enter Code</font><span id="txtCaptchaDiv" style="background-color:#000000;border-radius:2px;color:#FFF;padding:5px;width:200px;"></span>
            <input type="hidden" id="txtCaptcha" />
            <input type="text" style="width:200px;"name="txtInput" id="txtInput" size="15" />
            <button  onclick = "return checkform();" > submit </button>

            <button type="submit">SignUp</button>

        </form>
        </div>
        
        <script>
            function checkform() {
                var message = "";

                if (document.getElementById("txtInput").value == "") {
                    message += "Must Verfiy Code.\n";
                }
                if (document.getElementById("txtInput").value != "") {
                    if (ValidCaptcha(document.getElementById("txtInput").value) == false) {
                        message += "Invalid Code.\n";
                    }
                    
                    else 
                    {
                      message += "valid Code.\n";
                    }
                }
                if (message != "") {
                    alert(message);
                    return false;
                }          
            }

            //Generates the captcha function
            var a = Math.ceil(Math.random() * 9) + '';
            var b = Math.ceil(Math.random() * 9) + '';
            var c = Math.ceil(Math.random() * 9) + '';
            var d = Math.ceil(Math.random() * 9) + '';
            var e = Math.ceil(Math.random() * 9) + '';

            var code = a + b + c + d + e;
            document.getElementById("txtCaptcha").value = code;
            document.getElementById("txtCaptchaDiv").innerHTML = code;

            // Validate the Entered input aganist the generated security code function
            function ValidCaptcha() {
                var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
                var str2 = removeSpaces(document.getElementById('txtInput').value);
                if (str1 == str2) {
                    return true;
                } else {
                    return false;
                }
            }

            // Remove the spaces from the entered and generated code
            function removeSpaces(string) {
                return string.split(' ').join('');
            }
            
            
            
            </script>
    </body>
</html>
