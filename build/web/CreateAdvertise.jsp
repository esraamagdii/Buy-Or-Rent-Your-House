<%-- 
    Document   : CreateAdvertise
    Created on : Dec 10, 2017, 5:03:23 PM
    Author     : Esraa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function validate()
            {
               
              var contact= document.advertiseForm.contact.value;
              var index=contact.indexOf("@"); 
                if (document.advertiseForm.desc.value === "")
                {
                    alert("Please enter the description of the place!");
                    document.advertiseForm.desc.focus();
                    return false;
                }

                if (document.advertiseForm.size.value === "")
                {
                    alert("Please enter the space of the place!");
                    document.advertiseForm.size.focus();
                    return false;
                }
                 if (isNaN(document.advertiseForm.size.value))
                {
                    alert("size must be  numbers !");
                    document.advertiseForm.size.focus();
                    return false;
                }
                if (isNaN(document.advertiseForm.floor.value))
                {
                     document.getElementById("floor").innerHTML = "Floor must be a number ";
                    return false;
                }

                if (document.advertiseForm.status.value === "")
                {
                    alert("Please enter a valid status!");
                    document.advertiseForm.status.focus();
                    return false;
                }
                 if (document.advertiseForm.type.value === "")
                {
                    alert("Please enter a valid type !");
                    document.advertiseForm.type.focus();
                    return false;
                }
               if (document.advertiseForm.contact.value === "" )
                {
                    alert("Please enter  your contact !");
                    document.advertiseForm.contact.focus();
                    return false;
                }
                if(isNaN(document.advertiseForm.contact.value)){
                    if(index<1){
                      alert("Please enter a valid contact!");
                    document.advertiseForm.contact.focus();
                    return false; 
                }
                }   
                
                return(true);
                cosole.log("nnnnn");
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
            button{
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
        <div style="width:600px;height:900px; margin-left:28% ;margin-top: 30px;">
        <h3>Create Your Advertise</h3>
        <form method="post" action="CreateAdvertiseServlet" enctype="multipart/form-data" onsubmit="return(validate());">
            <textarea name="desc" placeholder=" Description"></textarea><br/><br/>
            <input type="text" name="size" placeholder=" Size"/><br/><br/>
            <input type="number" name="floor" placeholder=" FLoor" required/><br/><br/>
            <input type="text" name="status" placeholder=" Status" /><br/><br/>
            <input type="text" name="type" placeholder=" Type" /><br/><br/>
            <input type="text" name="contact" placeholder=" Contact" /><br/><br/>
            <a href="Map.jsp"><input type="button" value="location" placeholder="location" required/></a><br><br>
            <input type="file" name="photos" placeholder=" Choose Photos" multiple="multiple" accept="image\jsp"/><br/><br/>
            <button type="submit">Save</button>
        </form>
        </div>
    </body>
</html>
