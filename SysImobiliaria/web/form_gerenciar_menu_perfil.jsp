<%@page import="modelo.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/aqueles.css" rel="stylesheet">
        <title>Gerenciar Menus de Perfil</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br>
        <div class="opcoes">
            <div>
                <form name="form_gerenciar" method="post" action="gerenciar_menu_perfil.do" onsubmit="return validaForm();">
                    <%                                    int id = Integer.parseInt(request.getParameter("id"));
                        Perfil perfil = new Perfil();
                        ArrayList<Menu> listaVinculados = new ArrayList<Menu>();
                        ArrayList<Menu> listaDesvinculados = new ArrayList<Menu>();
                        try {
                            PerfilDAO pDB = new PerfilDAO();
                            pDB.conectar();

                            perfil = pDB.carregaPorId(id);
                            listaVinculados = pDB.menusVinculados(id);
                            listaDesvinculados = pDB.menusDesvinculados(id);

                            pDB.desconectar();

                        } catch (Exception e) {
                            out.print(e);
                        }
                    %>
                    <div class="title">
                        <input type="hidden" name="idPerfil" value="<%=perfil.getIdPerfil()%>" />
                        <input type="hidden" name="op" value="vincular" />
                    </div>
                    <div class="title">
                        <h2>Gerenciar Menus de Perfil</h2>
                    </div>
                    <table>
                        <tr>
                            <td>ID: </td>
                            <td><%=perfil.getIdPerfil()%></td>
                        </tr>
                        <tr>
                            <td>Perfil: </td>
                            <td><%=perfil.getPerfil()%></td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>Menu:</td>
                            <td>
                                <select name="idMenu" size="1">
                                    <option value="">Escolha um menu</option>
                                    <%
                                        for (Menu m : listaDesvinculados) {
                                            out.println("<option value='" + m.getIdMenu() + "'>" + m.getMenu() + "</option>");
                                        }
                                    %>
                                </select>
                                <input type="submit" value="Vincular">
                    </table>
                </form>                            
                <br/><br/>
                <table width="300" border="1">
                    <tr>
                        <td>ID</td>
                        <td>MENU</td>
                        <td>DESVINCULAR</td>
                    </tr>
                    <%
                        for (Menu m : listaVinculados) {
                    %>
                    <tr>
                        <td><%=m.getIdMenu()%></td>
                        <td><%=m.getMenu()%></td>
                        <td><a href="gerenciar_menu_perfil.do?idMenu=<%=m.getIdMenu()%>&idPerfil=<%=id%>&op=desvincular"><img src="imagens/excluir.png"></a></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
    </body>
</html>
