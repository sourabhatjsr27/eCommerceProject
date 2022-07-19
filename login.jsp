

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Page</title>
        <%@include file="components/common_css_js.jsp" %>
       
    </head>
    <body  >
        
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                      
                    <div class="card mt-5">
                        
                        <div class="card-header custom-bg text-white">
                             
                            <h3 > Log-in here </h3>
                            
                        </div>
                        
                        <div class="card-body">
                            
                            <%@include file="components/message.jsp" %>
                             
                                <form action="LoginServlet" method="post">
                                        <div class="form-group">
                                          <label for="exampleInputEmail1">Email address</label>
                                          <input name = "email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                          <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                        </div>
                                        <div class="form-group">
                                          <label for="exampleInputPassword1">Password</label>
                                          <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                        </div>
                                       
                                    <div class="container text-center">
                                       
                                        <button class="btn btn-primary custom-bg"><a color="white" class="btnText" href="signup.jsp" >New User ?</a> </button>
                                        
                                         <button type="submit" class="btn btn-primary custom-bg">Submit</button>     
                                    </div>
                                        
                                </form>
                        </div>
                         
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
