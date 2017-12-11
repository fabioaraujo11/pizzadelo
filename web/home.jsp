<%-- 
    Document   : home
    Created on : 12/11/2017, 20:20:29
    Author     : Rafael Sousa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include  file="WEB-INF/jspf/boot.jspf"%>
        
        <title>Pizzadelo</title>
        
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/header.jspf" %>
        
        <div class="jumbotron container">
          <h1 class="display-3">Hello, world!</h1>
          <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
          <hr class="my-4">
          <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
          <p class="lead">
            <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
          </p>
        </div>
       
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        
    </body>
    
</html>
