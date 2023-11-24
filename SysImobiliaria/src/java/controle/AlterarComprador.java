package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Comprador;
import modelo.CompradorDAO;

public class AlterarComprador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarComprador</title>");
            out.println("</head>");
            out.println("<body>");

            int idComprador = Integer.parseInt(request.getParameter("idComprador"));
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String cpf = request.getParameter("cpf");
            String telefone = request.getParameter("telefone");

            if (nome == null || nome.equals("")) {
                out.print("O campo Nome deve ser preenchido!");
            } else if (email == null || email.equals("")) {
                out.print("O campo Email deve ser preenchido!");
            } else if (cpf == null || cpf.equals("")) {
                out.print("O campo localização deve ser preenchido!");
            } else if (telefone == null || telefone.equals("")) {
                out.print("O campo área útil deve ser preenchido!");

            } else if (idComprador < 1) {
                out.print("O ID do comprador não encontrado!");
            } else {

                try {
                    Comprador comprador = new Comprador();
                    comprador.setIdComprador(idComprador);
                    comprador.setNome(nome);
                    comprador.setEmail(email);
                    comprador.setCpf(cpf);
                    comprador.setTelefone(telefone);

                    CompradorDAO cDB = new CompradorDAO();
                    cDB.conectar();
                    cDB.alterar(comprador);
                    cDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Comprador atualizado com sucesso!!');");
                    out.print("location.href='listar_comprador.jsp';");
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


