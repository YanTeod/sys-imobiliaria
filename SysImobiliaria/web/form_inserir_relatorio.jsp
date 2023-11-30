<%@page import="modelo.ImoveisDAO"%>
<%@page import="modelo.Imoveis"%>
<%@page import="modelo.CompradorDAO"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.CorretorDAO"%>
<%@page import="modelo.Corretor" %>
<%@page import="modelo.Proprietario" %>
<%@page import="modelo.Comprador" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/aqueles.css" rel="stylesheet">
        
        <title>Inserir Venda</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br>
        <div class="title ">
            <h2>Inserir Venda</h2>
        </div>
        <div class="opcoes">
            <form name="form_imovel" action="inserir_relatorio.do" method="post" > 
                <table>
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
                        <td><input type="text" name="custos" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Comissão:</td>
                        <td><input type="text" name="comissao" placeholder="%" /></td>
                    </tr>
                    <tr>
                        <td>Valor de Venda:</td>
                        <td><input type="text" name="valorVenda" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Parceria:</td>
                        <td><input type="checkbox" name="parceria" /></td>
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
                        <td>Comprador:</td>
                        <td>
                            <select name="idComprador" size="1">
                                <option value="">Escolha um Comprador</option>
                                <%                                                try {
                                        CompradorDAO comDB = new CompradorDAO();
                                        comDB.conectar();
                                        ArrayList<Comprador> lista = comDB.listar();

                                        for (Comprador com : lista) {
                                            out.println("<option value='" + com.getIdComprador() + "'>" + com.getNome() + "</option>");
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
                        <td><input type="text" name="visitas" value="0" /></td>
                    </tr>
                    <tr>
                        <td>Telefonemas:</td>
                        <td><input type="text" name="telefonemas" value="0" /></td>
                    </tr>
                    <tr>
                        <td>Propostas:</td>
                        <td><input type="text" name="telefonemas" value="0" /></td>
                    </tr>
                    <tr>
                        <td>Vendido:</td>
                        <td><input type="checkbox" name="status" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Salvar" /> </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
