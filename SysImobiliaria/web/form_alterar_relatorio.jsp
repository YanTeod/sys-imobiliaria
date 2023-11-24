<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="modelo.Imoveis"%>
<%@page import="modelo.Imoveis"%>
<%@page import="modelo.ImoveisDAO"%>
<%@page import="modelo.Relatorios"%>
<%@page import="modelo.RelatoriosDAO"%>
<%@page import="modelo.Comprador"%>
<%@page import="modelo.Comprador"%>
<%@page import="modelo.CompradorDAO"%>
<%@page import="modelo.Proprietario"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page import="modelo.CorretorDAO"%>
<%@page import="modelo.CorretorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <title>Alterar Relatório</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <br><br><br><br><br>
            <h2>Alterando Relatório</h2>
            <form name="form_usuario" action="alterar_relatorio.do" method="post" onsubmit="return validaForm();">
                <table>
                    <%                                        int idRelatorio = Integer.parseInt(request.getParameter("idRelatorio"));
                        try {
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                            DateTimeFormatter dtFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                            RelatoriosDAO relaDB = new RelatoriosDAO();
                            relaDB.conectar();
                            Relatorios rela = relaDB.carregarPorID(idRelatorio);
                            relaDB.desconectar();
                            if (rela.getIdRelatorio() > 0) {
                    %>
                    <tr>
                        <td>ID:</td>
                        <td><%=rela.getIdRelatorio()%> <input type="hidden" name="idRelatorio" value="<%=rela.getIdRelatorio()%>"> </td>
                    </tr>
                    <tr>
                        <td>Imovel:</td>
                        <td>
                            <select name="idImovel" size="1">
                                <option value="">Escolha um Imovel</option>
                                <%                                                try {
                                        ImoveisDAO iDB = new ImoveisDAO();
                                        iDB.conectar();
                                        ArrayList<Imoveis> lista = iDB.listar();

                                        for (Imoveis i : lista) {
                                            out.println("<option value='" + i.getIdImovel()+ "'>" + i.getLocalizacao()+ "</option>");
                                        }

                                    } catch (Exception e) {
                                        out.print(e);
                                    }

                                %>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>Custos:</td>
                        <td>
                            <input type="text" name="custos" value="<%=rela.getCustos()%>" size="30">
                        </td>
                    </tr>
                    <tr>
                        <td>Comissão:</td>
                        <td>
                            <input type="text" name="comissao" value="<%=rela.getComissao()%>" size="30">
                        </td>
                    </tr>
                    <tr>
                        <td>Valor de Venda:</td>
                        <td><input type="text" name="valorVenda" value="<%=rela.getValorVenda()%>"  size="50" /> </td>
                    </tr>
                    <tr>
                        <td>Parceria:</td>
                        <td><input type="checkbox" name="parceria"  /></td>
                    </tr>
                    <tr>
                        <td>Corretor:</td>
                        <td>
                            <select name="idCorretor" size="1">
                                <option value="">Escolha um Corretor</option>
                                <%                                                try {
                                        CorretorDAO cDB = new CorretorDAO();
                                        cDB.conectar();
                                        ArrayList<Corretor> lista = cDB.listar();

                                        for (Corretor c : lista) {
                                            out.println("<option value='" + c.getIdCorretor() + "'>" + c.getNomeCorretor() + "</option>");
                                        }

                                    } catch (Exception e) {
                                        out.print(e);
                                    }

                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Proprietário:</td>
                        <td>
                            <select name="idProprietario" size="1">
                                <option value="">Escolha um Proprietário</option>
                                <%                                                try {
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
                        <td>Comprador:</td>
                        <td>
                            <select name="idComprador" size="1">
                                <option value="">Escolha um Comprador</option>
                                <%                                    try {
                                        CompradorDAO cDB = new CompradorDAO();
                                        cDB.conectar();
                                        ArrayList<Comprador> lista = cDB.listar();

                                        for (Comprador c : lista) {
                                            out.println("<option value='" + c.getIdComprador() + "'>" + c.getNome() + "</option>");
                                        }

                                    } catch (Exception e) {
                                        out.print(e);
                                    }

                                %>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Data Final:</td>
                        <td><input type="text" name="dataFinal" placeholder="DD/MM/YYYY" /></td>
                    </tr>
                    <tr>
                        <td>Visitas:</td>
                        <td><input type="text" name="visitas" value="<%=rela.getVisitas()%>" /></td>
                    </tr>
                    <tr>
                        <td>Telefonemas:</td>
                        <td><input type="text" name="telefonemas" /></td>
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
