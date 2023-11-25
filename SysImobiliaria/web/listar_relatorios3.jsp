<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="modelo.Imoveis"%>
<%@page import="modelo.ImoveisDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CompradorDAO"%>
<%@page import="modelo.CorretorDAO"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page import="modelo.Relatorios" %>
<%@page import="modelo.RelatoriosDAO" %>
<%@page import="modelo.Corretor" %>
<%@page import="modelo.Proprietario" %>
<%@page import="modelo.Comprador" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.temporal.ChronoUnit"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/demais.css" rel="stylesheet">
        <title>Lista de Relatórios</title>
    </head>
    <body>
        <div>

            <%@include file="menu.jsp" %>

        </div>

        <div class="opcoes">
            <form action="listar_relatorios2.jsp" method="post">


                <table>


                    <tr>
                        <td>Buscar pelo Proprietário:</td>
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

                        <td><input type="submit" value="buscar" /> </td>

                        </td>
                    </tr>
                </table>
            </form>
            <h2>Relatórios</h2>
            <table>
                <tr>
                    <td>id</td>
                    <td>Imovel</td>                 


                    <td>Corretor</td>
                    <td>Proprietário</td>
                    <td>Comprador</td>
                    <td>Data Inicial</td>
                    <td>Data Final</td>
                    <td>Prazo<br>de<br>venda</td>
                    <td>Telefonemas</td>
                    <td>Propostas</td>
                    <td>Visitas</td>                   
                    <td>Valor de Venda</td>
                    <td>Custos</td>
                    <td>Porcentagem <br>de<br> Comissão</td>
                    <td>Parceria</td>
                    <td>Comissão</td>
                    <td>Lucro</td>

                    <td>EXCLUIR</td>

                </tr>
                <%                    try {
                        RelatoriosDAO relaDB = new RelatoriosDAO();
                        List<Relatorios> lista;
                        relaDB.conectar();
                        lista = relaDB.listarRelatorios();
                        for (Relatorios rela : lista) {
                            if (rela.isStatus()) {
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


                    <td>
                        <%
                            try {
                                ImoveisDAO iBD = new ImoveisDAO();
                                iBD.conectar();
                                Imoveis i = iBD.carregarPorId(idImovel);
                                iBD.desconectar();
                        %>
                        <%=i.getDataInicial().format(dtFormatter)%>
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
                    <td>
                        <%
                            try {
                                ImoveisDAO iBD = new ImoveisDAO();
                                iBD.conectar();
                                Imoveis i = iBD.carregarPorId(idImovel);
                                iBD.desconectar();

                                LocalDate dataInicial = i.getDataInicial();

                                if (dataInicial != null && dataFinal != null) {
                                    long diasDiferenca = ChronoUnit.DAYS.between(dataInicial, dataFinal);
                                    out.print(diasDiferenca + " dias");
                                } else {
                                    out.print("Datas não definidas");
                                }
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                    </td>

                    <td><%=rela.getTelefonemas()%></td>

                    <td><%=rela.getPropostas()%></td>

                    <td><%=rela.getVisitas()%></td>

                    <td><%=rela.getValorVenda()%></td>

                    <td><%=rela.getCustos()%></td>

                    <td><%=rela.getComissao()%></td>



                    <td>

                        <%
                            if (rela.isParceria()) {
                                out.print("Venda com parceria");
                            } else {
                                out.print("Venda sem parceria");
                            }

                        %>

                    </td>   

                    <td><%                        if (rela.isParceria()) {
                            out.print((rela.getValorVenda() * rela.getComissao() / 100) / 2);
                        } else {
                            out.print(rela.getValorVenda() * rela.getComissao() / 100);
                        }

                        %>
                    </td>
                    <td><%                        if (rela.isParceria()) {
                            out.print(((rela.getValorVenda() * rela.getComissao() / 100) / 2) - rela.getCustos());
                        } else {
                            out.print((rela.getValorVenda() * rela.getComissao() / 100) - rela.getCustos());
                        }

                        %>
                    </td>

                    <td align="center"><a href="excluir_relatorio.do?idRelatorio=<%=rela.getIdRelatorio()%>"><img src="imagens/excluir.png"></a></td>

                </tr>
                <%}
                        }
                        relaDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
            </table>
        </div>
    </body>
</html>
