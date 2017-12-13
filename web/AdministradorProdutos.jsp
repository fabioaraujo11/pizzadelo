<%-- 
    Document   : AdministradorProdutos
    Created on : 11/12/2017, 20:18:10
    Author     : vlf
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@page import="br.com.pizzadelo.web.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    Item itemo = null;

    String erro1 = null;
    if (request.getParameter("rmv") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            Item.deletaItem(id);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            erro1 = e.getMessage();
        }
    }
    if (request.getParameter("add") != null) {
        String tipo = request.getParameter("tipo");
        String pizza = "PIZZA";

        double preco1 = Double.parseDouble(request.getParameter("preco"));
        String descricao = request.getParameter("descricao");
        String nome1 = request.getParameter("nome1");
        try {
            if (tipo.equals(pizza)) {
                Item.inserirPizza(preco1, descricao, nome1);
                response.sendRedirect(request.getRequestURI());
            } else {
                Item.inserirBebida(preco1, descricao, nome1);
            }
            response.sendRedirect(request.getRequestURI());

        } catch (Exception e) {
            erro1 = e.getMessage();
        }
    }

    if (request.getParameter("Editar") != null) {
        int cd = Integer.parseInt(request.getParameter("id"));
        double vl = Double.parseDouble(request.getParameter("precomodal"));
        String ds = request.getParameter("descricaomodal");
        String nm = request.getParameter("nomemodal");
        String tp = request.getParameter("tipomodal");
       
        Item.editaItem(cd, vl, ds, nm, tp);
    }

%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Administrador - Itens</title>

    </head>
    <style>
        #formContainer{
            width: 35%;
            height: auto;
            position: relative;
            padding: 1%;
            left: 20%;
            margin-left: -17.5%;
        }
        #formContainer form input{
            margin: 1% 0 1% 0;
        }
        #formContainer form input[type="text"]{
            width: 100%;
            position: relative;
            box-sizing: border-box;
        }
        #formContainer form input[type="number"]{
            width: 29.5%;
            position: relative;
            float: left;
            box-sizing: border-box;
        }
        #formContainer form select{
            width: 69.5%;
            position: relative;
            float: right;
            margin: 1% 0 1% 0;
            padding: 0.7% 0 0.7% 0;
            box-sizing: border-box;
        }
        #pizza {

            width: 45%;
            height: auto;
            position: relative;
            padding: 1%;
            left: 20%;
            margin-left: -17.5%;
        }
        #td {
            background-color: white;
        }
    </style>
    <body background="images/pizzaaa.jpg">
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container">
            <div class="row" >                
                <div id="formContainer">
                    <form>
                        <input placeholder="Nome do item" type="text" name="nome1"  required/>
                        <input type="number" placeholder="Preço R$" name="preco" required="">

                        <select name="tipo" required="">
                            <option value="PIZZA">PIZZA</option>
                            <option value="BEBIDA">BEBIDA</option>     
                        </select>
                        <br/>
                        <div class="form-group">
                            <textarea placeholder="Descriçao do Produto" class="form-control" id="exampleTextarea" name="descricao" rows="2" required=""></textarea>
                        </div>

                        <button type="submit" name="add">Adicionar Item</button><br/>

                    </form>
                </div>

            </div>

            <div class="row container">
                <div class="col-xs-6">            
                    <table class="table table-hover">
                        <h2 style="text-align: left; color : white;">Pizzas</h2><br/>    
                        <tr>
                        <thead style="background-color: white;">
                        <th>Produto</th>
                        <th>Preço</th>
                        <th>Descrição</th>
                        <th>Remover</th>
                        <th>Editar</th>
                        </thead>
                        </tr>
                        <%
                            ArrayList<Item> itens = Item.getPizzaList(); 
                            for (Item lista : itens) {
                               
                        %>
                        <tr id="td">    
                            <td ><%=lista.getNm_item()%></td>
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
                                    <button type="button" name="edt" data-toggle="modal" data-target="#myModal">Editar</button>

                                </form>
                            </td>
                        </tr>
                        <% }
                        %>
                    </table>
                    <br/>
                </div>

                <div class="col-xs-6">

                    <table class="table table-hover">
                        <h2 style="text-align: left; color : white;">Bebidas</h2><br/> 
                        <tr>
                        <thead style="background-color: white">
                        <th>Produto</th>
                        <th>Preço</th>
                        <th>Descrição</th>
                        <th>Remover</th>
                        <th>Editar</th>
                        </thead>
                        </tr>
                        <%for (int i = 0; i < Item.getBebidaList().size(); i++) {
                                Item lista = Item.getBebidaList().get(i);
                        %>
                        <tr id="td">
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
                                    <button type="button" method name="edt"  data-toggle="modal" data-target="#myModal">Editar</button>
                                </form>
                            </td>
                        </tr>
                        <% }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </div>



    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">


                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Editar Item</h4>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">                
                            <div id="formContainer">
                                <form>
                                    <input placeholder="Nome do item" type="text" name="nomemodal" value="" required/>
                                    <input type="number" placeholder="Preço R$" name="precomodal" value="" required="">
                                    <select name="tipomodal" required="" selected="">
                                        <option value="PIZZA">PIZZA</option>
                                        <option value="BEBIDA">BEBIDA</option>     
                                    </select>
                                    <br/>
                                    <div class="form-group">
                                        <textarea placeholder="Descriçao do Produto"  class="form-control" id="exampleTextarea" name="descricaomodal" rows="2" required=""></textarea>
                                    </div>
                                    <input type="hidden" name="id" value="  ">
                                    <button type="submit" name="Editar">Salvar Alteração</button><br/>

                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>