<%-- 
    Document   : AdminAdvertises
    Created on : Dec 19, 2017, 2:00:00 PM
    Author     : Esraa
--%>

<%@page import="DBConnection.Advertise"%>
<%@page import="java.util.Base64"%>
<%@page import="DBConnection.Comments"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBConnection.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function showmore()
            {
                var content = document.getElementsByClassName("child");
                content.style.height = 'auto';
                var element = document.getElementById("show");
                content.addEventListener('click', showmore);
            }
            //console.log("id  ");
           // var id=document.getElementById("getid").value;
            //console.log("id  "+id );
            //var x=document.getElementById(id);
            //x.onclick(closeadvertise);
            function closeadvertise(id)
            {
                var div_id=document.getElementById(id.toString());
                //alert("id = "+id);
                div_id.style.display='none';
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "CloseAdminServlet?id="+id, true);
                xmlhttp.send();
            }
            function Suspenadvertise(id)
            {
                var check_suspend=id.toString()+"a";
                //alert("id = "+id);
                //alert("check_suspend = "+check_suspend);
                //alert("bvbbvbvbbvbv= "+check_suspend.toString());
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "SuspendAdminServlet?id="+id, true);
                xmlhttp.send();
                xmlhttp.onreadystatechange = function ()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    alert("reponse = " + xmlhttp.responseText);
                    document.getElementById(check_suspend.toString()).innerHTML = xmlhttp.responseText;
                }
            }
            }
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
                height:600px;;
                margin:auto;
                border:1px solid gray;
                border-radius: 20px;
                float:left;
                margin-top:10px;
                margin-right: 10px;
                overflow: hidden;

            }

        </style>

        <%
            ArrayList<Advertise> SearchAdvertises = new ArrayList<Advertise>();
            SearchAdvertises = (ArrayList<Advertise>) session.getAttribute("AdminAdvertises");
        %>
        <input type="hidden" value="<%=SearchAdvertises.size() %>" id="size"/>
        <%
            for (int i = 0; i < SearchAdvertises.size(); i++) {
                Advertise advertise = new Advertise();
                advertise = SearchAdvertises.get(i);
                System.out.println("check = "+advertise.getId()+'a');
        %>
        
        <div class="child" id="<%=advertise.getId()%>">
            <div class="pic">
                <%
                    for (int j = 0; j < advertise.getAdvertisePics().size(); j++) {
                        byte[] data = Base64.getEncoder().encode(advertise.getAdvertisePics().get(j));
                        String image_str = new String(data);
                        String image_value = "data:image/jpg;base64," + image_str;
                %>
                <div >
                    <span><p style="margin-top: 2px;"><%=  j + 1%>/<%=advertise.getAdvertisePics().size()%></p>
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
                            
                        <input type="submit" value="Close" onclick="closeadvertise('<%=advertise.getId()%>')"/>
                        <input type="submit" value="Suspend" onclick="Suspenadvertise('<%=advertise.getId()%>')"/>
                        <p style="float:right;color:red;" id="<%=advertise.getId()+"a"%>"></p>
                </div>
                <%  }
                %>

                </body>
                </html>
