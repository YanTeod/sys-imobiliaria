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
    <nav class="navbar header-top fixed-top navbar-expand-lg  ">
        <div class="login">
            <%
Corretor corretor = new Corretor();
try{
    corretor = (Corretor) session.getAttribute("corretor");
    out.print(corretor.getNomeCorretor()+ " (<a href='sair.jsp'>Sair</a>)");
    if (corretor == null){
        response.sendRedirect("login.jsp");
    }
    %>
        </div>
        <%
        PerfilDAO pDB = new PerfilDAO();
        pDB.conectar();
        ArrayList<Menu> listaMenu = pDB.menusVinculados(corretor.getIdPerfil());
        
        for(Menu m: listaMenu){
        %>
        <div class="home">
            <br>
        <table>
            <nav >
                <a class="navbar-brand" href="<%=m.getLink()%>">
                    <%=m.getMenu()%>
                </a> 
            </nav>
        </table>
                </div>
    </head>
</body>
<%
    }
    pDB.desconectar();
%>
</body>
</html>
<%
    } catch (Exception e) {
        //out.print(e);
        response.sendRedirect("login.jsp");
    }

%>
