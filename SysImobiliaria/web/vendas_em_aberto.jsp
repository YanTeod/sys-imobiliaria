
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
        <script
            src="https://code.jquery.com/jquery-1.12.4.min.js"
            integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
        crossorigin="anonymous"></script>
        <script type="text/javascript">

            function modificarContador(id, acao, coluna) {
                $.ajax({
                    url: 'modificar_contador.do',
                    data: {
                        idRelatorio: id,
                        acao: acao,
                        coluna: coluna,
                    },
                    success: function (data, textStatus, jqXHR) {
                        if (acao == "incremento") {
                            switch (coluna) {
                                case "propostas" :
                                    $("#propostas_" + id).val(parseInt($("#propostas_" + id).val()) + 1);
                                    break;
                                case "visitas" :
                                    $("#visitas_" + id).val(parseInt($("#visitas_" + id).val()) + 1);
                                    break;
                                case "telefonemas" :
                                    $("#telefonemas_" + id).val(parseInt($("#telefonemas_" + id).val()) + 1);
                                    break;
                            }

                        } else if (acao == "decremento") {
                            switch (coluna) {
                                case "propostas" :
                                    $("#propostas_" + id).val($("#propostas_" + id).val() - 1);
                                    break;
                                case "visitas" :
                                    $("#visitas_" + id).val($("#visitas_" + id).val() - 1);
                                    break;
                                case "telefonemas" :
                                    $("#telefonemas_" + id).val($("#telefonemas_" + id).val() - 1);
                                    break;
                            }
                        }

                    }
                });
            }


        </script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <link href="css/listar.css" rel="stylesheet">
        <title>Vendas em aberto</title>

    </head>
    <body>

        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br>
        <div class="opcoes">
            <div class="title">
                <h2>Vendas em aberto</h2>
                <h3><img src="imagens/adicionar.png"><a href=form_inserir_relatorio.jsp> Nova Venda </a><img src="imagens/adicionar.png"></h3>
            </div>
            <br>
            <form>

                <table>
                    <tr>

                        <td>Imovel</td>
                        <td>Tipo</td>
                        <td>Corretor</td>                    
                        <td>Proprietário</td>
                        <td>Comprador</td>
                        <td>Data Inicial</td>
                        <td>Data Da Venda</td>
                        <td>Telefonemas</td>
                        <td>Propostas</td>
                        <td>Visitas</td>
                        <td>Custos</td>
                        <td>Porcentagem <br>de<br> Comissão</td>
                        <td>Valor de Venda</td>
                        <td>PARCERIA</td>
                        <td>Vendido</td>
                        <td>ALTERAR</td>

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
                            <div class="btn-group">
                                <button type="button" onclick="modificarContador(<%=rela.getIdRelatorio()%>, 'decremento', 'telefonemas');" class="quantity-left-minus btn btn-danger btn-number btn-xs" data-type="minus" data-field="" style="width: 30%;">
                                    <span class="glyphicon glyphicon-minus"></span>
                                </button>

                                <input type="text" id="telefonemas_<%=rela.getIdRelatorio()%>" name="telefonemas_<%=rela.getIdRelatorio()%>" class="form-control input-number" value="<%=rela.getTelefonemas()%> " min="1" max="100" >

                                <button type="button" onclick="modificarContador(<%=rela.getIdRelatorio()%>, 'incremento', 'telefonemas');" class="quantity-right-plus btn btn-success btn-number btn-xs" data-type="plus" data-field="" style="width: 30%;">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </td>
                        <td>
                            <div class="btn-group">
                                <button type="button" onclick="modificarContador(<%=rela.getIdRelatorio()%>, 'decremento', 'propostas');" class="quantity-left-minus btn btn-danger btn-number btn-xs" data-type="minus"  data-field="" style="width: 30%;">
                                    <span class="glyphicon glyphicon-minus"></span>
                                </button>

                                <input type="text" id="propostas_<%=rela.getIdRelatorio()%>" name="propostas_<%=rela.getIdRelatorio()%>" class="form-control input-number" value="<%=rela.getPropostas()%>" min="1" max="100" >

                                <button type="button" onclick="modificarContador(<%=rela.getIdRelatorio()%>, 'incremento', 'propostas');" class="quantity-right-plus btn btn-success btn-number btn-xs" data-type="plus" data-field="" style="width: 30%;">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </td>


                        <td>
                            <div class="btn-group">
                                <button type="button" onclick="modificarContador(<%=rela.getIdRelatorio()%>, 'decremento', 'visitas');" class="quantity-left-minus btn btn-danger btn-number btn-xs" data-type="minus" data-field="" style="width: 30%;">
                                    <span class="glyphicon glyphicon-minus"></span>
                                </button>

                                <input type="text" id="visitas_<%=rela.getIdRelatorio()%>" name="visitas_<%=rela.getIdRelatorio()%>" class="form-control input-number" value="<%=rela.getVisitas()%>" min="1" max="100" >

                                <button type="button" onclick="modificarContador(<%=rela.getIdRelatorio()%>, 'incremento', 'visitas');" class="quantity-right-plus btn btn-success btn-number btn-xs" data-type="plus" data-field="" style="width: 30%;">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </td>

                        <td><%=rela.getCustos()%></td>

                        <td><%=rela.getComissao()%>%</td>

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


                    </tr>

                    <%
                            }
                            relaDB.desconectar();
                        } catch (Exception erro) {
                            out.print(erro);
                        }
                    %>

                </table>
            </form>
        </div>
    </body>
</html>
