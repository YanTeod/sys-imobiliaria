package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Imoveis;
import modelo.ImoveisDAO;
import modelo.Proprietario;

public class AlterarImovel extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here*/
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarImovel</title>");
            out.println("</head>");
            out.println("<body>");

            int idImovel = Integer.parseInt(request.getParameter("idImovel"));
            String tipo = request.getParameter("tipo");
            Double precoM2 = Double.parseDouble(request.getParameter("precoM2"));
            String localizacao = request.getParameter("localizacao");
            Double areaUtil = Double.parseDouble(request.getParameter("areaUtil"));
            Double areaTotal = Double.parseDouble(request.getParameter("areaTotal"));
            Integer comodos = Integer.parseInt(request.getParameter("comodos"));
            Integer vagasGaragem = Integer.parseInt(request.getParameter("vagasGaragem"));
            int idProprietario = Integer.parseInt(request.getParameter("idProprietario"));
            String status = request.getParameter("status");

            if (precoM2 == null || precoM2.equals("")) {
                out.print("O campo precoM2 deve ser preenchido!");
            } else if (localizacao == null || localizacao.equals("")) {
                out.print("O campo localização deve ser preenchido!");
            } else if (areaUtil == null || areaUtil.equals("")) {
                out.print("O campo Área Útil deve ser preenchido!");
            } else if (areaTotal == null || areaTotal.equals("")) {
                out.print("O campo Área Total deve ser preenchido!");
            } else if (comodos == null) {
                out.print("O campo Comodos deve ser preenchido!");
            } else if (vagasGaragem == null || vagasGaragem.equals("")) {
                out.print("O campo Vagas Da Garagem deve ser preenchido!");
            } else if (idProprietario < 1) {
                out.print("O campo Perfil deve ser preenchido!");
            } else if (idImovel < 1) {
                out.print("Imovel não encontrado!");
            } else {
                try {

                    Imoveis imovel = new Imoveis();
                    imovel.setIdImovel(idImovel);
                    imovel.setTipo(tipo);
                    imovel.setPrecoM2(precoM2);
                    imovel.setLocalizacao(localizacao);
                    imovel.setAreaUtil(areaUtil);
                    imovel.setAreaTotal(areaTotal);
                    imovel.setComodos(comodos);
                    imovel.setVagasGaragem(vagasGaragem);
                    imovel.setStatus(status);
                    imovel.getProprietario().setIdProprietario(idProprietario);
                    ImoveisDAO iDB = new ImoveisDAO();
                    iDB.conectar();
                    iDB.alterar(imovel);
                    iDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Imovel atualizado com sucesso!!');");
                    out.print("location.href='listar_imoveis.jsp';");
                    out.print("</script>");
                } catch (Exception erro) {
                    out.print(erro);
                }

            }
            out.println("</body>");
            out.println("</html>");

        } finally {
            out.close();
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
