package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Comprador;
import modelo.Corretor;
import modelo.Proprietario;
import modelo.Relatorios;
import modelo.RelatoriosDAO;

public class AlterarRelatorio extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here*/
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarRelatorio</title>");
            out.println("</head>");
            out.println("<body>");

            int idRelatorio = Integer.parseInt(request.getParameter("idRelatorio"));
            int idImovel = Integer.parseInt(request.getParameter("idImovel"));
            Double custos = Double.parseDouble(request.getParameter("custos"));
            Double comissao = Double.parseDouble(request.getParameter("comissao"));
            Double valorVenda = Double.parseDouble(request.getParameter("valorVenda"));
            boolean parceria = Boolean.parseBoolean(request.getParameter("parceria"));
            int idCorretor = Integer.parseInt(request.getParameter("idCorretor"));
            int idProprietario = Integer.parseInt(request.getParameter("idProprietario"));
            int idComprador = Integer.parseInt(request.getParameter("idComprador"));

            String dataFinal = request.getParameter("dataFinal");
            int telefonemas = Integer.parseInt(request.getParameter("telefonemas"));
            int visitas = Integer.parseInt(request.getParameter("visitas"));

            if (idRelatorio < 1) {
                out.print("O ID do imovel não encontrado!");

            } else {

                try {

                    DateTimeFormatter formatada = DateTimeFormatter.ofPattern("dd/MM/yyyy");

                    LocalDate dataFinalConvertida = null;
                    if (dataFinal != null && !dataFinal.isEmpty()) {
                        dataFinalConvertida = LocalDate.parse(dataFinal, formatada);
                    }

                    Relatorios relatorio = new Relatorios();
                    relatorio.setIdRelatorio(idRelatorio);
                    relatorio.getImovel().setIdImovel(idImovel);
                    relatorio.setCustos(custos);
                    relatorio.setComissao(comissao);
                    relatorio.setValorVenda(valorVenda);
                    relatorio.setParceria(parceria);
                    relatorio.getCorretor().setIdCorretor(idCorretor);
                    relatorio.getProprietario().setIdProprietario(idProprietario);
                    relatorio.getComprador().setIdComprador(idComprador);

                    relatorio.setDataFinal(dataFinalConvertida);
                    relatorio.setTelefonemas(telefonemas);
                    relatorio.setVisitas(visitas);

                    RelatoriosDAO vendaDB = new RelatoriosDAO();
                    vendaDB.conectar();
                    vendaDB.alterar(relatorio);
                    vendaDB.desconectar();

                    out.print("<script language='javascript'>");
                    out.print("alert('Relatório alterado com sucesso!!');");
                    out.print("location.href='listar_relatorios.jsp';");
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
        try {
            processRequest(request, response);

        } catch (Exception ex) {
            Logger.getLogger(InserirRelatorio.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);

        } catch (Exception ex) {
            Logger.getLogger(InserirRelatorio.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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