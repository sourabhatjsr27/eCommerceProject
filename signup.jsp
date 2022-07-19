<%-- 
    Document   : signup
    Created on : 25-May-2022, 10:13:07 am
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign-Up</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body >
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            
                <div class="row">

               <div class ="col-md-4 offset-md-4">

                   <div class="card" style="margin-top : 10px ">
                       <div class="card-body px-5">
                           
                           <%@include file="components/message.jsp" %>

                           <h3 class="text-center my-3">Sign-Up here !!</h3>
                           
                           <form action="SignUpServlet" method="post">
                               <div class="form-group">
                                   <label for="name">Name</label>
                                   <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp">    
                               </div>
                               <div class="form-group">
                                   <label for="email">Email</label>
                                   <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter here" aria-describedby="emailHelp">    
                               </div>
                               <div class="form-group">
                                   <label for="password">Password</label>
                                   <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp">    
                               </div>
                               <div class="form-group">
                                   <label for="phone">Phone no</label>
                                   <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp">    
                               </div>
                               <div class="form-group">
                                   <label for="address">Address</label>
                                   <textarea name="user_address" style="height: 100px " type="textArea" class="form-control" id="address" placeholder="Enter here address"> </textarea>   
                               </div>

                               <div class="container text-center"> 
                                   <button class="btn btn-outline-success"> Sign-Up </button>
                                   <button class="btn btn-outline-warning"> Reset </button>
                               </div>

                           </form>
                       </div>
                   </div>

               </div>
           </div>
        </div>
    </body>
</html>
