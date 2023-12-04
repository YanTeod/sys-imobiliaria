<%@page import="modelo.Comprador"%>
<%@page import="modelo.CompradorDAO"%>
<%@page import="modelo.Proprietario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page import="modelo.ProprietarioDAO"%>
<%@page import="modelo.Imoveis"%>
<%@page import="modelo.ImoveisDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/aqueles.css" rel="stylesheet">

        <title>Alterar Imóveis</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <br><br><br><br>
        <div class="title">
            <h2>Alterando Imovel</h2>
        </div>
        <div class="opcoes">
            <div class="form-container">
                <form name="form_usuario" action="alterar_imovel.do" method="post" onsubmit="return validaForm();">
                    <table div class="form-container">
                        <%                            int id = Integer.parseInt(request.getParameter("idImovel"));
                            try {
                                ImoveisDAO iDB = new ImoveisDAO();
                                iDB.conectar();
                                Imoveis imovel = iDB.carregarPorId(id);
                                iDB.desconectar();
                                if (imovel.getIdImovel() > 0) {
                        %>
                        <tr>
                      
                        <input type="hidden" name="idImovel" value="<%=imovel.getIdImovel()%>">
                        </tr>
                        <br>
                        <tr>
                        <label>TIPO:</label>
                        <br>
                        <input type="radio" name="tipo" value="CASA" checked=""> CASA
                        <input type="radio" name="tipo" value="APARTAMENTO"> APARTAMENTO
                        </tr>
                        <br><br>
                        <tr>
                        <label>PREÇO METRO QUADRADO:</label>
                        <input type="text" name="precoM2" value="<%=imovel.getPrecoM2()%>" size="10">
                        </tr>
                        <tr>
                        <label>LOCALIZAÇÃO:</label>
                        <input type="text" name="localizacao" value="<%=imovel.getLocalizacao()%>"  size="10" />
                        </tr>
                        <tr>
                        <label>ÁREA ÚTIL:</label>
                        <input type="text" name="areaUtil" value="<%=imovel.getAreaUtil()%>"  size="10" />                       
                        </tr>
                        <tr>
                        <label>ÁREA TOTAL:</label>
                        <input type="text" name="areaTotal" value="<%=imovel.getAreaTotal()%>"  size="10" />                       
                        </tr>
                        <tr>

                        <label>COMODOS:</label>
                        <input type="text" name="comodos" value="<%=imovel.getComodos()%>"  size="10" />
                        </tr>
                        <tr>
                        <label>Proprietário:</label>
                        <select name="idProprietario" size="1">
                            <option value="">Escolha um Proprietário</option>
                            <%
                                try {
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
                        </tr>    
                        <tr>
                        <label>VAGAS DE GARAGEM:</label>
                        <input type="text" name="vagasGaragem" value="<%=imovel.getVagasGaragem()%>"  size="10" />
                        </tr>
                        <tr>
                        <label>STATUS:</label>
                        <br>
                        <input type="radio" name="status" value="ATIVO" checked=""> ATIVO 
                        <input type="radio" name="status" value="INATIVO"> INATIVO 
                        </tr>
                        <tr>
                            <br><br>
                        <input type="submit" value="Alterar" class="btn-submit" />
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