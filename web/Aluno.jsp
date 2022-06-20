<%-- 
    Página   : Aluno
    Página criada em : 10 de jun. de 2022, 08:00:23
    Funcionalidade :
    Autor     : Administrador
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->

        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>

        <link href="css/menu.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="imagens/iconeG.png">

        <title>.::GUIOMAR::.</title>

        <style>
            section#inicio{
                /*                        background-image: url("imagens/alunosFundo.jpg");
                                        background-repeat: no-repeat;
                                        background-size: cover;
                                        background-attachment: fixed;
                                        background-position: center;*/
                width: 100%;
                height:100vh; /*tamanho da tela do dispositivo*/

            }
            /*            #container{
                            margin: 0px auto;
                            width: 250px;
                            height: 250px;
                            border: 10px #333 solid;
                        }*/
            #videoElement{
                width: 250px;
                height:250px;
                background-color: #666;
            }
        </style>

    </head>
    <body>

        <%
            String usuario = (String) session.getAttribute("usuario");

            if (usuario == null) {
                response.sendRedirect("Login.jsp");
            } else {
                out.println("Bem vindo, " + usuario + "<br>");
            }
        %>

        <aside id="header">
            <section class="usuario">
                <img class="img_usuario" src="imagens/iconeG.png" alt="Foto do usuário">
                <h1>Foto do usuário</h1>

                <!--ESSE TRECHO É SÓ PARA MOSTRAR O USO DE ÍCONES DO BOOTSTRAP...
                    PARA USAR ESSES ÍCONES, ENTRAR NO SITE DO BOOTSTRAP(INGLÊS), MENU SUPERIOR ICONS..
                    OS PODE-SE BAIXAR O PACOTE DE ÍCONES OU UTILIZAR ONLINE(CDN)..
                    PARA UTILIZAR UM ÍCONE EM ESPECÍFICO, NO SITE, PESQUISE O ICONE, CLICA NELE E NA PÁGINA QUE SE ABRIR
                    TEM OPÇÃO DE DOWNLOAD OU ICON FONT,QUE É SÓ COPIAR O CONTEÚDO <i class="*******"></i> "i" de ícone...-->
                <div class="redes_sociais mt-4 text-center">
                    <!--PARA COLOCAR O ÍCONE, FORAM BAIXADOS, COLOQUEI NUMA PASTA. QUANDO QUERO ALGUM, ENTRO NA PASTA DOS
                        ÍCONES E SELECIONO O QUE QUERO. ELE VAI ABRIR NUMA ABA COM UM <svg></svg> QUE USO COMO ABAIXO...-->

                    <!--***** PARA SABER/VER QUAL O ÍCONE USAR, ENTRAR NA PÁGINA DO BOOTSTRAP ICONES, E VER OU ÍCONES COM OS NOMES
                    DEPOIS VOU NA MINHA LISTA DE ÍCONES DO PROJETO E PESQUISO AQUELE NOME DE ÍCONE QUE ESCOLHI NA PÁGINA-->

                    <a href="#">
                        <svg width="16" height="16" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                        <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
                        </svg>
                    </a>
                    <a href="#">
                        <svg width="16" height="16" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                        <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                        </svg>
                    </a>
                    <a href="#">
                        <svg width="16" height="16" fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
                        <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
                        </svg>
                    </a>
                    <a href="#">
                        <svg width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
                        <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
                        </svg>
                    </a>
                </div>

                <nav id="navbar" class="nav-menu">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"> 
                                <!--ÍCONE AQUI-->
                                Alunos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <!--ÍCONE AQUI-->
                                Consulta</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <!--ÍCONE AQUI-->
                                Listas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="# "data-toggle="modal" data-target="#ModaCadastroAluno">
                                <!--ÍCONE AQUI-->
                                Cadastro</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <!--ÍCONE AQUI-->
                                Matrícula</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <svg width="16" height="16" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
                                <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"/>
                                </svg>
                                Contato</a>
                        </li>

                    </ul>
                </nav>
            </section>
            <footer class="bg-light text-center text-lg-start">
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                    <a class="nav-link" href="Logout.jsp">
                        <!--ÍCONE AQUI-->
                        Sair</a>
                </div>
            </footer>
        </aside>

        <main id="main">
            <!--CABEÇALHO PARA PESQUISA-->
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" id="menuAluno">
                <a class="navbar-brand" href="#">Navbar fixo</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home <span class="sr-only">(atual)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#">Desativado</a>
                        </li>
                    </ul>
                    <form class="form-inline mt-2 mt-md-0">
                        <input class="form-control mr-sm-2" type="text" placeholder="Pesquisa" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Pesquisar</button>
                    </form>
                </div>
            </nav>
            <!--CABEÇALHO PARA PESQUISA-->
            <!-- MODAL CADASTRO DE ALUNO -->
            <div class="modal fade" id="ModaCadastroAluno" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="TituloModalCentralizado">CADASTRO DE ALUNO</h5>
                        </div>
                        <div class="modal-body">
                            <form method="POST" action="controleAluno">
                                <div class="form-row">
                                    <div class="col">
                                        <input type="text" class="form-control" placeholder="RM">
                                    </div>
                                    <div class="col">
                                        <input type="text" name="tfID" class="form-control" placeholder="ID">
                                    </div>
                                    <div class="col">
                                        <input type="text" name="tfRGRA" class="form-control" placeholder="RG_RA">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col">
                                        <input type="text" name="tfNome" class="form-control" placeholder="NOME">
                                    </div>
                                    <div class="col">
                                        <input type="text" name="tfEndereco" class="form-control" placeholder="ENDEREÇO">
                                    </div>
                                    <div class="col">
                                        <input type="text" name="tfTelefone" class="form-control" placeholder="TELEFONE">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                    <button type="submit" class="btn btn-primary" >Gravar</button>
                                </div>

                                <!--TRECHO PARA CAPTURA DE FOTO-->
                                <!--SÓ PARA GUARDAR O VALOR DA FOTO BASE64-->
                                <input type="hidden" name="foto" id="foto" value=""/><br><br>
                                <!--SÓ PARA GUARDAR O VALOR DA FOTO BASE64-->

                                <div id="my_photo_booth">
                                    <div id="my_camera"></div>
                                    <!-- First, include the Webcam.js JavaScript Library -->
                                    <script type="text/javascript" src="js/webcam.min.js"></script>
                                    <!-- Configure a few settings and attach camera -->
                                    <script language="JavaScript">
                                        Webcam.set({
                                            // live preview size
                                            width: 320,
                                            height: 240,
                                            // device capture size
                                            dest_width: 640,
                                            dest_height: 480,
                                            // final cropped size
                                            crop_width: 480,
                                            crop_height: 480,
                                            // format and quality
                                            image_format: 'jpeg',
                                            jpeg_quality: 90,
                                            // flip horizontal (mirror mode)
                                            flip_horiz: true
                                        });
                                        Webcam.attach('#my_camera');
                                    </script>
                                    <!-- A button for taking snaps -->

                                    <div id="pre_take_buttons">
                                        <!-- This button is shown before the user takes a snapshot -->
                                        <input type=button value="Take Snapshot" onClick="preview_snapshot()">
                                    </div>
                                    <div id="post_take_buttons" style="display:none">
                                        <!-- These buttons are shown after a snapshot is taken -->
                                        <input type=button value="&lt; Take Another" onClick="cancel_preview()">
                                        <input type=button value="Save Photo &gt;" onClick="save_photo()" style="font-weight:bold;">
                                    </div>

                                </div>

                                <div id="results" style="display:none">
                                    <!-- Your captured image will appear here... -->
                                </div>
                                <!-- Code to handle taking the snapshot and displaying it locally -->
                                <script language="JavaScript">
                                    // preload shutter audio clip
                                    var shutter = new Audio();
                                    shutter.autoplay = false;
                                    shutter.src = navigator.userAgent.match(/Firefox/) ? 'shutter.ogg' : 'shutter.mp3';

                                    function preview_snapshot() {
                                        // play sound effect
                                        try {
                                            shutter.currentTime = 0;
                                        } catch (e) {
                                            ;
                                        } // fails in IE
                                        shutter.play();

                                        // freeze camera so user can preview current frame
                                        Webcam.freeze();

                                        //document.getElementById("foto").value=data_uri;

                                        // swap button sets
                                        document.getElementById('pre_take_buttons').style.display = 'none';
                                        document.getElementById('post_take_buttons').style.display = '';
                                    }

                                    function cancel_preview() {
                                        // cancel preview freeze and return to live camera view
                                        Webcam.unfreeze();

                                        // swap buttons back to first set
                                        document.getElementById('pre_take_buttons').style.display = '';
                                        document.getElementById('post_take_buttons').style.display = 'none';
                                    }
                                    function save_photo() {
                                        // actually snap photo (from preview freeze) and display it
                                        Webcam.snap(function (data_uri) {
                                            // display results in page
                                            document.getElementById('results').innerHTML = '<h2>Here is your large, cropped image:</h2>' +
                                                    '<img src="' + data_uri + '"/><br/></br>' +
                                                    '<a href="' + data_uri + '" target="_blank">Open image in new window...</a>';
                                            // shut down camera, stop capturing
                                            document.getElementById("foto").value = data_uri;

                                            Webcam.reset();
                                            // show results, hide photo booth
                                            document.getElementById('results').style.display = '';
                                            document.getElementById('my_photo_booth').style.display = 'none';
                                        });
                                    }
                                </script>
                                <br>
                                <!--TRECHO PARA CAPTURA DE FOTO-->

                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!-- MODAL CADASTRO DE ALUNO -->

        </main>

        <a href="Logout.jsp">Logout</a> 
        <!-- JavaScript (Opcional) -->
        <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
        <script src="js/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="js/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>