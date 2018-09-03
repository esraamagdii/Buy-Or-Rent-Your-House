<%-- 
    Document   : Profile
    Created on : Dec 8, 2017, 10:00:20 PM
    Author     : Esraa
--%>

<%@page import="java.util.Base64"%>
<%@page import="DBConnection.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User x = (User) session.getAttribute("mydata");
    //String test ="default1.jpg";
    byte[] data = Base64.getEncoder().encode(x.getProfilePic());
    String image_str = new String(data);
    String image_value = "data:image/jpg;base64," + image_str;
    boolean checkadmin=x.getCheckAdmin();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Profile </title>
        <style type="text/css">
            body
            {
                margin: 0;
                padding: 0;
                background: #004d4d /*#BE6219*/ ;
                font-family: arial;
            }
            .profile
            {
                position: absolute;
                top: 21%;
                left: 7%;
                transform: translate(-50%,-50%);
                width: 250px;
                height: 250px;
                background: #fff;
                box-sizing: border-box;
                border-radius: 10px;
                /*overflow: hidden; */

                box-shadow: 0 20px 20px rgba(0,0,0,.2);
            }
            .parent
            {
                margin: auto;
            }
            .profile img
            {
                width: 100%;
                height: 100%;
            }
            .profile .view
            {
                position: absolute;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
                margin: 0;
                padding: 5px 10px;
                background: #fff;
                color: #262626;
                border-radius: 15px;
                text-transform: uppercase;
                font-size: 12px;
                font-weight: bold;
            }
            .details
            {
                height: 50%;
                width: 100%;
                background: #fff;
                position: absolute;
                bottom: 30px;
                text-align: center;
                padding: 20px;
                box-sizing: border-box;
                transition: .5s;
                transform-origin: bottom;
                transform: perspective(500px) scale(0);
            }
            .details.active
            {
                bottom: 0;
                transform: perspective(500px) scale(1);
            }
            .details h2
            {
                margin: 0;
                padding: 0;
                color: #1F9AB2;
                font-size: 25px;
            }
            h3
            {
                background: #00bcd4;
                color: #fff;
                padding: 5px 50px;
                border-radius: 25px;
                display: -webkit-inline-box;
                position: absolute;
                left: 10%;
                bottom: 0%;
            }
            .col
            {
                color: #1C869B;
            }
            .close
            {
                font-size: 20px;
                position: absolute;
                top: 5px;
                right: 5px;
                color: #f00;
                cursor: pointer;
            }
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
            .b1
            {
                margin-left: 10px;
                margin-right: 10px;
                color: white; 
                background:#008080;
                border-radius: 30px;
                border-color: white;
                font-size: 20px;
                width: auto;
                height: 40px;
            }
            .b2
            {
                margin-right: 0px;
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

            /*------------------------------------------------------------------------------------*/
            ul
            {
                padding: 0px;
                margin: 0px;
                display: flex;
            }
            ul li
            {
                list-style: none;
                border: 2px solid transparent;
                font-size: 15px;
                font-weight: bold;
                margin: auto;
                border-radius: 15px;
                font-family: arial;
            }
            ul li a
            {
                text-decoration: none;

                display: block;
                text-align: center;
                border-radius: 15px;
            }
            ul li:nth-child(1) a{
                color: #157392;
                border: 2px solid #157392;
                padding: 8px 8px;

            }
            ul li:nth-child(2) a{
                color: #5CA5BC;
                border: 2px solid #5CA5BC;
                padding: 11px 11px;
            }
        </style>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.view').click(function () {
                    $('.details').addClass('active')
                })
                $('.close').click(function () {
                    $('.details').removeClass('active')
                })
            })
        </script>
        <!-- then tag style then tag links (which the files that you need it in your code ) then script tag --> 
        <!-- hi -->
        <!--<input type="image" name="My Image" src="default1.jpg" height="200" width="200">-->

    </head>
    <body >
        <!--<body bgcolor="#D0D3D4"> -->
        <div class="parent">
            <div class="profile">
                <img  src=<%= image_value%> >
                <a href="#" class="view"> View Profile</a>
                <div class="details">
                    <h2>User Name <%= x.getName()%> </h2> 
                    <h3> <a href="EditProfile.jsp" class="col" >Edit Profile</a> </h3>

                    <div class="close"><i class="fa fa-times-circle" aria-hidden="true"></i></div>
                </div>
            </div>
                    <%
                        if(checkadmin == true)
                        { 
                    %>
                    <div style=" height:200px; width:700px;margin-top:500px;">
                          <a href="ShowAllAdvertise"><input type="button" value="Show all adertises" class="b1"></a>
                          <a href="ShowAllUsers"><input type="button" value="Show all users" class="b2"></a>  
                    </div>
                    <%  }
                    %>

            <%
                if(checkadmin == false){
                for (int i = 0; i < x.my_Advertisements.size(); i++) {
            %> 

            <!--box-->
            <!--<div > --><!--class="box"-->

            <!--ad1-->

            <div class="ad1">
                <div class="ad-name">Location : <%=x.my_Advertisements.get(i).getLocation()%>  </div>

                <div class="cover-s">
                    <%
                        byte[] p = Base64.getEncoder().encode(x.my_Advertisements.get(i).AdvertisePics.get(0));
                        String img = new String(p);
                        String image = "data:image/jpg;base64," + img;
                    %>
                    <img src=<%=image%>/>
                </div>

                <!--cover-s-->
                <div class="box-txt"> 
                    <b>Description  </b>
                    <p> 
                        <%= x.my_Advertisements.get(i).getDescription()%>     
                    </p>
                    <b>Size </b>
                    <p>
                        <%= x.my_Advertisements.get(i).getSize()%>
                    </p>
                    <b>Floor </b>
                    <p>
                        <%= x.my_Advertisements.get(i).getFloor()%>
                    </p>
                    <b>Status </b>
                    <p>
                        <%= x.my_Advertisements.get(i).getStatus()%>
                    </p>
                    <b>Contact </b>
                    <p>
                        <%= x.my_Advertisements.get(i).getContact()%>
                    </p>
                    <b>Type </b>
                    <p>
                        <%= x.my_Advertisements.get(i).getType()%>
                    </p>


                </div>
                <!--box-txt-->

                <div class="link-view">

                    <!--<ul>
                        <li><a href="CloseAdvertiseServlet"  id="index" value="hi">Close</a></li>
                      <li><a href="https://www.google.com">Edit</a></li>
                    </ul>-->
                    <form action="CloseAdvertiseServlet"> 
                        <input type="hidden" name="index" value=<%= i%> > 
                        <input type="submit" value="Close" class="b1">
                    </form>

                    <form action="EditAdvertise.jsp"> 
                        <input type="hidden" name="index2" value=<%= i%> > 
                        <input type="submit" value="Edit" class="b2">
                    </form>

                </div> 
            </div>

            <!--ad1-->
            <!-- </div> -->
            <!--box-->


            <% }
}
            %>
        </div>
    </body>
</html>
