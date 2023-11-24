<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/index.css" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <title>Página Principal</title>
    </head>
    <body>

        <div>

            <%@include file="menu.jsp" %>

        </div>


    <header>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <!-- Slide One - Set the background image for this slide in the line below -->
                <div class="carousel-item active" style="background-image: url('https://www.contact2sale.com/wp-content/uploads/2022/02/corretagem-de-imoveis.jpg')">
                    <div class="carousel-caption d-none d-md-block">
                        <h2 class="display-4">Corretora Imóbiliária</h2>
                        <p class="lead">Credenciada pelo Conselho Regional de Corretores de Imóveis (Creci) para atuar tanto na intermediação de venda ou locação de imóveis quanto na administração de imóveis locados.</p>
                    </div>
                </div>
                <!-- Slide Two - Set the background image for this slide in the line below -->
                <div class="carousel-item" style="background-image: url('https://www.ibresp.com.br/wp-content/uploads/2017/02/corretor-de-imoveis.jpg')">
                    <div class="carousel-caption d-none d-md-block">
                        <h2 class="display-4">Helenice Catarina</h2>
                        <p class="lead">Especializada na intermediação de imóveis novos e usados e na gestão estratégica de lançamentos imobiliários.</p>
                    </div>
                </div>
                <!-- Slide Three - Set the background image for this slide in the line below -->
                <div class="carousel-item" style="background-image: url('https://blog.quadraimob.com.br/wp-content/uploads/2021/03/corretor-de-imoveis-780x450.jpeg')">
                    <div class="carousel-caption d-none d-md-block">
                        <h2 class="display-4">Credibilidade</h2>
                        <p class="lead">Credibilidade se conquista com grandes realizações.</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </header>

    <!-- Page Content -->
    <section class="py-5 text-center">
        <div class="container"> 
            <h2 class="text-center">Helenice Catarina</h2>
            <p class="text-muted mb-5 text-center">Corretora de imóveis desde 1996. Especialista em venda, permutas, avaliações e principalmente em processos de financiamento imobiliário junto a todos os bancos do sistema financeiro habitacional inclusive consórcios. CRECI DF 6326.</p>
            <div class="row">
                <div class="col-sm-6 col-lg-4 mb-3">
                    <svg class="lnr text-primary services-icon">
                        <use xlink:href="#lnr-magic-wand"></use>
                    </svg>
                    <h6>Os melhores imóveis novos ou usados</h6>
                    <p class="text-muted">Temos uma preciosa carteira de imóveis usados, compondo um amplo e qualificado portfólio de imóveis na planta ou prontos.</p>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3">
                    <svg class="lnr text-primary services-icon">
                        <use xlink:href="#lnr-heart"></use>
                    </svg>
                    <h6>Assessoria completa durante toda a jornada de Compra ou Venda</h6>
                    <p class="text-muted">Assessoramos nossos clientes em toda a jornada de compra ou venda imobiliária, desde a busca pelo melhor negócio, passando pela aprovação de crédito (caso necessário) e culminando na assistência jurídica e legal.</p>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3">
                    <svg class="lnr text-primary services-icon">
                        <use xlink:href="#lnr-rocket"></use>
                    </svg>
                    <h6>Avalie e anuncie seu imóvel de graça</h6>
                    <p class="text-muted">Preparada para realizar uma ágil e justa avaliação, divulgar de maneira eficaz, negociar e acompanhar todo o processo de escritura e registro junto aos cartórios.</p>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3">
                    <svg class="lnr text-primary services-icon">
                        <use xlink:href="#lnr-paperclip"></use>
                    </svg>
                    <h6>Forte presença Online</h6>
                    <p class="text-muted"> nossa atuação online é intensa e muito eficaz nas redes sociais, blog e site da imobiliária.</p>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3">
                    <svg class="lnr text-primary services-icon">
                        <use xlink:href="#lnr-screen"></use>
                    </svg>
                    <h6>Tecnologia que faz toda a diferença</h6>
                    <p class="text-muted">Contamos, ainda, com diversos parceiros que provém tecnologia de ponta para garantir uma experiência de consumo incrível para você.</p>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3">
                    <svg class="lnr text-primary services-icon">
                        <use xlink:href="#lnr-inbox"></use>
                    </svg>
                    <h6>Respeito pelo seu patrimônio</h6>
                    <p class="text-muted">A gente sabe que fechar negócios imobiliários é um passo muito importante para todos. Ao confiar em nossa assessoria você contará com uma completa estrutura jurídica e comercial para te dar todo suporte necessário.</p>
                </div>
            </div>
        </div>
    </section>
    <section class="main">
        <div class="container mt-4">
            <h1 class="text-center mb-4 p-4 text-secondary">Avaliações</h1>
            <div class="row">

                <div class="card-columns">
                    <div class="card shadow border-0">
                        <img class="card-img-top" src="https://lh3.googleusercontent.com/a-/ALV-UjUyMzMxhDAO0oXmZqD7ySIAz4abmhDK2sIa49xKMRURKoE=w60-h60-p-rp-mo-ba4-br100" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Elaine Ribeiro dos Santos Mascarenhas</h5>
                            <p class="card-text">Amei!! Ela é prestativa, disponibiliza tempo para o atendimento, esclarecimentos e atenção. Não mediu esforços para trazer o que eu pedi e  precisava.  Profissional que faz a diferença!! Super índico..</p>
                            <p class="card-text"><small class="text-muted">https://maps.app.goo.gl/mVYBtkutgsfEMMnt9</small></p>
                        </div>
                    </div>

                    <div class="card shadow border-0">
                        <img class="card-img-top" src="https://lh3.googleusercontent.com/a-/ALV-UjV7bLGGePcqzzJi4Dw1mgZbHuu0AGQudn-HOGsYj569wyY=w60-h60-p-rp-mo-br100" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Carmen Ayres</h5>
                            <p class="card-text">Sempre fui super bem tratada, muito educada e gentil. Comprometida em me auxiliar em tudo que precisei. Excelente profissional.  Dou nota dez!</p>
                            <p class="card-text"><small class="text-muted">https://maps.app.goo.gl/LKk8nHwG7m4aAL2BA</small></p>
                        </div>
                    </div>
                    <div class="card shadow border-0">
                        <img class="card-img-top" src="https://lh3.googleusercontent.com/a-/ALV-UjX1lw0vT-7uD2TCZ3wkqC2HqPbr96JWzMG8xquivUJt7ZyZ=w60-h60-p-rp-mo-br100">
                        <div class="card-body">
                            <h5 class="card-title">Israel S. C.</h5>
                            <p class="card-text">Profissional de excelência! Toda o suporte necessário para a compra de um imóvel!</p>
                            <p class="card-text"><small class="text-muted">https://maps.app.goo.gl/LKk8nHwG7m4aAL2BA</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <blockquote class="blockquote text-center mb-0">
                    <svg class="lnr text-muted quote-icon pull-left">
                        <use xlink:href="#lnr-heart">                                       
                        </use></svg>
                    <p class="mb-0">Protótipo em desenvolvimento</p>
                    <footer class="blockquote-footer">Alunos:
                        <cite title="Source Title">Albert, Irineu, Jean, Paulo e Yan</cite>
                    </footer>
                </blockquote>
            </div>
            <div class="col-md-4">
                <a class="flot-right btn btn-white border-0 rounded shadow post-pager-link p-0 next ml-4" href="">
                    <span class="d-flex h-100">
                        <span class="p-3 d-flex flex-column justify-content-center w-100">
                            <div class="indicator mb-1 text-uppercase text-muted">Clique para voltar ao início<i class="fa fa-bars ml-2"></i></div>
                            <p class="f-13">Início</p>
                        </span>
                        <span class="bg-primary p-2 d-flex align-items-center text-white">
                            <i class="fa fa-arrow-circle-right"></i>
                        </span>
                    </span>
                </a></div>
        </div>

    </div>


</body>
</html>

