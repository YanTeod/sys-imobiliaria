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
        <link href="css/demais.css" rel="stylesheet">
        <title>Perfis</title>
    </head>
    <body>
        <div >
            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <h3>Lista de Perfis ( <img src="imagens/novo.png" align="top"><a href="form_inserir_perfil.jsp">Novo</a> )</h3>
            <table>
                <tr>
                    <td>ID</td>
                    <td>PERFIL</td>
                    <td>ALTERAR</td>
                    <td>EXCLUIR</td>
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
                    <td><%=p.getIdPerfil()%></td>
                    <td><%=p.getPerfil()%></td>
                    <td><a href="form_alterar_perfil.jsp?id=<%=p.getIdPerfil()%>"><img src="imagens/alterar.png"></a></td>
                    <td><a href="excluir_perfil.do?id=<%=p.getIdPerfil()%>"><img src="imagens/excluir.png" border="0"></a></td>
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

