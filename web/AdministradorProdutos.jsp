<%-- 
    Document   : AdministradorProdutos
    Created on : 11/12/2017, 20:18:10
    Author     : vlf
--%>

<%@page import="br.com.pizzadelo.web.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include  file="WEB-INF/jspf/boot.jspf"%>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/header.jspf" %>
         
         
         <div class="container">
              <div class="row"> 
             <div div class="col-5">
        <table>
  <tr>
    <thead>
      <th>Produto</th>
      <th>Preço</th>
      <th>Descrição</th>
      <th>Remover</th>
      <th>Editar</th>
    </thead>
  </tr>
<%for(int i = 0 ; i<Item.getPizzaList().size();i++){
              Item lista = Item.getPizzaList().get(i);
            %>
  <tr>
    <td><%=lista.getNm_item()%></td>
    <td><%=lista.getVl_item()%></td>
    <td><%=lista.getDs_item()%></td>  
    <td>
      <form>
        <input type="hidden" name="id" value="">
        <button >Remover</button>
      </form>
    </td>
    <td>
      <form>
        <input type="hidden" name="id" value="">
        <button>Editar</button>
      </form>
    </td>
  </tr>
<% }
%>
        </table>
        <br/>
        <button>Adicionar Pizza</button>
       </div>
        <div class="col-5">
               <table>
  <tr>
    <thead>
      <th>Produto</th>
      <th>Preço</th>
      <th>Descrição</th>
      <th>Remover</th>
      <th>Editar</th>
    </thead>
  </tr>
<%for(int i = 0 ; i<Item.getBebidaList().size();i++){
              Item lista = Item.getBebidaList().get(i);
            %>
  <tr>
    <td><%=lista.getNm_item()%></td>
    <td><%=lista.getVl_item()%></td>
    <td><%=lista.getDs_item()%></td>  
    <td>
      <form>
        <input type="hidden" name="id" value="">
        <button >Remover</button>
      </form>
    </td>
    <td>
      <form>
        <input type="hidden" name="id" value="">
        <button>Editar</button>
      </form>
    </td>
  </tr>
<% }
%>
        </table>
        <br/>
        <button>Adicionar Bebida</button>
        </div>
        </div>
         </div>
        
 <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
