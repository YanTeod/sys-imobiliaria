
<%@page import="modelo.Comprador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.CompradorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/listar.css" rel="stylesheet">
        <title>Comprador</title>
    </head>
    <body>
        <div align="center">
            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <br><br><br><br>
            <div class="title">
                <h2>Lista de Compradores</h2>
                <h3><img src="imagens/adicionar.png"><a href=form_inserir_comprador.jsp> Novo Comprador </a><img src="imagens/adicionar.png"></h3>
            </div>
            <br>
            <table>
                <tr>
                
                    <td>NOME</td>
                    <td>EMAIL</td>
                    <td>CPF</td>
                    <td>TELEFONE</td>
                    <td>ALTERAR</td>
                  
                </tr>
                <%                                    try {
                        CompradorDAO cDB = new CompradorDAO();
                        ArrayList<Comprador> lista;
                        cDB.conectar();
                        lista = cDB.listar();
                        for (Comprador c : lista) {
                %>
                <tr>
                   
                    <td><%=c.getNome()%></td>
                    <td><%=c.getEmail()%></td>
                    <td><%=c.getCpf()%></td>
                    <td><%=c.getTelefone()%></td>



                    <td ><a href="form_alterar_comprador.jsp?idComprador=<%=c.getIdComprador()%>"><img src="imagens/alterar.png" border="0"></a></td>
                    

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
