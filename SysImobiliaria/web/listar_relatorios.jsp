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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <link href="css/listar.css" rel="stylesheet">
        <title>Lista de Relatórios</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br>
        <div class="opcoes">
            <div class="title">
                <h2>Relatórios</h2>
            </div>
            <br>
            <table>
                <tr>

                    <td>Imovel</td>                 
                    <td>Tipo</td>    
                    <td>Corretor</td>
                    <td>Proprietário</td>
                    <td>Comprador</td>
                    <td>Data Inicial</td>
                    <td>Data Da Venda</td>
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

                    <td>
                        <%
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
                        %>
                    </td>
                    <td>
                        <%
                            try {
                                int idImovel = rela.getImovel().getIdImovel();
                                ImoveisDAO iBD = new ImoveisDAO();
                                iBD.conectar();
                                Imoveis i = iBD.carregarPorId(idImovel);
                                iBD.desconectar();
                        %>
                        <%=i.getTipo()%>
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
                            try {
                                int idImovel = rela.getImovel().getIdImovel();
                                ImoveisDAO iBD = new ImoveisDAO();
                                iBD.conectar();
                                int idProprietario = iBD.salvarIdProprietario(idImovel);
                                Proprietario p = iBD.carregarProprietarioPorId(idProprietario);
                        %>
                        <%= p.getNome()%>
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
                                int idImovel = rela.getImovel().getIdImovel();
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
                            long diferencaEmDias = relaDB.calcularDiferencaEmDias(rela);
                            if (diferencaEmDias >= 0) {
                                out.print(diferencaEmDias + " dias");
                            } else {
                                out.print("Datas não definidas");
                            }
                        %>
                    </td> 
                    <%
                        
                        String tipoVenda = relaDB.obterTipoVenda(rela);
                        String valorComissao = relaDB.calcularComissao(rela);
                        String valorLucro = relaDB.calcularLucro(rela);
                    %>
                    <td><%=rela.getTelefonemas()%></td>
                    <td><%=rela.getPropostas()%></td>
                    <td><%=rela.getVisitas()%></td>
                    <td>R$<%=rela.getValorVenda()%></td>
                    <td>R$<%=rela.getCustos()%></td>
                    <td><%=rela.getComissao()%>%</td>
                    <td><%=tipoVenda%></td>
                    <td><%=valorComissao%></td>
                    <td><%=valorLucro%></td>

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
