<%@page import="modelo.Perfil"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
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
        <title>Alterar Perfis</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br><br>
        <div class="title">
            <h2>Alterando Perfil</h2>
        </div>
        <div class="opcoes">
            <form name="form_perfil" action="alterar_perfil.do" method="post" onsubmit="return validaForm();">
                <table>
                    <%                        int id = Integer.parseInt(request.getParameter("id"));
                        try {
                            PerfilDAO pDB = new PerfilDAO();
                            pDB.conectar();
                            Perfil p = pDB.carregaPorId(id);
                            pDB.desconectar();
                            if (p.getIdPerfil() > 0) {
                    %>
                    <tr>
                        <td>ID:</td>
                        <td><%=p.getIdPerfil()%> <input type="hidden" name="id" value="<%=p.getIdPerfil()%>"> </td>
                    </tr>
                    <tr>
                        <td>Perfil:</td>
                        <td>
                            <input type="text" name="perfil" value="<%=p.getPerfil()%>" size="60">
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

