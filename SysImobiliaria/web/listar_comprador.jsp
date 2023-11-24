
<%@page import="modelo.Comprador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.CompradorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/demais.css" rel="stylesheet">
        <title>Comprador</title>
    </head>
    <body>
        <div align="center">

            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <h2>Lista de Compradores <a href=form_inserir_comprador.jsp> (novo comprador) </a></h2>
            <table>
                <tr>
                    <td>ID</td>
                    <td>NOME</td>
                    <td>EMAIL</td>
                    <td>CPF</td>
                    <td>TELEFONE</td>
                    <td>ALTERAR</td>
                    <td>EXCLUIR</td>
                </tr>
                <%                                    try {
                        CompradorDAO cDB = new CompradorDAO();
                        ArrayList<Comprador> lista;
                        cDB.conectar();
                        lista = cDB.listar();
                        for (Comprador c : lista) {
                %>
                <tr>
                    <td><%=c.getIdComprador()%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getEmail()%></td>
                    <td><%=c.getCpf()%></td>
                    <td><%=c.getTelefone()%></td>



                    <td ><a href="form_alterar_comprador.jsp?idComprador=<%=c.getIdComprador()%>"><img src="imagens/alterar.png" border="0"></a></td>
                    <td><a href="excluir_comprador.do?idComprador=<%=c.getIdComprador()%>"><img src="imagens/excluir.png" border="0"></a></td>

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
