<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/listar.css" rel="stylesheet">
        <title>Perfis</title>
    </head>
    <body>
        <div >
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br>
        <div class="opcoes">
            <div class="title">
                <h2>Lista de Perfis</h2>
                <h3><img src="imagens/adicionar.png"><a href="form_inserir_perfil.jsp"> Novo Perfil </a><img src="imagens/adicionar.png"></h3>
            </div>
            <br>
            <table>
                <tr>
                 
                    <td>PERFIL</td>
                    <td>ALTERAR</td>
                
                    <td>GERENCIAR MENUS</td>
                </tr>
                <%     
                    try {
                        PerfilDAO pDB = new PerfilDAO();
                        ArrayList<Perfil> lista;
                        pDB.conectar();
                        lista = pDB.listar();
                    for (Perfil p : lista) {
                %>
                <tr>
                <tr>
                  
                    <td><%=p.getPerfil()%></td>
                    <td><a href="form_alterar_perfil.jsp?id=<%=p.getIdPerfil()%>"><img src="imagens/alterar.png"></a></td>
                   
                    <td><a href="form_gerenciar_menu_perfil.jsp?id=<%=p.getIdPerfil()%>"><img src="imagens/gerenciar.png"></a></td>
                </tr>
                <%
                        }
                        pDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
            </table>
        </div>
    </body>
</html>

