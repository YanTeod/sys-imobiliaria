<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/demais.css" rel="stylesheet">
        <script language="javascript" >
            function validaForm() {
                formulario = document.form_usuario;
                if (formulario.nomeCorretor.value == "") {
                    alert("O Campo nome deve ser preenchido!!");
                    formulario.nomeCorretor.focus();
                    return false;
                }
                if (formulario.login.value == "") {
                    alert("O Campo login deve ser preenchido!!");
                    formulario.login.focus();
                    return false;
                }
                if (formulario.senha.value == "") {
                    alert("O Campo senha deve ser preenchido!!");
                    formulario.senha.focus();
                    return false;
                }
                if (formulario.idPerfil.value == "") {
                    alert("O Campo Perfil deve ser preenchido!!");
                    formulario.idPerfil.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Inserir Corretores</title>
    </head>
    <body>
        <div>

            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <form name="form_usuario" action="inserir_corretor.do" method="post" onsubmit="return validaForm();">
                <table>
                    <tr>
                        <td>Nome:</td>
                        <td><input type="text" name="nomeCorretor" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Login:</td>
                        <td><input type="text" name="login" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Senha:</td>
                        <td><input type="password" name="senha" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Perfil:</td>
                        <td>
                            <select name="idPerfil" size="1">
                                <option value="">Escolha um Perfil</option>
                                <%                                                try {
                                        PerfilDAO pDB = new PerfilDAO();
                                        pDB.conectar();
                                        ArrayList<Perfil> lista = pDB.listar();

                                        for (Perfil p : lista) {
                                            out.println("<option value='" + p.getIdPerfil() + "'>" + p.getPerfil() + "</option>");
                                        }

                                    } catch (Exception e) {
                                        out.print(e);
                                    }
                                %>
                            </select>
                        </td>
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

