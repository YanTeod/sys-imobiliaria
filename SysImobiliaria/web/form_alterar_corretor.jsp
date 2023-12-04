<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.CorretorDAO"%>
<%@page import="modelo.Corretor"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/aqueles.css" rel="stylesheet">
        <script language="javascript" >
            function validaForm() {
                formulario = document.form_corretor;
                if (formulario.idPerfil.value == "") {
                    alert("O Campo Perfil deve ser selecionado!!");
                    formulario.idPerfil.focus();
                    return false;
                }
                if (formulario.nomeCorretor.value == "") {
                    alert("O Campo Nome deve ser preenchido!!");
                    formulario.nomeCorretor.focus();
                    return false;
                }
                if (formulario.login.value == "") {
                    alert("O Campo Login deve ser preenchido!!");
                    formulario.login.focus();
                    return false;
                }
                if (formulario.senha.value == "") {
                    alert("O Campo Senha deve ser preenchido!!");
                    formulario.senha.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Alterar Corretores</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br>
        <div class="title">
            <h2>Alterando Corretores</h2>
        </div>
        <div class="opcoes">
            <form name="form_corretor" action="alterar_corretor.do" method="post" onsubmit="return validaForm();">
                <br><br>
                <table>
                    <%                                        int idCorretor = Integer.parseInt(request.getParameter("idCorretor"));
                        try {
                            CorretorDAO cDB = new CorretorDAO();
                            cDB.conectar();
                            Corretor corretores = cDB.carregaPorId(idCorretor);
                            cDB.desconectar();
                            if (corretores.getIdCorretor() > 0) {
                    %>
                    <tr>
                        
                        <td><input type="hidden" name="idCorretor" value="<%=corretores.getIdCorretor()%>"> </td>
                    </tr>
                    <tr>
                        <td>Perfil:</td>
                        <td>
                            <select name="idPerfil" size="1">
                                <option value="">Selecione um Perfil</option>
                                <%
                                    try {
                                        PerfilDAO pDB = new PerfilDAO();
                                        ArrayList<Perfil> lista;
                                        pDB.conectar();
                                        lista = pDB.listar();
                                        for (Perfil p : lista) {
                                            if (p.getIdPerfil() == corretores.getIdPerfil()) {
                                %>
                                <option value="<%=p.getIdPerfil()%>" selected><%=p.getPerfil()%></option>
                                <%
                                } else {
                                %>
                                <option value="<%=p.getIdPerfil()%>"><%=p.getPerfil()%></option>
                                <%
                                            }
                                        }
                                        pDB.desconectar();
                                    } catch (Exception erro) {
                                        out.print(erro);
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Nome:</td>
                        <td>
                            <input type="text" name="nomeCorretor" value="<%=corretores.getNomeCorretor()%>" size="60">
                        </td>
                    </tr>
                    <tr>
                        <td>Login:</td>
                        <td><input type="text" name="login" value="<%=corretores.getLogin()%>"  size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Senha:</td>
                        <td><input type="password" name="senha" value="<%=corretores.getSenha()%>"  size="30" /> </td>
                    </tr>

                    <tr>
                        <td>STATUS:</td>
                    <br>
                    <td><input type="radio" name="status" value="ATIVO" checked=""> ATIVO </td>
                    <td><input type="radio" name="status" value="INATIVO"> INATIVO </td>
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
