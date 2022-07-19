
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecommerceproject.entities.category"%>
<%@page import="com.mycompany.ecommerceproject.helper.FactoryProvider"%>
<%@page import="com.mycompany.ecommerceproject.dao.categoryDAO"%>
<%@page import="com.mycompany.ecommerceproject.entities.User" %>

<%
    
      User user = (User)session.getAttribute("current-user");
      
     if(user == null)
     {
        session.setAttribute("message","You're not logged in !! Log in first");
        
        response.sendRedirect("login.jsp");
        return;
     }else{
     
        if(user.getUserType().equals("normal"))
        {
          session.setAttribute("message","Don't try to access admin page & you're not admin !! ");

           response.sendRedirect("login.jsp");
           return;
        }
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        
                 
    </head>
    <body >
        
        <%@include file="components/navbar.jsp" %>
        
        <div class="container fluid">
            
            <%@include file="components/message.jsp" %>
        </div>
        
        <div class="container ">
            
            <%-- first row --%>
            <div class="row mt-3">
                
                <%-- first column --%>
                <div class="col-md-4">
                    <div class="card">
                        
                        <div class="card-body text-center">
                            
                             <div class="container">
                                <img style = "max-width : 150px;"class = "img-fluid" src="img/man.png" alt="users">
                            </div>
                            <h3 class="mt-3">2145</h3> 
                            <h1 class="mt-3">Users</h1>
                        </div>
                    </div>
                    
                </div>
                
                <%-- second column --%>
                 <div class="col-md-4">
                    <div class="card">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style = "max-width : 150px; max-height: 150px;"class = "img-fluid" src="img/options.png" alt="categories">
                            </div>
                            
                            <h3 class="mt-3">2145</h3>
                            <h1 class="mt-3">Categories</h1>
                        </div>
                    </div>
                    
                 </div>
                
                 <%-- third column --%>
                 <div class="col-md-4">
                     
                    <div class="card">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style = "max-width : 150px; max-height: 150px;"class = "img-fluid" src="img/gift.png" alt="categories">
                            </div>
                            
                            <h3 class="mt-3">2145</h3>
                            <h1 class="mt-3">Products</h1>
                        </div>
                    </div>
                    
                </div>
            </div>
                 
            <%-- second row --%>
            
            <div class="row mt-3">
                
                <div class="col-md-6">
                     
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        
                        <div class="card-body text-center">
                            
                             <div class="container">
                                <img style = "max-width : 150px;"class = "img-fluid" src="img/plus1.png" alt="users">
                            </div>
                           <h3 class="mt-3">2145</h3> 
                           <p> Click here to add new Category </p>
                            <h1 class="mt-3">Add Category</h1>
                        </div>
                    </div>
                    
                </div>
                
                <div class="col-md-6">
                     
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        
                        <div class="card-body text-center">
                            
                             <div class="container">
                                <img style = "max-width : 150px;"class = "img-fluid" src="img/plus.png" alt="users">
                            </div>
                            <h3 class="mt-3">2145</h3>
                            <p> click here to add new product </p>
                            <h1 class="mt-3">Add Product</h1>
                        </div>
                    </div>
                    
                </div>
            </div>
            
             
        </div>
        
            

<!-- starting of add category Modal -->
            <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            
                            <form action="ProductOperationServlet" method="post">
                                
                                <input type="hidden" name="operation" value="addCategory">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="categoryTitle" placeholder="enter category title here" required>
                                </div>
                                
                                <div class="form-group">
                                    <textarea style="height: 150px;" class="form-control" name="categoryDescription" placeholder="enter category details here" required></textarea>
                                </div>
                                
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Add Category</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
   <!--ending of add category modal-->  
   
            <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            
                            <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                                
                                <input type="hidden" name="operation" value="addProduct"/>
                                 
                                <div class="form-group">
                                    <input type="text" class="form-control" name="productName" placeholder="enter product name here" required/>
                                </div>
                                
                                <div class="form-group">
                                    <textarea style="height: 150px;" class="form-control" name="productDescription" placeholder="enter product details here" required></textarea>
                                </div>
                                
                                <%
                                    categoryDAO cDAO = new categoryDAO(FactoryProvider.getFactory());
                                    List<category> list =   cDAO.getCategories();
                                 %>
                            
                                
                                <div class ="form-group">
                                    
                                    <select name="catId" class="form-control" id="">
                                         
                                        <%
                                            for(category c : list)
                                            {
                                         %>
                                         
                                         <option value="<%= c.getCategory_id() %>" > <%= c.getCategory_title() %> </option>
                                            
                                            <%
                                                }
                                            %>
                                        
                                    </select>
                                </div>
                                
                                
                                <div class="form-group">
                                    <input type="number" class="form-control" name="productPrice" placeholder="enter product price here" required/>
                                </div>
                                
                                <div class="form-group">
                                    <input type="number" class="form-control" name="productDiscount" placeholder="enter availabel discount here" required/>
                                </div>
                                
                                <div class="form-group">
                                    <input type="number" class="form-control" name="productQuantity" placeholder="enter product quantity here" required/>
                                </div>
                                
                                <div class="form-group">
                                    <label for="productPic" > Select product picture</label>
                                    <input type="file" class="form-control" id="productPic" name="productPicture" placeholder="upload product picture here" required/>
                                </div>
                                
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Add product</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
   
   
    </body>
</html>
