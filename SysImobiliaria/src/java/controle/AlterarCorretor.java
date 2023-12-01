package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Corretor;
import modelo.CorretorDAO;

public class AlterarCorretor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarCorretor</title>");
            out.println("</head>");
            out.println("<body>");

            int idCorretor = Integer.parseInt(request.getParameter("idCorretor"));
            int idPerfil = Integer.parseInt(request.getParameter("idPerfil"));
            String nomeCorretor = request.getParameter("nomeCorretor");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            String status = request.getParameter("status");

            if (nomeCorretor == null || nomeCorretor.equals("")) {
                out.print("O campo Nome deve ser preenchido!");
            } else if (login == null || login.equals("")) {
                out.print("O campo Login deve ser preenchido!");
            } else if (senha == null || senha.equals("")) {
                out.print("O campo Senha deve ser preenchido!");
            } else if (idPerfil < 1) {
                out.print("O campo Perfil deve ser preenchido!");
            } else if (idCorretor < 1) {
                out.print("O ID do usuário não encontrado!");
            } else {
                try {
                    Corretor c = new Corretor();
                    c.setIdCorretor(idCorretor);
                    c.setIdPerfil(idPerfil);
                    c.setNomeCorretor(nomeCorretor);
                    c.setLogin(login);
                    c.setSenha(senha);
                    c.setStatus(status);
                    CorretorDAO cDB = new CorretorDAO();
                    cDB.conectar();
                    cDB.alterar(c);
                    cDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Corretor atualizado com sucesso!!');");
                    out.print("location.href='listar_corretor.jsp';");
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
