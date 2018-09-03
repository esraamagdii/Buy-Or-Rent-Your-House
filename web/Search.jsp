<%-- 
    Document   : Search
    Created on : Dec 18, 2017, 10:56:30 PM
    Author     : Esraa
--%>

<%@page import="DBConnection.Comments"%>
<%@page import="java.util.Base64"%>
<%@page import="DBConnection.Advertise"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
         
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
            margin-top:10px;
            margin-right: 10px;
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
        <%
            ArrayList<Advertise> SearchAdvertises = new ArrayList<Advertise>();

            SearchAdvertises = (ArrayList<Advertise>) session.getAttribute("SearchAdvertises");
            if(SearchAdvertises.size()==0){
        %>
        <p style="color:red;font-weight:bold;font-size:30px;">Result not found</p>
        
        
            <%}
                for(int i=0;i<SearchAdvertises.size();i++){
                    Advertise advertise=new Advertise();
                    advertise = SearchAdvertises.get(i);
            %>
            <div class="child">
                <div class="pic">
                        <%
                            for (int j = 0; j < advertise.getAdvertisePics().size(); j++) {
                                byte[] data = Base64.getEncoder().encode(advertise.getAdvertisePics().get(j));
                                String image_str = new String(data);
                                String image_value = "data:image/jpg;base64," + image_str;
                        %>
                                <div >
                                <span><p style="margin-top: 2px;"><%=  j+1%>/<%=advertise.getAdvertisePics().size()%></p>
                                <img src=<%= image_value%> style="width:300px;height:100px;margin-top:1px;">
                            
                                </div>
                            
                        <% }%>
                        
                </div><br>
                <div class="data">
                        <span style='margin-left:15px;'>Description:<%=advertise.getDescription()%></span><br>
                        <span style='margin-left:15px;'>Size/Space: <%=advertise.getSize()%></span><br>
                        <span style='margin-left:15px;'>Floor:      <%=advertise.getFloor()%></span><br>
                        <span style='margin-left:15px;'>Status:     <%=advertise.getStatus()%></span><br>
                        <span style='margin-left:15px;'>Type:       <%=advertise.getType()%></span><br>
                        <span style='margin-left:15px;'>Location:   <%=advertise.getLocation()%></span><br>
                        <span style='margin-left:15px;'>Contact     <%=advertise.getContact()%></span><br>
                        <h3>Comments: </h3>
                        <%
                        for (int k = 0; k < advertise.getComments().size(); k++) {
                            Comments comment = advertise.getComments().get(k);
                            String Strcomment = comment.getComment();
                        %>
                        <span><p>  <%=Strcomment%></p></span><br>
                        <%}%>
                        
                </div>
            
                        
                        
             </div>
              <%  }
            %>
        
        
    </body>
</html>
