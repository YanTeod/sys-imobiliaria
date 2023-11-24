<%@page import="modelo.Comprador"%>
<%@page import="modelo.CompradorDAO"%>
<%@page import="modelo.Proprietario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page import="modelo.Imoveis"%>
<%@page import="modelo.ImoveisDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/demais.css" rel="stylesheet">
        <script language="javascript" >
            function validaForm() {
                formulario = document.form_usuario;
                if (formulario.id_perfil.value == "") {
                    alert("O Campo Perfil deve ser selecionado!!");
                    formulario.id_perfil.focus();
                    return false;
                }
                if (formulario.nome.value == "") {
                    alert("O Campo Nome deve ser preenchido!!");
                    formulario.nome.focus();
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
        <title>Alterar Imóveis</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <br><br><br><br><br>
            <h2>Alterando Imovel</h2>
            <form name="form_usuario" action="alterar_imovel.do" method="post" onsubmit="return validaForm();">
                <table>
                    <%                                        int id = Integer.parseInt(request.getParameter("idImovel"));
                        try {
                            ImoveisDAO iDB = new ImoveisDAO();
                            iDB.conectar();
                            Imoveis imovel = iDB.carregarPorId(id);
                            iDB.desconectar();
                            if (imovel.getIdImovel() > 0) {
                    %>
                    <tr>
                        <td>ID:</td>
                        <td><%=imovel.getIdImovel()%> <input type="hidden" name="idImovel" value="<%=imovel.getIdImovel()%>"> </td>
                    </tr>
                    <tr>
                        <td>Tipo:</td>
                        <td>
                            <input type="radio" name="tipo" value="CASA" checked=""> CASA
                            <input type="radio" name="tipo" value="APARTAMENTO"> APARTAMENTO
                        </td>
                    </tr>
                    <tr>
                        <td>PREÇO M2:</td>
                        <td>
                            <input type="text" name="precoM2" value="<%=imovel.getPrecoM2()%>" size="30">
                        </td>
                    </tr>
                    <tr>
                        <td>LOCALIZAÇÃO:</td>
                        <td><input type="text" name="localizacao" value="<%=imovel.getLocalizacao()%>"  size="50" /> </td>
                    </tr>
                    <tr>
                        <td>ÁREA ÚTIL:</td>
                        <td><input type="text" name="areaUtil" value="<%=imovel.getAreaUtil()%>"  size="30" /> </td>
                    </tr>
                    <tr>
                        <td>ÁREA TOTAL:</td>
                        <td><input type="text" name="areaTotal" value="<%=imovel.getAreaTotal()%>"  size="30" /> </td>
                    </tr>
                    <tr>
                        <td>COMODOS:</td>
                        <td><input type="text" name="comodos" value="<%=imovel.getComodos()%>"  size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Proprietário:</td>
                        <td>
                            <select name="idProprietario" size="1">
                                <option value="">Escolha um Proprietário</option>
                                <%
                                    try {
                                        ProprietarioDAO pDB = new ProprietarioDAO();
                                        pDB.conectar();
                                        ArrayList<Proprietario> lista = pDB.listar();

                                        for (Proprietario p : lista) {
                                            out.println("<option value='" + p.getIdProprietario() + "'>" + p.getNome() + "</option>");
                                        }

                                    } catch (Exception e) {
                                        out.print(e);
                                    }

                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>VAGAS DE GARAGEM:</td>
                        <td><input type="text" name="vagasGaragem" value="<%=imovel.getVagasGaragem()%>"  size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Comprador:</td>
                        <td>
                            <select name="idComprador" size="1">
                                <option value="">Escolha um Comprador</option>
                                <%
                                    try {
                                        CompradorDAO cDB = new CompradorDAO();
                                        cDB.conectar();
                                        ArrayList<Comprador> lista = cDB.listar();

                                        for (Comprador c : lista) {
                                            out.println("<option value='" + c.getIdComprador()+ "'>" + c.getNome() + "</option>");
                                        }

                                    } catch (Exception e) {
                                        out.print(e);
                                    }

                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>STATUS:</td>
                        <td>
                            <input type="radio" name="status" value="ATIVO" checked=""> ATIVO 
                            <input type="radio" name="status" value="INATIVO"> INATIVO 
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Alterar"></td>
                    </tr>
                    <%                                            }
                        } catch (Exception erro) {
                            out.print(erro);
                        }
                    %>
                </table>
            </form>
        </div>
    </body>
</html>
