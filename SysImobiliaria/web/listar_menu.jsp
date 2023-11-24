<%@page import="modelo.Menu"%>
<%@page import="modelo.MenuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/demais.css" rel="stylesheet">
        <title>Menus</title>
    </head>
    <body>
        <div>

            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <h3>Lista de Menus ( <img src="imagens/novo.png" align="top"><a href="form_inserir_menu.jsp">Novo</a> )</h3>
            <table>
                <tr>
                    <td>ID</td>
                    <td>MENU</td>
                    <td>LINK</td>
              
                    <td>ALTERAR</td>
                    <td>EXCLUIR</td>
                </tr>
                <%                                    try {
                        MenuDAO mDB = new MenuDAO();
                        ArrayList<Menu> lista;
                        mDB.conectar();
                        lista = mDB.listar();
                        for (Menu m : lista) {
                %>
                <tr >
                    <td><%=m.getIdMenu()%></td>
                    <td><%=m.getMenu() %></td>
                    <td><%=m.getLink() %></td>
               
                    <td><a href="form_alterar_menu.jsp?id=<%=m.getIdMenu()%>"><img src="imagens/alterar.png"></a></td>
                    <td><a href="excluir_menu.do?id=<%=m.getIdMenu()%>"><img src="imagens/excluir.png" border="0"></a></td>
                </tr>
                <%
                        }
                        mDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
            </table>
        </div>
    </body>
</html>

