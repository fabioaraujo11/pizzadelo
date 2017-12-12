<%-- 
    Document   : AdministradorProdutos
    Created on : 11/12/2017, 20:18:10
    Author     : vlf
--%>

<%@page import="br.com.pizzadelo.web.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    String erro1 = null;
if(request.getParameter("rmv")!=null){
    int id = Integer.parseInt(request.getParameter("id"));
     try{
            Item.deletaItem(id);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
             erro1 = e.getMessage();
        }
}
if(request.getParameter("add")!=null){
    String tipo = request.getParameter("tipo");
    String pizza="PIZZA";
    
    double preco1 = Double.parseDouble(request.getParameter("preco"));
    String descricao = request.getParameter("descricao");
    String nome1 = request.getParameter("nome1");
   try{ 
       if(tipo.equals(pizza)){        
        Item.inserirPizza(preco1, descricao, nome1);
        response.sendRedirect(request.getRequestURI());
    }else 
        Item.inserirBebida(preco1, descricao, nome1);
       response.sendRedirect(request.getRequestURI());
    
    }catch(Exception e){
             erro1 = e.getMessage();
}
}
%>
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
         <div>
             <form>
                 <fieldset>
                 <table>
                     <tr>
                 <label>Nome</label>
                 <input type="text" name="nome1" required="">
                 </tr>
                 <tr>
                 <label>Preço</label>
                 <input type="number" name="preco" required="">
                 </tr>
                 <tr>
                 <label>Descrição</label>
                 <textarea name="descricao" rows="2" required=""></textarea>
                 </tr>
                 <tr>
                 <label>Tipo</label>
                 <select name="tipo" required="">
                    <option value="PIZZA">PIZZA</option>
                    <option value="BEBIDA">BEBIDA</option>     
                 </select>
                 </tr>
                 <button type="submit" name="add">Adicionar Item</button>
                 </table>
                    
                 </fieldset>
                 
             </form>
             
         </div>
         
        
              <div class="row"> 
             <div div class="col-6">
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
<% for(int i = 0 ; i<Item.getPizzaList().size();i++){
              Item lista = Item.getPizzaList().get(i);
            %>
  <tr>
    <td><%=lista.getNm_item()%></td>
    <td><%=lista.getVl_item()%></td>
    <td><%=lista.getDs_item()%></td>  
    <td>
      <form>
          <input type="hidden" name="id" value="<%=lista.getCd_item()%>">
        <button type="submit" name="rmv">Remover</button>
      </form>
    </td>
    <td>
      <form>
        <input type="hidden" name="id" value="<%=lista.getCd_item()%>">
        <button>Editar</button>
      </form>
    </td>
  </tr>
<% }
%>
        </table>
        <br/>
        
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
        <input type="hidden" name="id" value="<%=lista.getCd_item()%>">
        <button type="submit" name="rmv">Remover</button>
      </form>
    </td>
    <td>
      <form>
        <input type="hidden" name="id" value="<%=lista.getCd_item()%>">
        <button>Editar</button>
      </form>
    </td>
  </tr>
<% }
%>
        </table>
        
      

        </div>
        </div>
         </div>
        
 <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
