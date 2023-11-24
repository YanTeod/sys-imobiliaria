<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Proprietario"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/demais.css" rel="stylesheet">
        <title>Proprietáriso</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <h2>Lista de Proprietário <a href=form_inserir_proprietario.jsp> (novo proprietário) </a></h2>
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
                        ProprietarioDAO pDB = new ProprietarioDAO();
                        ArrayList<Proprietario> lista;
                        pDB.conectar();
                        lista = pDB.listar();
                        for (Proprietario p : lista) {
                %>
                <tr>
                    <td><%=p.getIdProprietario()%></td>
                    <td><%=p.getNome()%></td>
                    <td><%=p.getEmail()%></td>
                    <td><%=p.getCpf()%></td>
                    <td><%=p.getTelefone()%></td>
                    <td ><a href="form_alterar_proprietario.jsp?idProprietario=<%=p.getIdProprietario()%>"><img src="imagens/alterar.png"></a></td>
                    <td ><a href="excluir_proprietario.do?idProprietario=<%=p.getIdProprietario()%>"><img src="imagens/excluir.png"></a></td>

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
