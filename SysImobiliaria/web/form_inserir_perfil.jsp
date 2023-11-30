<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/aqueles.css" rel="stylesheet">
        <script language="javascript" >
            function validaForm() {
                formulario = document.form_perfil;
                if (formulario.perfil.value == "") {
                    alert("O Campo perfil deve ser preenchido!!");
                    formulario.perfil.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Inserir Perfis</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br><br><br>
        <div class="opcoes">
            <form name="form_perfil" action="inserir_perfil.do" method="post" onsubmit="return validaForm();">
                <table width="500">
                    <tr>
                        <td>Perfil:</td>
                        <td><input type="text" name="perfil" size="30" /> </td>
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
