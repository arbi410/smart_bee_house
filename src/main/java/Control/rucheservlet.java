package Control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.CRUD_ruche;
import Model.Ruche;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/rucheservlet")
public class rucheservlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            CRUD_ruche dao = new CRUD_ruche();
            if ("add".equals(action)) {
            
                	int siteId = Integer.parseInt(request.getParameter("siteId"));
                	int id_fermier = Integer.parseInt(request.getParameter("id_fermier"));
 ;
                	int agentResponsableId = Integer.parseInt(request.getParameter("agentResponsableId"));
                	String codeIdentifiant = request.getParameter("code_identifiant");
                	java.sql.Date dateInstallation = java.sql.Date.valueOf(request.getParameter("date_installation"));
                    dao.ajouterRuche(siteId, id_fermier, agentResponsableId, codeIdentifiant, dateInstallation);
	                response.sendRedirect("rucheservlet?action=view");
	    
             
	              
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.supprimerRuche(id);
                response.sendRedirect("rucheservlet?action=view");

            } else if ("view".equals(action)) {
                request.setAttribute("ruches", dao.afficherRuches());
                request.getRequestDispatcher("/ruche.jsp").forward(request, response);

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                int siteId = Integer.parseInt(request.getParameter("site_id"));
                int ferme_id = Integer.parseInt(request.getParameter("ferme_id"));
                int agentResponsableId = Integer.parseInt(request.getParameter("agent_responsable_id"));
                String codeIdentifiant = request.getParameter("code_identifiant");
                Date dateInstallation = Date.valueOf(request.getParameter("date_installation"));

                Ruche ruche = new Ruche(id, siteId, ferme_id, agentResponsableId, codeIdentifiant, dateInstallation);
                dao.modifierRuche(ruche);
                response.sendRedirect("rucheservlet?action=view");

            } else if ("editForm".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Ruche ruche = dao.getRucheById(id);
                request.setAttribute("ruche", ruche);
                request.getRequestDispatcher("/edit_ruche.jsp").forward(request, response);

            } else {
                response.sendRedirect("erreur.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("erreur.jsp");
        }
    }
}
