<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Corretor"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/menu.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<html lang="pt-br" dir="ltr">

    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title></title>
    </head>

    <body>
        <nav class="navbar header-top fixed-top navbar-expand-lg">
            <div class="home">
                <br>
                <table >
                    <div class="navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li>
                                <img src="imagens/logo.png">
                            </li>
                            <%
                                Corretor corretor = new Corretor();
                                try {
                                    corretor = (Corretor) session.getAttribute("corretor");
                                    if (corretor == null) {
                                        response.sendRedirect("login.jsp");
                                    }
                            %>
                            <%
                                PerfilDAO pDB = new PerfilDAO();
                                pDB.conectar();
                                ArrayList<Menu> listaMenu = pDB.menusVinculados(corretor.getIdPerfil());

                                for (Menu m : listaMenu) {
                            %>
                            
                            <li class="li">
                                <a class="nav-link" href="<%=m.getLink()%>">
                                    <%=m.getMenu()%>
                                </a>
                            </li>
                            <%
                                }
                                pDB.desconectar();
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="sair.jsp">
                                    Sair
                                </a>
                            </li>
                        </ul>
                    </div>
                </table>
            </div>
        </nav>
    </body>

    <%
        } catch (Exception e) {
            //out.print(e);
            response.sendRedirect("login.jsp");
        }
    %>

</html>
