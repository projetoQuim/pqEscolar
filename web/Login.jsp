<%-- 
    Página   : Login
    Página criada em : 3 de jun. de 2022, 09:41:39
    Funcionalidade :
    Autor     : Administrador
--%>

<%@page import="crud.usuarioCRUD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link href="css/estiloLogin.css" rel="stylesheet" type="text/css"/>
        <!--<link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <link rel="icon" href="imagens/iconeG.png">

        <title>.::GUIOMAR::.LOGIN</title>
    </head>
    <body>

        <style>
            body{
                background: url(imagens/escola3_site.png);
                background-size: cover;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

        </style>
        <!--<img src="imagens/escola3_site.png" class="img-fluid rounded mx-auto d-block shadow-lg p-3 mb-5" alt="Imagem responsiva">-->

        <div class="container">

            <h2>Login</h2>
            <form action="Login.jsp" method="post" autocomplete="off">
                <div class="input-field">
                    <input type="text" id="nome" name="tfUsuario" autocomplete="false" placeholder="alguma coisa">
                    <label for="nome">Nome:</label>
                </div>
                <div class="input-field">
                    <input type="password" id="senha" name="tfSenha" placeholder="alguma coisa">
                    <label for="senha">Senha:</label>
                </div>
                <div class="center">
                    <button>Entrar</button>
                </div>
            </form>
            <%
                usuarioCRUD usuariocrud = new usuarioCRUD();
                String usuario = request.getParameter("tfUsuario");
                String senha = request.getParameter("tfSenha");
                boolean logar = false;

                if (usuario != null && senha != null && !usuario.isEmpty() && !senha.isEmpty()) {
                    logar = usuariocrud.verificaUsuario(usuario, senha);
                }
                if (logar) {
                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("Inicio.jsp");
                }
            %>
            <div class="links-uteis">
                <a href=""><p>Esqueceu a sua senha ?</p></a>
                <a href=""><p>Ainda não sou cadastrado</p></a>
                <a href="index.html"><p>Voltar</p></a>
                
            </div>
        </div>

        <ul class="nav justify-content-center">
            <li class="nav-item">
                <a class="nav-link active" href="index.html">Voltar</a>
            </li>
        </ul>

        <!-- JavaScript (Opcional) -->
        <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
        <script src="js/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="js/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>