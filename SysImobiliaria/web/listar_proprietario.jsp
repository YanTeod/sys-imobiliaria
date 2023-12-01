<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Proprietario"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/listar.css" rel="stylesheet">
        <title>Proprietáriso</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br>
        <div class="opcoes">
            <div class="title">
                <h2>Lista de Imóveis</h2>
                <h3><img src="imagens/adicionar.png"><a href=form_inserir_proprietario.jsp> Novo Proprietário </a><img src="imagens/adicionar.png"></h3>
            </div>
            <br>
            <table>
                <tr>

                    <td>NOME</td>
                    <td>EMAIL</td>
                    <td>CPF</td>
                    <td>TELEFONE</td>
                    <td>STATUS</td>
                    <td>ALTERAR</td>

                </tr>
                <%                                    try {
                        ProprietarioDAO pDB = new ProprietarioDAO();
                        ArrayList<Proprietario> lista;
                        pDB.conectar();
                        lista = pDB.listar();
                        for (Proprietario p : lista) {
                %>
                <tr>

                    <td><%=p.getNome()%></td>
                    <td><%=p.getEmail()%></td>
                    <td><%=p.getCpf()%></td>
                    <td><%=p.getTelefone()%></td>
                    <% if (p.isStatus()) { %>
                    <td>ATIVO</td>  
                    <%  } else {%>
                    <td>INATIVO</td>   
                    <%}%>






                    <td ><a href="form_alterar_proprietario.jsp?idProprietario=<%=p.getIdProprietario()%>"><img src="imagens/alterar.png"></a></td>


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
