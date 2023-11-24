<%@page import="modelo.Comprador"%>
<%@page import="modelo.CompradorDAO"%>
<%@page import="modelo.CorretorDAO"%>
<%@page import="modelo.Proprietario"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page import="modelo.Imoveis"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ImoveisDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/demais.css" rel="stylesheet">
        <title>Lista de Imóveis</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <h2>Lista de Imóveis <a href=form_inserir_imovel.jsp> (novo imóvel) </a></h2>
            <table>
                <tr>
                    <td>ID</td>
                    <td>TIPO</td>
                    <td>PREÇOM2</td>
                    <td>LOCALIZAÇÃO</td>
                    <td>ÁREA ÚTIL</td>
                    <td>ÁREA TOTAL</td>
                    <td>COMODOS</td>
                    <td>PROPRIETÁRIO</td>
                    <td>VAGAS DE GARAGEM</td>
                    <td>STATUS</td>
                    <td>ALTERAR</td>
                    <td>EXCLUIR</td>
                </tr>
                <%                                    try {
                        ImoveisDAO iDB = new ImoveisDAO();
                        ArrayList<Imoveis> lista;
                        iDB.conectar();
                        lista = iDB.listar();
                        for (Imoveis i : lista) {
                %>
                <tr>
                    <td><%=i.getIdImovel()%></td>
                    <td><%=i.getTipo()%></td>
                    <td><%=i.getPrecoM2()%></td>
                    <td><%=i.getLocalizacao()%></td>
                    <td><%=i.getAreaUtil()%></td>
                    <td><%=i.getAreaTotal()%></td>
                    <td><%=i.getComodos()%></td>
                    <td>
                        <%
                            int idProprietario = i.getProprietario().getIdProprietario();

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
                    <td><%=i.getVagasGaragem()%></td>
                    <td><%=i.getStatus()%></td>


                    <td align="center"><a href="form_alterar_imovel.jsp?idImovel=<%=i.getIdImovel()%>"><img src="imagens/alterar.png"></a></td>
                    <td align="center"><a href="excluir_imovel.do?idImovel=<%=i.getIdImovel()%>"><img src="imagens/excluir.png"></a></td>

                </tr>
                <%
                        }
                        iDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
            </table>
        </div>
    </body>
</html>
