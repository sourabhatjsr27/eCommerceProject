
<%@page import="com.mycompany.ecommerceproject.entities.User" %>

<%
    User user1 = (User)session.getAttribute("current-user");
    
   %>



   <nav class="navbar navbar-expand-lg navbar-dark custom-bg" style="position: fixed;">
    <div class="container">
        
           <a class="navbar-brand" href="#">Grab-It</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
           <span class="navbar-toggler-icon"></span>
         </button>

         <div class="collapse navbar-collapse" id="navbarSupportedContent">
           <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>

             <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
                  Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
             </li>

           </ul>
             <ul class="navbar-nav ml-auto">
                 
                 <li class="nav-item active">
                     <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><img src="img/carts2.png" width=25x; height=25px;><span id="cart-products-size" class="cart-products"></span></a>
                  </li>
                 
                 
                 <%
                     if(user1 == null)
                     { 
                  %>
                        <li class="nav-item active">
                          <a class="nav-link" href="login.jsp">Login </a>
                        </li>
                        <li class="nav-item active">
                          <a class="nav-link" href="signup.jsp">Sign-Up </a>
                        </li>
                 <%
                     }else{

                  %>
                        <li class="nav-item active">
                          <a class="nav-link" href="#!">Hi <%= user1.getUserName() %> ! </a>
                        </li>
                        <li class="nav-item active">
                          <a class="nav-link" href="LogOutServlet">LogOut </a>
                        </li>
                  
                  <%
                      }  
                  %>
                  
                  

             </ul>
         </div>
        
    </div>
</nav>
