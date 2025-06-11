package Control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.CRUD_site;
import Model.Site;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/siteservlet")
public class siteservlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            CRUD_site dao = new CRUD_site();

            if ("add".equals(action)) {
                String nom = request.getParameter("nom");
                int fermeId = Integer.parseInt(request.getParameter("fermeId"));
                double latitude = Double.parseDouble(request.getParameter("latitude"));
                double longitude = Double.parseDouble(request.getParameter("longitude"));
                double altitude = Double.parseDouble(request.getParameter("altitude"));
                Date dateDebut = Date.valueOf(request.getParameter("date_debut"));
                Date dateFin = Date.valueOf(request.getParameter("date_fin"));

                dao.ajouterSite(nom, fermeId, latitude, longitude, altitude, dateDebut, dateFin);
                response.sendRedirect("siteservlet?action=view");

            } else if ("delete".equals(action)) {
                int siteId = Integer.parseInt(request.getParameter("id"));
                dao.supprimerSite(siteId);
                response.sendRedirect("siteservlet?action=view");

            } else if ("view".equals(action)) {
                request.setAttribute("sites", dao.afficherSites());
                request.getRequestDispatcher("/site.jsp").forward(request, response);

            } else if ("update".equals(action)) {
                int siteId = Integer.parseInt(request.getParameter("id"));
                String nom = request.getParameter("nom");
                int fermeId = Integer.parseInt(request.getParameter("fermeId"));
                double latitude = Double.parseDouble(request.getParameter("latitude"));
                double longitude = Double.parseDouble(request.getParameter("longitude"));
                double altitude = Double.parseDouble(request.getParameter("altitude"));
                Date dateDebut = Date.valueOf(request.getParameter("date_debut"));
                Date dateFin = Date.valueOf(request.getParameter("date_fin"));

                dao.modifierSite(siteId, nom, fermeId, latitude, longitude, altitude, dateDebut, dateFin);
                response.sendRedirect("siteservlet?action=view");

            } else if ("editForm".equals(action)) {
                int siteId = Integer.parseInt(request.getParameter("id"));
                Site site = dao.getSiteById(siteId);

                request.setAttribute("site", site);
                request.getRequestDispatcher("/edit_site.jsp").forward(request, response);

            } else {
                response.sendRedirect("erreur.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("erreur.jsp");
        }
    }
}
