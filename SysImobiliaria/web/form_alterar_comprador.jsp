<%@page import="modelo.Comprador"%>
<%@page import="modelo.CompradorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/demais.css" rel="stylesheet">
        <script language="javascript" >
            function validaForm() {
                formulario = document.form_comprador;
                if (formulario.nome.value == "") {
                    alert("O Campo Nome deve ser selecionado!!");
                    formulario.nome.focus();
                    return false;
                }
                if (formulario.email.value == "") {
                    alert("O Campo Email deve ser preenchido!!");
                    formulario.email.focus();
                    return false;
                }
                if (formulario.cpf.value == "") {
                    alert("O Campo Cpf deve ser preenchido!!");
                    formulario.cpf.focus();
                    return false;
                }
                if (formulario.telefone.value == "") {
                    alert("O Campo Telefone deve ser preenchido!!");
                    formulario.telefone.focus();
                    return false;
                }


                return true;
            }
        </script>
        <title>Alterar Compradores</title>
    </head>
    <body>
        <div>

            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <h2>Alterando Comprador</h2>
            <form name="form_comprador" action="alterar_comprador.do" method="post" onsubmit="return validaForm();">
                <br><br>
                <table>
                    <%                                        int idComprador = Integer.parseInt(request.getParameter("idComprador"));
                        try {
                            CompradorDAO cDB = new CompradorDAO();
                            cDB.conectar();
                            Comprador comprador = cDB.carregarPorId(idComprador);
                            cDB.desconectar();
                            if (comprador.getIdComprador() > 0) {
                    %>
                    <tr>
                        <td>ID:</td>
                        <td><%=comprador.getIdComprador()%> <input type="hidden" name="idComprador" value="<%=comprador.getIdComprador()%>"> </td>
                    </tr>
                    <tr>
                        <td>Nome:</td>
                        <td>
                            <input type="text" name="nome" value="<%=comprador.getNome()%>" size="60">
                        </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>
                            <input type="text" name="email" value="<%=comprador.getEmail()%>" size="60">
                        </td>
                    </tr>
                    <tr>
                        <td>CPF:</td>
                        <td><input type="text" name="cpf" value="<%=comprador.getCpf()%>"  size="30" /> </td>
                    </tr>
                    <tr>
                        <td>TELEFONE:</td>
                        <td><input type="text" name="telefone" value="<%=comprador.getTelefone()%>"  size="30" /> </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td><input type="submit" value="Alterar"></td>
                    </tr>
                    <%
                            }
                        } catch (Exception erro) {
                            out.print(erro);
                        }
                    %>
                </table>
            </form>
        </div>
    </body>
</html>
