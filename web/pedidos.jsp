<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="br.com.pizzadelo.web.Pedido"%>
<%@page import="br.com.pizzadelo.web.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try {
    if(request.getParameter("Enviar").equals("Realizar Venda")) {
        int cpf_user = 123456789; // colocar session
        String[] x = request.getParameterValues("item");
        ArrayList<Item> itens = new ArrayList<>();
        for(int i = 0; i < x.length; i++) {
            Item itemx = Item.getItemByName(x[i]);
            Item item = new Item(
                    itemx.getCd_item(),
                    itemx.getVl_item(),
                    itemx.getDs_item(),
                    itemx.getNm_item(),
                    itemx.getTipo_item()
            );
            itens.add(item);
        }
        Date dt_pedido = new Date();
        double vl_total_pedido = 10;
        Pedido pedido = new Pedido(1, cpf_user, vl_total_pedido, dt_pedido, "A FAZER" ,itens);
        pedido.SalvarPedido();
    }
}
catch(Exception ex) {
  %>
  <h1>FUDEU</h1>  
<%}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Realizar Pedido</title>
        
        <%@include  file="WEB-INF/jspf/boot.jspf"%>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
         <div class="row">
             <div class="container"><h2>Faça seu pedido</h2></div>
         </div>
         <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-5">
                <div class="container">
                    <br>
                    <h3>Escolha suas pizzas</h3>
                    <input list="pizzas" id="pizza">
                    <datalist id="pizzas">
                    <%for(int i = 0; i < Item.getPizzaList().size(); i++) {
                        Item lista = Item.getPizzaList().get(i);%>
                        <option value="<%=lista.getNm_item()%>">
                        <input type="hidden" id="<%=lista.getNm_item()%>" value="<%=lista.getVl_item()%>">
                    <%}%>
                    </datalist>
                    <button class="btn-primary" onclick="AdicionarPizza()">Adicionar</button>
                </div> 
            </div>
            <div class="col-md-5">
                <div class="container">
                    <br>
                    <h3>Escolha suas bebidas</h3>
                    <input list="bebidas" id="bebida">
                    <datalist id="bebidas">
                    <%for(int i = 0; i < Item.getBebidaList().size(); i++) {
                        Item lista = Item.getBebidaList().get(i);%>
                        <option value="<%=lista.getNm_item()%>">
                        <input type="hidden" id="<%=lista.getNm_item()%>" value="<%=lista.getVl_item()%>">
                    <%}%>
                    </datalist>
                    <button class="btn-primary" onclick="AdicionarBebida()">Adicionar</button>
                </div> 
            </div>
         </div>
        <div class="row">
            <div class="container">
                <br>
                <br>
                <form>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Valor</th>
                        </tr>
                    </thead>
                    <tbody id="tbitem">
                    </tbody>
                </table>
                    <center><input type="submit" class="btn-primary btn-lg" name="Enviar" value="Realizar Pedido"></center>
                </form>
                <h3>Total: R$</h3><h3 id="preco">0.00</h3>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
<script type="text/javascript">
    function AdicionarBebida() {    
        bebida = document.getElementById("bebida").value;
        valor = document.getElementById(document.getElementById("bebida").value).value;
        table = document.getElementById("tbitem");
        total = Number(document.getElementById("preco").innerHTML);
        //
        document.getElementById("preco").innerHTML = total + Number(valor);
        //
        linha = document.createElement("tr");
        nome = document.createElement("td");
        nome_input = document.createElement("input");
        preco = document.createElement("td");
        //
        nome.innerHTML = bebida;
        nome_input.type = "hidden";
        nome_input.name = "item";
        nome_input.value = bebida;
        
        preco.innerHTML = valor;
        //
        linha.appendChild(nome);
        linha.appendChild(preco);
        linha.appendChild(nome_input);
        table.appendChild(linha);
        
    }
    function AdicionarPizza() {
        bebida = document.getElementById("pizza").value;
        valor = document.getElementById(document.getElementById("pizza").value).value;
        table = document.getElementById("tbitem");
        total = Number(document.getElementById("preco").innerHTML);
        //
        document.getElementById("preco").innerHTML = total + Number(valor); 
        
        //
        linha = document.createElement("tr");
        nome = document.createElement("td");
        nome_input = document.createElement("input");
        preco = document.createElement("td");
        //
        nome.innerHTML = bebida;
        nome_input.type = "hidden";
        nome_input.name = "item";
        nome_input.value = bebida;
        
        preco.innerHTML = valor;
        //
        linha.appendChild(nome);
        linha.appendChild(preco);
        linha.appendChild(nome_input);
        table.appendChild(linha);
    }
</script>