<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/aqueles.css" rel="stylesheet">
        <script language="javascript" >
            function validaForm() {
                formulario = document.form_menu;
                if (formulario.menu.value == "") {
                    alert("O Campo menu deve ser preenchido!!");
                    formulario.menu.focus();
                    return false;
                }
                if (formulario.link.value == "") {
                    alert("O Campo link deve ser preenchido!!");
                    formulario.link.focus();
                    return false;
                }
                if (formulario.icone.value == "") {
                    alert("O Campo icone deve ser preenchido!!");
                    formulario.icone.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Inserir Menus</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br><br>
        <div class="opcoes">
            <form name="form_menu" action="inserir_menu.do" method="post" onsubmit="return validaForm();">
                <table>
                    <tr>
                        <td>Menu:</td>
                        <td><input type="text" name="menu" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Link:</td>
                        <td><input type="text" name="link" size="30" /> </td>
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
