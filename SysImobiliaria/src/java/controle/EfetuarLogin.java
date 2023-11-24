package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Corretor;
import modelo.CorretorDAO;

@WebServlet(name = "EfetuarLogin", urlPatterns = {"/EfetuarLogin"})
public class EfetuarLogin extends HttpServlet {
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EfetuarLogin</title>");
            out.println("</head>");
            out.println("<body>");
            
            HttpSession session = request.getSession();

            String login = request.getParameter("login");
            String senha = request.getParameter("senha");

            try {
                CorretorDAO cDB = new CorretorDAO();
                cDB.conectar();
                Corretor c = cDB.logar(login, senha);

                if (c.getIdCorretor()> 0) {
                    
                    session.setAttribute("corretor", c);
                    response.sendRedirect("index.jsp");
                    
                } else {
                    out.print("<script language='javascript'>");
                    out.print("alert('Usuario ou Senha inválidos!!');");
                    out.print("location.href='login.jsp';");
                    out.print("</script>");
                }


            } catch (Exception e) {
                out.print(e);
            }


            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
