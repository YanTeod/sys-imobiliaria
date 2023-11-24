<%@page import="modelo.ProprietarioDAO"%>
<%@page import="modelo.Proprietario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
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
        <title>Inserir Imóveis</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div>
        <div class="opcoes">
            <form name="form_imovel" action="inserir_imovel.do" method="post" onsubmit="return validaForm();">
                <table>
                    <tr>
                        <td>Tipo:</td>
                        <td>
                            <input type="radio" name="tipo" value="CASA" checked=""> CASA
                            <input type="radio" name="tipo" value="APARTAMENTO"> APARTAMENTO
                        </td>
                    </tr>
                    <tr>
                        <td>PreçoM2:</td>
                        <td><input type="text" name="precoM2" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Localização:</td>
                        <td><input type="text" name="localizacao" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Area Util:</td>
                        <td><input type="text" name="areaUtil" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Area Total:</td>
                        <td><input type="text" name="areaTotal" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Comodos:</td>
                        <td><input type="text" name="comodos" size="30" /> </td>
                    </tr>
                    <tr>
                        <td>Vagas Garagem</td>
                        <td><input type="text" name="vagasGaragem" size="30" /> </td>
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
                        <br><br>
                        <td><input type="submit" value="Salvar" /> </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
