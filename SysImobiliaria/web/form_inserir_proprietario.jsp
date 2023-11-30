<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/aqueles.css" rel="stylesheet">
        <script language="javascript" >
            function validaForm() {
                formulario = document.form_usuario;
                if (formulario.nome.value == "") {
                    alert("O Campo nome deve ser preenchido!!");
                    formulario.nome.focus();
                    return false;
                }
                if (formulario.email.value == "") {
                    alert("O Campo Email deve ser preenchido!!");
                    formulario.email.focus();
                    return false;
                }
                if (formulario.cpf.value == "") {
                    alert("O Campo cpf deve ser preenchido!!");
                    formulario.cpf.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Inserir Proprietários</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br>
        <div class="opcoes">
            <form name="form_usuario" action="inserir_proprietario.do" method="post" onsubmit="return validaForm();">
                <table>
                    <tr>
                        <td>Nome:</td>
                        <td><input type="text" name="nome" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Cpf:</td>
                        <td><input type="text" name="cpf" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Telefone:</td>
                        <td><input type="text" name="telefone" size="30" /> </td>
                    </tr>  
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Salvar" /> </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
