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
        <link href="css/aqueles.css" rel="stylesheet">
        <title>Alterar Relatório</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br>
        <div class="title">            
            <h2>Alterando Relatório</h2>
        </div>
        <div class="opcoes">
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

                        <td><input type="hidden" name="idRelatorio" value="<%=rela.getIdRelatorio()%>"> </td>
                    </tr>
                    <tr>
                        <td>Imovel:</td>
                        <td><%
                            try {
                                int idImovel = rela.getImovel().getIdImovel();
                                ImoveisDAO iBD = new ImoveisDAO();
                                iBD.conectar();
                                Imoveis i = iBD.carregarPorId(idImovel);
                                iBD.desconectar();
                            %>
                            <%=i.getLocalizacao()%>
                            <%
                                } catch (Exception erro) {
                                    out.print(erro);
                                }
                            %><input type="hidden" name="idImovel" value="<%=rela.getImovel().getIdImovel()%>"> </td>
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
                            <input type="text" name="comissao" placeholder="%" value="<%=rela.getComissao()%>" size="30">
                        </td>
                    </tr>
                    <tr>
                        <td>Valor de Venda:</td>
                        <td><input type="text" name="valorVenda" value="<%=rela.getValorVenda()%>"  size="50" /> </td>
                    </tr>
                    <tr>
                        <td>PARCERIA:</td>
                        <% if (rela.isParceria()) { %>
                        <td><input type="checkbox" name="parceria" checked /></td>
                            <%} else { %>
                        <td><input type="checkbox" name="parceria"  /></td>
                            <% }%>

                    </tr>
                    <tr>
                        <td>Corretor:</td>
                        <td>
                            <select name="idCorretor" size="1">
                                <option value="0">Escolha um Corretor</option>
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
                        <td>Comprador:</td>
                        <td>
                            <select name="idComprador" size="1">
                                <option value="2">Escolha um Comprador</option>
                                <% try {
                                        CompradorDAO comDB = new CompradorDAO();
                                        comDB.conectar();
                                        ArrayList<Comprador> lista = comDB.listar();

                                        for (Comprador com : lista) {
                                            if (com.isStatus()) { // Verifica se o status do comprador é verdadeiro
                                                out.println("<option value='" + com.getIdComprador() + "'>" + com.getNome() + "</option>");
                                            }
                                        }

                                    } catch (Exception e) {
                                        out.print(e);
                                    }%>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>Data Final:</td>
                        <td><input type="text" name="dataFinal" placeholder="DD/MM/YYYY" /></td>
                    </tr>
                     <tr>

                        <td><input type="hidden" name="telefonemas" value="<%=rela.getTelefonemas()%>"> </td>
                    </tr>
                     <tr>

                        <td><input type="hidden" name="propostas" value="<%=rela.getPropostas()%>"> </td>
                    </tr>
                     <tr>

                        <td><input type="hidden" name="visitas" value="<%=rela.getVisitas()%>"> </td>
                    </tr>

                    <tr>
                        <td>VENDIDO:</td>
                        <% if (rela.isStatus()) { %>
                        <td><input type="checkbox" name="status" checked /></td>
                            <%} else { %>
                        <td><input type="checkbox" name="status"  /></td>
                            <% }%>

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
