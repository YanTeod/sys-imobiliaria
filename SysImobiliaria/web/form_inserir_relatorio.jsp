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
        <link href="css/demais.css" rel="stylesheet">
        <script language="javascript" >
            function validaForm() {
                formulario = document.form_imovel;
                if (formulario.precoM2.value == "") {
                    alert("O Campo PreçoM2 deve ser preenchido!!");
                    formulario.precoM2.focus();
                    return false;
                }
                if (formulario.localizacao.value == "") {
                    alert("O Campo localização deve ser preenchido!!");
                    formulario.localizacao.focus();
                    return false;
                }
                if (formulario.areaUtil.value == "") {
                    alert("O Campo área útil deve ser preenchido!!");
                    formulario.areaUtil.focus();
                    return false;
                }
                if (formulario.areaTotal.value == "") {
                    alert("O Campo área total deve ser preenchido!!");
                    formulario.areaTotal.focus();
                    return false;
                }
                if (formulario.comodos.value == "") {
                    alert("O Campo comodos deve ser preenchido!!");
                    formulario.comodos.focus();
                    return false;
                }
                if (formulario.vagasGaragem.value == "") {
                    alert("O Campo Vagas Garagem deve ser preenchido!!");
                    formulario.vagasGaragem.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Inserir Venda</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">

            <h2>Inserir Venda</h2>
            <form name="form_imovel" action="inserir_relatorio.do" method="post" onsubmit="return validaForm();"> 
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
                        <td><input type="text" name="visitas" /></td>
                    </tr>
                    <tr>
                        <td>Telefonemas:</td>
                        <td><input type="text" name="telefonemas" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Salvar" /> </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
