<%-- 
    Document   : EditAdvertise
    Created on : Dec 19, 2017, 3:48:25 PM
    Author     : Esraa
--%>

<%@page import="DBConnection.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User u =new User();
    u=(User)session.getAttribute("mydata");
    String index=(String)request.getParameter("index2");
    int i=Integer.parseInt(index);
%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                font-size: 15px;

            }
            body{
                background-color: #004d4d ;
                color: white;
            }
            h3{
                text-align: center;
                margin-top: 50px;
                font-family: serif;
                font-size: 30px;
                font-weight: bold;
                color: #008080;
            }
            .sub{
                width: 300px;
                height: 40px;
                color: white;
                background:#008080;
                font-weight: bold;
                border-radius: 20px;
                font-size: 20px;
            }
            textArea{
                background-color:#008080;
                color: white;
                border-radius: 15px;
                width: 500px;
                height: 40px;
                margin-bottom: 30px; 
                font-size: 15px;  
                
            }
            input[type=file]{
               background-color:#008080;
                color: white;
                border-radius: 15px;
                width: 500px;
                height: 40px;
                margin-bottom: 30px;
                font-size: 15px;  
            }
            form{
                text-align: center;
                margin-top: 50px;
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
        
        
        <div style="width:600px;height:900px; margin-left:28% ;margin-top: 30px;">
        <h3>Edit Your Advertise</h3>
        <form method="post" action="SaveAdvertiseEdit" enctype="multipart/form-data">
            Description<input type="text" name="desc" placeholder=<%="  "+u.my_Advertisements.get(i).getDescription()%> >
            <br/><br/>
            Size<input type="text" name="size" placeholder=<%="  "+u.my_Advertisements.get(i).getSize()%> >
            <br/><br/>
            Floor<input type="number" name="floor" placeholder=<%="  "+u.my_Advertisements.get(i).getFloor()%> >
            <br/><br/>
            Status<input type="text" name="status" placeholder=<%="  "+u.my_Advertisements.get(i).getStatus()%> >
            <br/><br/>
            Type<input type="text" name="type" placeholder=<%="  "+u.my_Advertisements.get(i).getType()%> >
            <br/><br/>
            Contact<input type="text" name="contact" placeholder=<%="  "+u.my_Advertisements.get(i).getContact()%> >
            <br/><br/>
            <a href="Map.jsp"><input type="button" value="location" placeholder="location" ></a>
            <br><br> 
            <input type="file" name="photos" placeholder=" Choose Photos" multiple="multiple" accept="image\jsp">
            <br/><br/>
            <input type="submit" value="Save" class="sub">
            <input type="hidden" name="index" value=<%=index%> >
        </form>
       </div>
        
        
        
    </body>
</html>
