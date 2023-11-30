package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Relatorios;
import modelo.RelatoriosDAO;

public class ModificarContador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
             {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException ex) {
            Logger.getLogger(ModificarContador.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Contador</title>");
            out.println("</head>");
            out.println("<body>");

            int idRelatorio = Integer.parseInt(request.getParameter("idRelatorio"));
            Relatorios relatorio = new Relatorios();
            RelatoriosDAO rDB = new RelatoriosDAO();
            rDB.conectar();
            relatorio = rDB.carregarPorID(idRelatorio);

            String acao = request.getParameter("acao");
            String coluna = request.getParameter("coluna");

            if (acao.equals("incremento")) {
                switch (coluna) {
                    case "visitas":
                        relatorio.setVisitas(relatorio.getVisitas() + 1);
                        break;
                    case "telefonemas":
                        relatorio.setTelefonemas(relatorio.getTelefonemas() + 1);
                        break;
                    case "propostas":
                        relatorio.setPropostas(relatorio.getPropostas() + 1);
                        break;
                }

            } else if (acao.equals("decremento")) {
                switch (coluna) {
                    case "visitas":
                        relatorio.setVisitas(relatorio.getVisitas() - 1);
                        break;
                    case "telefonemas":
                        relatorio.setTelefonemas(relatorio.getTelefonemas() - 1);
                        break;
                    case "propostas":
                        relatorio.setPropostas(relatorio.getPropostas() - 1);
                        break;
                }
            }
            rDB.alterar(relatorio);
            rDB.desconectar();

        } catch (Exception e) {
            out.print(e);
        }

        out.println("</body>");
        out.println("</html>");
        out.close();
    }

}
