/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Perfil;
import modelo.PerfilDAO;

public class AlterarPerfil extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarPerfil</title>");  
            out.println("</head>");
            out.println("<body>");
            
        int id = Integer.parseInt(request.getParameter("id"));
        String perfil = request.getParameter("perfil");
        if(id<=0){
            out.print("O ID do Perfil não foi encontrado!");
        }else if(perfil == null || perfil.equals("")){
            out.print("O campo Perfil deve ser preenchido!");
        }else{
            try{
                Perfil p = new Perfil();
                p.setIdPerfil(id);
                p.setPerfil(perfil);

                PerfilDAO pDB = new PerfilDAO();
                pDB.conectar();
                pDB.alterar(p);
                pDB.desconectar();

                out.print("<script language='javascript'>");
                out.print("alert('Perfil alterado com sucesso!!');");
                out.print("location.href='listar_perfil.jsp';");
                out.print("</script>");

            }catch(Exception erro){
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
