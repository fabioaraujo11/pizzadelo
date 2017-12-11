<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Cadastro</title>

        <!-- Bootstrap -->
        <%@include  file="WEB-INF/jspf/boot.jspf"%>
        
    </head>  

    <body class="fundo" >

        <%@include file="WEB-INF/jspf/header.jspf" %>

        <div class="container">
            <div class="row marcador" >
                <div class="col-sm-6">
                    <h3>Cadastre-se</h3>
                    <form>
                        <div class="form-group">
                            <label for="nome">Nome:</label>
                            <input type="text" class="form-control" id="nome">
                        </div>
                        <div class="form-group">
                            <label for="cpf">CPF:</label>
                            <input type="number" class="form-control" id="cpf">
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail:</label>
                            <input type="text" class="form-control" id="email">
                        </div>
                        <div class="form-group">
                            <label for="senha">Senha:</label>
                            <input type="text" class="form-control" id="senha">
                        </div>
                        <div class="checkbox">
                            <label for="sexo">Sexo:</label>
                        </div>
                        <div class="radio" name="sexo">
                            <label>
                                <input type="radio" name="sexo"> Masculino
                            </label>
                            <label>
                                <input type="radio" name="sexo"> Feminino
                            </label>
                        </div>
                        <button type="submit" class="btn btn-default">Salvar</button>
                    </form>
                </div>
                <div class="col-sm-6">
                    <h3>Login</h3>
                    <div class="form-group">
                        <label for="email">E-mail:</label>
                        <input type="text" class="form-control" id="email" placeholder="Digite seu e-mail">
                    </div>
                    <div class="form-group">
                        <label for="senha">Senha:</label>
                        <input type="password" class="form-control" id="senha" placeholder="Digite sua senha">
                    </div>
                    <button type="submit" class="btn btn-primary">Entrar</button>
                </div>
            </div>
        </div>

        <%@include file="WEB-INF/jspf/footer.jspf" %>

    </body>
</html>