<%-- 
    Document   : AdminUsers
    Created on : Dec 19, 2017, 2:05:30 PM
    Author     : Esraa
--%>

<%@page import="DBConnection.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function openForm() {
                //alert("ggggggggggggg");
                var form = document.getElementsByName("edit");
                form.style.display = "inline";
            }
            
          /*  function changepassword(){
                       
            var pass = document.getElementById("changepass").value;
            alert("pass = "+pass);
            var email = document.getElementById("useremail").value;
            alert("email = "+email);
            var xmlhttp = new XMLHttpRequest();
            
            xmlhttp.open("GET", "ChangePassword?changepass="+pass+"&useremail=" +email, true);
            xmlhttp.send();
            
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    document.getElementById("change").innerHTML="Password: "+xmlhttp.responseText;
                }
            }
        }*/
        </script>
    </head>
    <body>
        <style>
            body{
                background-color: #004d4d ;
                color: white;
            }

            .child {
                width:400px;
                height: auto;
                margin:auto;
                border:1px solid gray;
                border-radius: 20px;
                float:left;
                margin-top:20px;
                margin-right: 20px;
                margin-bottom: 20px;

            }
            button{
                width: auto;
                height: 25px;
                color: white;
                background:#008080;
                font-weight: bold;
                border-radius: 20px;
                font-size: 15px;
                margin-bottom: 15px;
                margin-top: 15px;
                float:right;
            }
            

        </style>

        <%
            ArrayList<User> users = new ArrayList<User>();
            users = (ArrayList<User>) session.getAttribute("Users");
            for (int i = 0; i < users.size(); i++) {
                User user = users.get(i);

        %>
        <div class="child">
            <span style='margin-left:15px;'>UserName:  <%=user.getName()%></span><br/>
            <span style='margin-left:15px;'>Email: <%=user.getEmail()%></span><br/>
            <span style='margin-left:15px;'>Password:      <%=user.getPassword()%></span><br/>
            <span style='margin-left:15px;'>Phone:     <%=user.getPhone()%></span><br/>
            <span style='margin-left:15px;'>Birth date:       <%=user.getBirthdate()%></span><br/>
            <span style='margin-left:15px;'>Gender:       <%=user.getGender()%></span><br/>   
            <button type="button" onclick="document.getElementById('<%=i+1%>').style.display = 'block'">Change password</button><br/>
            
            <form name="form" id="<%=i+1%>" style="display: none;" action="ChangePassword">
                <input style="background-color:whitesmoke;height: 25px;border-radius: 15px;"type="text" placeholder="  NEW Password" name="changepass" id="changepass"/><br/>
                <input style="border-radius: 15px;color: white;background:#008080;"type="submit" value="Save" />
                <input type="hidden" name="useremail" value="<%=user.getEmail()%>"/>
            </form>

        </div>

        <%
            }
        %>
    </body>
</html>
