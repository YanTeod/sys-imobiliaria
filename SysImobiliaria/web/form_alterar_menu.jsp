<%@page import="modelo.Menu"%>
<%@page import="modelo.MenuDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/demais.css" rel="stylesheet">
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
        <title>Alterar Menus</title>
    </head>
    <body>
        <div>
            @include file="menu.jsp"
        </div>
        <div class="opcoes">
            <h2>Alterando Menu</h2>
            <form name="form_menu" action="alterar_menu.do" method="post" onsubmit="return validaForm();">
                <table>
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        try {
                            MenuDAO mDB = new MenuDAO();
                            mDB.conectar();
                            Menu m = mDB.carregaPorId(id);
                            mDB.desconectar();
                            if (m.getIdMenu() > 0) {
                    %>
                    <tr>
                        <td>ID:</td>
                        <td><%=m.getIdMenu()%> <input type="hidden" name="id" value="<%=m.getIdMenu()%>"> </td>
                    </tr>
                    <tr>
                        <td>Menu:</td>
                        <td>
                            <input type="text" name="menu" value="<%=m.getMenu()%>" size="60">
                        </td>
                    </tr>
                    <tr>
                        <td>Link:</td>
                        <td>
                            <input type="text" name="link" value="<%=m.getLink()%>" size="60">
                        </td>
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
