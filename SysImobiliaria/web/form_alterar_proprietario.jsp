<%@page import="modelo.Proprietario"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/aqueles.css" rel="stylesheet">
        <script language="javascript" >
            function validaForm() {
                formulario = document.form_proprietario;
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

        <title>Alterar Proprietários</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br>
        <div class="opcoes">
            <h2>Alterando Proprietário</h2>
            <form name="form_proprietario" action="alterar_proprietario.do" method="post" onsubmit="return validaForm();">
                <table>
                    <%                                        int idProprietario = Integer.parseInt(request.getParameter("idProprietario"));
                        try {
                            ProprietarioDAO pDB = new ProprietarioDAO();
                            pDB.conectar();
                            Proprietario proprietario = pDB.carregarPorId(idProprietario);
                            pDB.desconectar();
                            if (proprietario.getIdProprietario() > 0) {
                    %>
                    <tr>

                        <td><input type="hidden" name="idProprietario" value="<%=proprietario.getIdProprietario()%>"> </td>
                    </tr>
                    <tr>
                        <td>Nome:</td>
                        <td>
                            <input type="text" name="nome" value="<%=proprietario.getNome()%>" size="60">
                        </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>
                            <input type="text" name="email" value="<%=proprietario.getEmail()%>" size="60">
                        </td>
                    </tr>
                    <tr>
                        <td>CPF:</td>
                        <td><input type="text" name="cpf" value="<%=proprietario.getCpf()%>"  size="30" /> </td>
                    </tr>
                    <tr>
                        <td>TELEFONE:</td>
                        <td><input type="text" name="telefone" value="<%=proprietario.getTelefone()%>"  size="30" /> </td>
                    </tr>
                    <tr>
                        <td>ATIVO:</td>
                        <% if (proprietario.isStatus()) { %>
                        <td><input type="checkbox" name="status" checked /></td>
                            <%} else { %>
                        <td><input type="checkbox" name="status"  /></td>
                            <% }%>

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
