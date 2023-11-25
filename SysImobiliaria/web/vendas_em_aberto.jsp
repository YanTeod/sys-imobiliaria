
<%@page import="java.time.LocalDate"%>
<%@page import="modelo.Comprador"%>
<%@page import="modelo.CompradorDAO"%>
<%@page import="modelo.Proprietario"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page import="modelo.CorretorDAO"%>
<%@page import="modelo.Imoveis"%>
<%@page import="modelo.ImoveisDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Relatorios"%>
<%@page import="modelo.RelatoriosDAO"%>
<%@page import="modelo.RelatoriosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/demais.css" rel="stylesheet">
        <title>Vendas em aberto</title>
    </head>
    <body>
        <div>

            <%@include file="menu.jsp" %>

        </div>
        <div class="opcoes">




            <h2>Vendas em aberto<a href=form_inserir_relatorio.jsp> (nova venda) </a></h2>


            <table>

                <tr>
                    <td>id</td>
                    <td>Imovel</td>
                    <td>Corretor</td>                    
                    <td>Proprietário</td>
                    <td>Comprador</td>
                    <td>Data Final</td>
                    <td>Telefonemas</td>
                    <td>Propostas</td>
                    <td>Visitas</td>
                    <td>Custos</td>
                    <td>Porcentagem <br>de<br> Comissão</td>
                    <td>Valor de Venda</td>
                    <td>PARCERIA</td>
                    <td>Vendido</td>
                    <td>ALTERAR</td>
                    <td>EXCLUIR</td>








                </tr>
                <%                    try {
                        RelatoriosDAO relaDB = new RelatoriosDAO();
                        List<Relatorios> lista;
                        relaDB.conectar();
                        lista = relaDB.listarRelatorios();
                        for (Relatorios rela : lista) {
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                            DateTimeFormatter dtFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                %>
                <tr>
                    <td><%=rela.getIdRelatorio()%></td>

                    <td>
                        <%
                            int idImovel = rela.getImovel().getIdImovel();

                            try {
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
                        %>
                    </td>

                    <td>
                        <%
                            int idCorretor = rela.getCorretor().getIdCorretor();

                            try {
                                CorretorDAO coBD = new CorretorDAO();
                                coBD.conectar();
                                Corretor co = coBD.carregaPorId(idCorretor);
                                coBD.desconectar();
                        %>
                        <%=co.getNomeCorretor()%>
                        <%
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                    </td>

                    <td>
                        <%
                            int idProprietario = rela.getProprietario().getIdProprietario();

                            try {
                                ProprietarioDAO pBD = new ProprietarioDAO();
                                pBD.conectar();
                                Proprietario p = pBD.carregarPorId(idProprietario);
                                pBD.desconectar();
                        %>
                        <%=p.getNome()%>
                        <%
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                    </td>

                    <td>
                        <%
                            int idComprador = rela.getComprador().getIdComprador();

                            try {
                                CompradorDAO comBD = new CompradorDAO();
                                comBD.conectar();
                                Comprador com = comBD.carregarPorId(idComprador);
                                comBD.desconectar();
                        %>
                        <%=com.getNome()%>
                        <%
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                    </td>

                    <td>
                        <%
                            LocalDate dataFinal = rela.getDataFinal();
                            if (dataFinal != null) {
                                out.print(dataFinal.format(dtFormatter));
                            } else {
                                out.print("Data não definida");
                            }
                        %>

                    </td>

                    <td><%=rela.getTelefonemas()%></td>

                    <td><%=rela.getPropostas()%></td>

                    <td><%=rela.getVisitas()%></td>

                    <td><%=rela.getCustos()%></td>

                    <td><%=rela.getComissao()%></td>

                    <td><%=rela.getValorVenda()%></td>

                    <td>
                        <%
                            if (rela.isParceria()) {
                                out.print("Venda com parceria");
                            } else {
                                out.print("Venda sem parceria");
                            }

                        %>
                    </td>

                    <td>
                        <%                             if (rela.isStatus()) {
                                out.print("Vendido");
                            } else {
                                out.print("Não vendido");
                            }

                        %> 
                    </td>


                    <td align="center"><a href="form_alterar_relatorio.jsp?idRelatorio=<%=rela.getIdRelatorio()%>"><img src="imagens/alterar.png"></a></td>
                    <td align="center"><a href="excluir_relatorio.do?idRelatorio=<%=rela.getIdRelatorio()%>"><img src="imagens/excluir.png"></a></td>

                </tr>

                <%
                        }
                        relaDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>

            </table>
        </form
    </div>
</body>
</html>
