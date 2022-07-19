

<%@page import="com.mycompany.ecommerceproject.entities.User" %>

<%
    
      User user = (User)session.getAttribute("current-user");
      
     if(user == null)
     {
        session.setAttribute("message","You're not logged in !! Log in first");
        
        response.sendRedirect("login.jsp");
        return;
     }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal Log-in </title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel ="stylesheet" href="css/style.css">
        
    </head>
    <body style="background-color: #B3E8E5">
        <%@include file="components/navbar.jsp" %>
        <h1>This is normal login Page</h1>
    </body>
</html>
