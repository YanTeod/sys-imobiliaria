<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/login.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<html>
    <head>
        <title>Acesso Restrito</title>
        <script language="javascript" >
            function validaForm() {
                formulario = document.form_login;
                if (formulario.login.value == "") {
                    alert("O Campo login deve ser preenchido!!");
                    formulario.login.focus();
                    return false;
                }
                if (formulario.senha.value == "") {
                    alert("O Campo senha deve ser preenchido!!");
                    formulario.senha.focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <form action="efetuar_login.do" method="post" name="form_login" onsubmit="return validaForm();">
            <section class="login-block">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 login-sec">
                            <h2 class="text-center">Login</h2>
                            <form class="login-form">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="text-uppercase">Usuário</label>
                                    <input type="text" name="login" size="20" class="form-control" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="text-uppercase">Senha</label>
                                    <input type="password" name="senha" size="20" class="form-control" placeholder="">
                                </div>
                                <div class="form-check">                                   
                                    <button type="submit" class="btn btn-login float-right">Logar</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-8 banner-sec">
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <img class="d-block img-fluid" src="https://www.creci-sc.gov.br/c/10266/235631-corretor-de-imoveis-por-que-contar-com-a-ajuda-desse-profissional.jpg" alt="First slide">
                                        <div class="carousel-caption d-none d-md-block">
                                            <div class="banner-text">
                                                <h2>Helenice Catarina</h2>
                                                <p>Corretora de imóveis desde 1996. Especialista em venda, permutas, avaliações e principalmente em processos de financiamento imobiliário junto a todos os bancos do sistema financeiro habitacional inclusive consórcios. CRECI DF 6326</p>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block img-fluid" src="https://blog.quadraimob.com.br/wp-content/uploads/2021/03/corretor-de-imoveis-780x450.jpeg" alt="First slide">
                                        <div class="carousel-caption d-none d-md-block">
                                            <div class="banner-text">
                                                <h2>Política da Qualidade</h2>
                                                <p>Visamos prestar serviços imobiliários de excelência, atendendo às expectativas dos nossos clientes e contribuindo para o desenvolvimento de nossa cidade</p>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block img-fluid" src="https://www.ibresp.com.br/wp-content/uploads/2017/02/corretor-de-imoveis.jpg" alt="First slide">
                                        <div class="carousel-caption d-none d-md-block">
                                            <div class="banner-text">
                                                <h2>Avaliação de imóveis</h2>
                                                <p>Corretora preparada para realizar uma ágil e justa avaliação, divulgar de maneira eficaz, negociar e acompanhar todo o processo de escritura e registro junto aos cartórios.</p>
                                            </div>	
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>
    </body>
</html>
