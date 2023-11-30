
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/inserilo.css" rel="stylesheet">
        <title>Imóveis cadastrados ou não</title>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
        </div> 
        <br><br><br><br><br><br><br><br><br>
        <div class="opcoes">
            <table>
                <tr>
                    <td>
                        <a href="form_inserir_imovel2.jsp"><button>Proprietário Cadastrado</button></a>
                    </td>
                    <td>
                        <a href="form_inserir_proprietario2.jsp"><button>Proprietário Não Cadastrado</button></a>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
