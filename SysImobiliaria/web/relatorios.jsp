<%@page import="modelo.CorretorDAO"%>
<%@page import="modelo.Comprador"%>
<%@page import="modelo.CompradorDAO"%>
<%@page import="modelo.Proprietario"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page import="modelo.Relatorio"%>
<%@page import="modelo.RelatorioDAO"%>
<

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/demais.css" rel="stylesheet">
        <title>Relatórios</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <h2>Lista de Relatórios <a href=form_inserir_relatorio.jsp> (novo Relatório) </a></h2>
            <table>
                <tr>
                    <td>ID</td>
                    <td>CUSTOS</td>
                    <<td>Comissão</td>
                    <td>Valor de Venda</td>                    
                    <td>Corretor</td>
                    <td>Proprietário</td>
                    <td>Comprador</td>
                    <td>Data Inicial</td>
                    <td>Data Final</td>

                    <%/*
                    <td>Telefonemas</td>
                    <td>Tempo para venda</td>
                         */ %>
                    <td>Visitas</td>
                    <td>ALTERAR</td>
                    <td>EXCLUIR</td>
                </tr>
                <% try {
                        RelatorioDAO rDB = new RelatorioDAO();
                        ArrayList<Relatorio> lista;
                        rDB.conectar();
                        lista = rDB.listar();
                        for (Relatorio r : lista) {
                %>  
                <tr>
                    <td><%=r.getIdVenda()%></td>
                    <td><%=r.getCustos()%></td>
                    <td><%=r.getComissao()%></td>
                    <td><%=r.getValorVenda()%></td>
                    <td>
                        <%
                            int idCorretor = r.getCorretor().getIdCorretor();

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
                            int idProprietario = r.getProprietario().getIdProprietario();

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
                            int idComprador = r.getComprador().getIdComprador();

                            try {
                                CompradorDAO cBD = new CompradorDAO();
                                cBD.conectar();
                                Comprador c = cBD.carregarPorId(idComprador);
                                cBD.desconectar();
                        %>
                        <%=c.getNome()%>
                        <%
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                    </td>
                    <td><%=r.getDataInicial()%></td>
                    <td><%=r.getDataFinal()%></td>
                    
                    <td><%=r.getVisitas()%></td>
                    


                    <td align="center"><a href="form_alterar_relatorio.jsp?idVenda=<%=r.getIdVenda()%>"><img src="imagens/alterar.png"></a></td>
                    <td align="center"><a href="excluir_relatorio.do?idVenda=<%=r.getIdVenda()%>"><img src="imagens/excluir.png"></a></td>

                </tr>
                <%
                        }
                        rDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
            </table>



        </div>
    </body>
</html>
