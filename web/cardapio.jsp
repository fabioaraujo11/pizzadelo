<%-- 
    Document   : cardapio
    Created on : 11/12/2017, 23:44:56
    Author     : adalberto
--%>

<%@page import="br.com.pizzadelo.web.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cardapio</title>
        
        <%@include  file="WEB-INF/jspf/boot.jspf"%>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
         <div class="container">
            <br>
            <table class="table">
                <thead>
                    <tr>
                        <th>Pizza</th>
                        <th>Descrição</th>
                        <th>Preço</th>
                    </tr>
                </thead>
                <tbody>
                    <%for(int i = 0; i < Item.getPizzaList().size(); i++) {
                    Item lista = Item.getPizzaList().get(i);%>
                    <tr>
                        <td><%=lista.getNm_item()%></td>
                        <td><%=lista.getDs_item()%></td>
                        <td><%=lista.getVl_item()%></td>
                    </tr>
                    <%}%>
                     <%for(int i = 0; i < Item.getBebidaList().size(); i++) {
                    Item lista = Item.getBebidaList().get(i);%>
                    <tr>
                        <td><%=lista.getNm_item()%></td>
                        <td><%=lista.getDs_item()%></td>
                        <td><%=lista.getVl_item()%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
