<%-- 
    Document   : index
    Created on : 24-May-2022, 11:34:54 am
    Author     : Lenovo
--%>

<%@page import="com.mycompany.ecommerceproject.helper.Helper"%>
<%@page import="com.mycompany.ecommerceproject.dao.categoryDAO"%>
<%@page import="com.mycompany.ecommerceproject.entities.category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecommerceproject.entities.product"%>
<%@page import="com.mycompany.ecommerceproject.dao.productDAO"%>
<%@page import="com.mycompany.ecommerceproject.helper.FactoryProvider" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buy-It</title>

        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/style.css">
         <script  src="js/myscript.js" > </script>
        
    </head>
    <body >

        <%@include file="components/navbar.jsp" %>

        <div class ="row">

            <%  
                String cat = request.getParameter("category");

                productDAO pdao = new productDAO(FactoryProvider.getFactory());

                List<product> list = null;

                if (cat == null || cat.trim().equals("all")) {

                    list = pdao.getAllProducts();

                } else {

                    int cid = Integer.parseInt(cat.trim());
                    list = pdao.getAllProductsbyId(cid);

                }

                categoryDAO cdao = new categoryDAO(FactoryProvider.getFactory());

                List<category> clist = cdao.getCategories();

            %>

            <!--showing categories-->
            <div class="col-md-2  mx-2" style="margin-top: 2%;">

                <div class="list-group mt-2">

                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All products
                    </a>


                    <% for(category c : clist) {

                    %>
                    <a href="index.jsp?category=<%=c.getCategory_id()%>"  class="list-group-item list-group-item-action "><%=c.getCategory_title()%></a>
                    <%
                        }
                    %>

                </div> 
            </div>

            <!--showing product-->
            <div class="col-md-9" style="margin-top: 2%; position: relative">


                <!--row-->
                <div class="row-mt-4">


                    <!--column - 12 - grid-->
                    <div class="col-md-16 mt-2">

                        <div class="card-columns">

                            <!--traversing products-->

                            <%
                                for (product p : list) {

                            %>

                            <div class="card">

                                <img src="img/products/<%= p.getpPhoto()%>" style="height: 200px; width: 200px;" class="card-img-top center"  alt="product-img">

                                <div class="card-body">

                                    <h5 class="card-title"><%=p.getpName()%></h5>

                                    <p class="card-text">
                                        <%=Helper.get10words(p.getpDesc())%>      
                                    </p>
                                </div>

                                <div class="card-footer text-center">

                                    <button class="btn custom-bg text-white"  onclick="addToCart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getDiscountedPrice()%>,<%=p.getpQuantity()%>)"> Add to cart</button>
                                    <span class="ml-3 text-bold text-secondary"><s>₹ <%=p.getpPrice()%></s> /-</span>
                                    <span class="ml-2 text-bold">₹ <%=p.getDiscountedPrice()%> /-</span>
                                </div>

                            </div>


                            <%
                                }

                                if (list.size() == 0) {
                                      
                                     out.println("No products in this category yet");
                                }
                            %>
                            
                        </div>

                    </div>

                </div>

            </div>
                            <div class="toast" id ="toast-id" data-autohide="true">
                                <div class="toast-header">
                                    <strong class="mr-auto text-primary">Toast Header</strong>
                                    <small class="text-muted">5 mins ago</small>
                                    <button type="button" class="ml-2 mb-1 close" onclick="removeToast()" data-dismiss="toast">&times;</button>
                                </div>
                                <div class="toast-body">
                                    Some text inside the toast body
                                </div>
                            </div>
                   <%@include file="components/common-modal.jsp" %>
    </body>
</html>
