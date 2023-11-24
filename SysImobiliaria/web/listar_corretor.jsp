<%@page import="modelo.Corretor"%>
<%@page import="modelo.CorretorDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/demais.css" rel="stylesheet">
        <title>Corretores</title>
    </head>
    <body>
        <div>

            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <h3>Lista de Corretores ( <img src="imagens/novo.png" align="top"><a href="form_inserir_corretor.jsp">Novo</a> )</h3>
            <table>
                <tr>
                    <td>ID</td>                               
                    <td>NOME</td>
                    <td>LOGIN</td>
                    <td>PERFIL</td>
                    <td>ALTERAR</td>
                    <td>EXCLUIR</td>
                </tr>
                <%                                 try {
                        CorretorDAO cDB = new CorretorDAO();
                        ArrayList<Corretor> lista;
                        cDB.conectar();
                        lista = cDB.listar();
                        for (Corretor c : lista) {
                %>
                <tr>
                    <td><%=c.getIdCorretor()%></td>
                    <td><%=c.getNomeCorretor()%></td>
                    <td><%=c.getLogin()%></td>
                    <td><%=c.getPerfil()%></td>
                    <td><a href="form_alterar_corretor.jsp?idCorretor=<%=c.getIdCorretor()%>"><img src="imagens/alterar.png"></a></td>
                    <td><a href="excluir_corretor.do?idCorretor=<%=c.getIdCorretor()%>"><img src="imagens/excluir.png"></a></td>
                </tr>
                <%
                        }
                        cDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
            </table>
        </div>
    </body>
</html>

