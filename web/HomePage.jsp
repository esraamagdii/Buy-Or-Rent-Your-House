<%-- 
    Document   : HomePage
    Created on : Dec 6, 2017, 10:38:20 PM
    Author     : Esraa
--%>

<%@page import="DBConnection.Comments"%>
<%@page import="java.util.Base64"%>
<%@page import="DBConnection.Advertise"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script type="text/javascript">

        function addComment(id,email) {
            //alert("email"+email);

            var comment = document.getElementById(id).value;
            var insercomment=id.toString()+"a";
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("GET", "AddComment?comment=" + comment + "&id=" + id+"&email="+email, true);
            xmlhttp.send();
            document.getElementById(insercomment.toString()).innerHTML =comment;
        }
        function rate()
        {
            alert("Thanks ^_^ ");
        }
    </script> 



    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <style>
        * {box-sizing:border-box}

        /* Slideshow container */
        .slideshow-container {
            max-width: 900px;
            position: relative;
            margin-bottom: 20px;

        }
        .googlemap{
            border:1px solid gray;
            border-radius: 20px;
            width: 750px;
            height: 300px;
            margin:10px;
            float:right;
            margin-top: 20px;
        }
        .oneadvertise{
            width: auto;
            height: auto;
            overflow: hidden;
            border:1px solid gray;
            border-radius: 20px;
            margin-top: 20px;
        }
        .pic{

            border:1px solid gray;
            border-radius: 20px;
            width: 750px;
            margin:10px;
            float:left;
            margin-top: 20px;

        }
        
        /* Caption text */
        .text {
            color: #f2f2f2;
            font-size: 15px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
        }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 15px 15px;
            position: absolute;
            top: 0;
        }

        /* The dots/bullets/indicators */
        .dot {
            cursor:pointer;
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        .active, .dot:hover {
            background-color: #717171;
        }

        /* Fading animation */
        .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1.5s;
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @-webkit-keyframes fade {
            from {opacity: .4} 
            to {opacity: 1}
        }

        @keyframes fade {
            from {opacity: .4} 
            to {opacity: 1}
        }
        body{
            background-color: #004d4d ;
            color: white;
        }
        hr{
            background-color:#ccccb3;
            height:2px;
            margin-top:10px;
        }
        .main-nav{
            float:left;
            list-style: none;
            margin-top: 10px;

        }
        .main-nav li{
            display:inline-block;
            margin-left: 5px;
        }
        .main-nav a{
            color:#cccccc;
            margin-left: 20px;
            margin-bottom: 10px;
            font-family: serif;
            font-size: 20px;
            font-weight: bold;
            text-decoration: none;
        }
        .container1{
            display: -webkit-flex;
            display: flex;
            width: 100%;
            height:auto;
            justify-content: space-between;
            margin-top:40px;
            flex-direction: column;
        }
        p{
            font-size: 10px;
        }
        .item1 {
            -webkit-flex:2;
            width:700px;
            height: auto;
            margin:10px;
            border:1px solid gray;
            border-radius: 20px;
            float:left;

        }

        img{
            margin-top: 30px;
            margin-left: 15px;
        }
        textArea
        {
            border-radius: 15px;
            width: 500px;
            height: 40px;
            margin-bottom: 30px; 
            font-size: 15px;
            background-color: white;

        }
        button{
            width: 150px;
            height: 40px;
            color: white;
            background:#008080 ;
            font-weight: bold;
            border-radius: 20px;
            font-size: 10px;
        }    
        ::-ms-input-placeholder { 
            color: white;
        }
        .star-rating {
            display: block;
            margin-bottom: 25px;
            direction: rtl;
            text-align: left;
            margin-top: 20px;
            
        }
        .star-rating input[type="radio"] {
            display: none
        }
        .star-rating > label {
            color: #ccc;
            -webkit-transition: all .2s ease-in-out;
            -moz-transition: all .2s ease-in-out;
            -o-transition: all .2s ease-in-out;
            transition: all .2s ease-in-out;
            cursor: pointer;
            font-size: 25px;
            
        }
        .starRating
        {
           margin-left: 550px;
           text-align: center;
           
        }
        .star-rating > label:hover,
        .star-rating > label:hover ~ label,
        .star-rating > input[type="radio"]:checked ~ label
        {color: #f2b600}
    </style>

    <body  onload="initialize()">

        <div class="row">
            <ul class="main-nav">
                <li><a href="GetProfileServlet">Profile</a></li>
                <li><a href="FirstSearch.jsp">Search</a></li>
                <li><a href="CreateAdvertise.jsp">Add Advertise</a></li>
                <li><a href="ShowNotification" >Show notifications</a></li>
                <li><a href="LogoutServlet" >Log out</a></li>
                <li><a href="getNotificationsServlet">Show your preferences</a></li>
            </ul>
            <hr/>
        </div>

        <%
            ArrayList<Advertise> collectionOfAdvertise = new ArrayList<Advertise>();

            collectionOfAdvertise = (ArrayList<Advertise>) session.getAttribute("Advertises");
        %>
        <div class="container1">

            <%
                for (int i = 0; i < collectionOfAdvertise.size(); i++) {
                    Advertise advertise = collectionOfAdvertise.get(i);
            %>
            <div class="oneadvertise">
                <div class="item1" >
                    <input type="hidden" value="<%=advertise.getId()%>"  id="getid" />
                    <input type="hidden" value="<%=advertise.getRate()%>" id="getrate"/>
                    <%
                    
                    application.setAttribute("getid",advertise.getId());
                    application.setAttribute("getrate",advertise.getRate());
                    %>

                    <form method="POST" class="starRating" action="SaveRate" onsubmit="rate()">
                        <div class="star-rating" id="CheckedStar">

                            <input id="star-5x" type="radio" name="rating" value="star-5" checked/>
                            <label for="star-5x" title="5 stars">
                                <i class="fa fa-star"></i>
                            </label>

                            <input id="star-4x" type="radio" name="rating" value="star-4" />
                            <label for="star-4x" title="4 stars">
                                <i class="fa fa-star"></i>
                            </label>

                            <input id="star-3x" type="radio" name="rating" value="star-3"/>
                            <label for="star-3x" title="3 stars">
                                <i class="fa fa-star"></i>
                            </label>

                            <input id="star-2x" type="radio" name="rating" value="star-2" />
                            <label for="star-2x" title="2 stars">
                                <i class="fa fa-star"></i>
                            </label>

                            <input id="star-1x" type="radio" name="rating" value="star-1" />
                            <label for="star-1x" title="1 star">
                                <i class="fa fa-star"></i>
                            </label>


                        </div>
                        <input type="submit" name="rate" value="Done" />
                    </form>
                    <br/>

                    <%
                        out.print("<span style='margin-left:15px;'>" + "Description: " + advertise.getDescription() + " </span>" + "<br>");
                        out.print("<span style='margin-left:15px;'>" + "Size/Space: " + advertise.getSize() + "</span>" + "<br> ");
                        out.print("<span style='margin-left:15px;'>" + "Floor: " + advertise.getFloor() + " </span>" + "<br>");
                        out.print("<span style='margin-left:15px;'>" + "Status: " + advertise.getStatus() + " </span>" + "<br>");
                        out.print("<span style='margin-left:15px;'>" + "Type: " + advertise.getType() + " </span>" + "<br>");
                        out.print("<span style='margin-left:15px;'>" + "Location: " + advertise.getLocation() + " </span>" + "<br>");
                        out.print("<span style='margin-left:15px;'>" + "Contact: " + advertise.getContact() + " </span>" + "<br>");
                        out.print("Size of array pics: " + advertise.getAdvertisePics().size());
                    %>
                    <br>
                    Comments: 
                    <%
                        for (int k = 0; k < advertise.getComments().size(); k++) {
                            Comments comment = advertise.getComments().get(k);
                            String Strcomment = comment.getComment();

                    %>

                    <div style="border:1px dashed gold;width:200px;height:50px;border-radius:3px;"><%=Strcomment%></div><br>
                    
                    <% }%>
                    <br><div style="border:1px dashed gold;width:200px;height:50px;border-radius:3px;"id="<%=advertise.getId()+"a"%>"></div>
                    <%
                        application.setAttribute("id", advertise.getId());
                    %>

                    <textarea id="<%=advertise.getId()%>" name="textComment" placeholder="Write your comment ^_^"></textarea>
                    <input type="button" name="addComment" onclick="addComment('<%=advertise.getId()%>','<%=advertise.getUserEmail()%>')" value="Add Comment"/>

                </div>
                <div class="pic">
                    <div>
                        <%
                            for (int j = 0; j < advertise.getAdvertisePics().size(); j++) {
                                byte[] data = Base64.getEncoder().encode(advertise.getAdvertisePics().get(j));
                                String image_str = new String(data);
                                String image_value = "data:image/jpg;base64," + image_str;
                        %>
                        <div >
                            <span><p style="margin-top: 2px;"><%=  j+1%>/<%=advertise.getAdvertisePics().size()%></p>
                            <img src=<%= image_value%> style="width:400px;height:200px;margin-top:1px;">
                            
                        </div>


                        <% }%>

                    </div>
                        
                </div>
                <br>
                <div id="map" class="googlemap">


                    <input type="button" onclick="codeAddress('<%=advertise.getLocation()%>')" value="addlocation">
                </div>
                


            </div>
                <% }%>
        </div>

        <script type="text/javascript">
            var slideIndex = 1;
            showSlides(slideIndex);
            // Next/previous controls
            function plusSlides(n) {

                slideIndex+=n;
                showSlides(slideIndex);
            }
            // Thumbnail image controls
            function currentSlide(n) {
                slideIndex=n;
                showSlides(slideIndex);
            }
            function showSlides(n) 
            {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");
                if (n > slides.length)
                {
                    slideIndex = 1;
                }
                if (n < 1) 
                {
                    slideIndex = slides.length;
                }
                for (i = 0; i < slides.length; i++) 
                {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length ; i++)
                {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
            }
        </script>
    </body>
</html>
