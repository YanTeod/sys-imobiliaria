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
        <link href="css/listar.css" rel="stylesheet">
        <title>Corretores</title>
    </head>
    <body>
        <div>

            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br>
        <div class="opcoes">
            <div class="title">
                <h2>Lista de Corretores</h2>
                <h3><img src="imagens/adicionar.png"><a href="form_inserir_corretor.jsp"> Novo Corretor </a><img src="imagens/adicionar.png"></h3>
            </div>
            <br>
            <table>
                <tr>
                                                
                    <td>NOME</td>
                    <td>LOGIN</td>
                    <td>PERFIL</td>
                    <td>ALTERAR</td>
                 
                </tr>
                <%                                 try {
                        CorretorDAO cDB = new CorretorDAO();
                        ArrayList<Corretor> lista;
                        cDB.conectar();
                        lista = cDB.listar();
                        for (Corretor c : lista) {
                %>
                <tr>
                    
                    <td><%=c.getNomeCorretor()%></td>
                    <td><%=c.getLogin()%></td>
                    <td><%=c.getPerfil()%></td>
                    <td><a href="form_alterar_corretor.jsp?idCorretor=<%=c.getIdCorretor()%>"><img src="imagens/alterar.png"></a></td>
                 
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

