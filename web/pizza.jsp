<%-- 
    Document   : pizza
    Created on : 10/12/2017, 23:49:58
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%@include  file="WEB-INF/jspf/boot.jspf"%>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        
        <div class="container">
        <h1 style="text-align: center">FAÇA SEU PEDIDO</h1>
        
        <table class="table container" style="">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">PIZZA</th>
                <th scope="col">DESCRIÇÃO</th>
                <th scope="col">PREÇO</th>
                <th scope="col">SELECIONAR</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>Portuguesa</td>
                <td>Farinha, colocou no forninho</td>
                <td>R$ 100,00</td>
                <td>
                    <input type="number" name="qtde" min="0" max="10" placeholder="0" style="width: 40px">
                    <button type="submit" name="addPizza" class="btn btn-dark"><h5>+</h5></button>
                </td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>Frango c/ Catupiry</td>
                <td>Mãe to na globo</td>
                <td>$ 30,10</td>
                <td>
                    <input type="number" name="qtde" min="0" max="10" placeholder="0" style="width: 40px">
                    <button type="submit" name="addPizza" class="btn btn-dark"><h5>+</h5></button>
                </td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>Calabresa</td>
                <td>Linguiça hmm</td>
                <td>R$ 50,50</td>
                <td>
                    <input type="number" name="qtde" min="0" max="10" placeholder="0" style="width: 40px">
                    <button type="submit" name="addPizza" class="btn btn-dark"><h5>+</h5></button>
                </td>
              </tr>
            </tbody>
          </table>
        <p>*Máximo de 10 pizzas por sabor</p>
        
        <hr>
        
        <h4>Complementos:</h4>
        <div class="form-group" style="margin-left: 20px">
        <h5>Bebidas:</h5>
            <select style="width: 200px">
              <option value="agua">Água</option>
              <option value="fanta">Fanta</option>
              <option value="cocacola">Coca-Cola</option>
              <option value="pepsi">Pepsi</option>
            </select>
            <input type="number" name="qtde" min="0" max="20" placeholder="0" style="width: 50px">
            R$:
            
             
        <br> <br> 
        <h5>Forma de Pagamento:</h5>
        <div class="form-check">
          <label class="form-check-label">
            <input class="form-check-input" type="radio" name="formaPagamento" id="dinheiro" value="formaPag1" checked>
            Dinheiro
          </label>
        </div>
        <div class="form-check">
          <label class="form-check-label">
            <input class="form-check-input" type="radio" name="formaPagamento" id="cartao" value="formaPag2">
            Cartão de Crédito
          </label>
        </div>
        
        <h5>Endereço de Entrega:</h5>
        
        </div>
            
        <a href="#" class="btn btn-success">Fazer Pedido</a>
        
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
