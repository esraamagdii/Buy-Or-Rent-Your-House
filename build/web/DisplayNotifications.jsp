<%-- 
    Document   : DisplayNotifications
    Created on : Dec 20, 2017, 6:53:34 PM
    Author     : Esraa
--%>

<%@page import="DBConnection.User"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User x = (User) session.getAttribute("mydata");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body
            {
                margin: 0;
                padding: 0;
                background: #004d4d /*#BE6219*/ ;
                font-family: arial;
            }
            .b2
            {
                margin-right: 10px;
                margin-left: 10px;
                margin-bottom: 10px;
                margin-top: 10px;
                color: white; 
                background:#008080;
                border-radius: 30px;
                border-color: white;
                font-size: 20px;
                width: auto;
                height: 40px;

            }
            input{
                background-color:#008080;
                color: black;
                border-radius: 15px;
                width: 250px;
                height: 30px;
                margin-bottom: 30px;
                margin-left: 10px;
                font-size: 20px;
            }
            .head
            {
                display: flex;
            }
            select
            {
                background-color:#008080;
                color: black;
                margin-top: 15px;
                margin-left: 10px;
                border-radius: 15px;
                width: 500px;
                height: 30px;
                margin-bottom: 30px;
            }
            /*******************************************************************/
            .ad1
            {
                width: 300px;
                height: auto;
                background: #eeeeee;
                margin: auto;
                border-radius: 5px;
                float: right;
                margin-top: 15px;
                margin-right: 15px;
            }
            .ad-name 
            {
                width: 100%;
                height: 8%;
                background: #008080;
                border-radius: 2px;
                text-align: center;
            }
            .cover-s {
                height: 165px;
                width: 100%;
                float: right;
            }
            .cover-s img {
                height: 165px;
                width: 100%;
                float: right;
            }

            .box-txt {
                margin-left: 5px;
                margin-right: 5px;
                width: auto;
                height: auto;
            }
            .box-txt b
            {
                font: 12px Tahoma, Geneva, sans-serif;
                color: #359ff1;
            }
            .box-txt p
            {
                font: 11px Tahoma, Geneva, sans-serif;
                margin-top: 5px;
                position: relative;
                width: auto;
                height: auto;
            }
            .link-view
            {
                width: 100%;
                height: 40px;
                background: #dadada;
                float: left;
                top:   0; 
                position : relative;
                align-items: center;
                display: flex;
            }
        </style>
    </head>
    <body>
        <div>  

            <div class="head">
                <br/><br/>
                <form action="addToDashbord">
                <select name="item">
                    <option value=""> Add To Dashboard  </option>
                    <option value="floor"> FLoor </option>
                    <option value="location"> Location </option>
                    <option value="size"> Size </option>
                    <option value="status"> Status </option>
                    <option value="type"> Type </option>

                </select> 
                    <input type="text" name="value" required="required">
                    <input type="submit" value="Add" class="b2">
                </form>
                <br/><br/> 
            </div> 

            <% for (int i = 0; i < x.notification.size(); i++) { %>
           <div class="ad1">
                <div class="ad-name">Location : <%=x.notification.get(i).getLocation()%>  </div>

                <div class="cover-s">
                    <%
                        byte[] p = Base64.getEncoder().encode(x.notification.get(i).AdvertisePics.get(0));
                        String img = new String(p);
                        String image = "data:image/jpg;base64," + img;
                    %>
                    <img src=<%=image%>/>
                </div>

                <!--cover-s-->
                <div class="box-txt"> 
                    <b>Description  </b>
                    <p> 
                        <%= x.notification.get(i).getDescription()%>     
                    </p>
                    <b>Size </b>
                    <p>
                        <%= x.notification.get(i).getSize()%>
                    </p>
                    <b>Floor </b>
                    <p>
                        <%= x.notification.get(i).getFloor()%>
                    </p>
                    <b>Status </b>
                    <p>
                        <%= x.notification.get(i).getStatus()%>
                    </p>
                    <b>Contact </b>
                    <p>
                        <%= x.notification.get(i).getContact()%>
                    </p>
                    <b>Type </b>
                    <p>
                        <%= x.notification.get(i).getType()%>
                    </p>


                </div>
                <!--box-txt-->

                <div class="link-view">
                    <form action="RemoveNotification"> 
                        <input type="hidden" name="index" value=<%= i%> > 
                        <input type="submit" value="Remove" class="b2">
                    </form>
                </div> 
            </div>

            <%}%>     

        </div>

    </body>
</html>
