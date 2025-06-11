package Control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

import DAO.CRUD_ferme;
import Model.Ferme;

@WebServlet("/fermeservlet")
public class fermeservlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            CRUD_ferme dao = new CRUD_ferme();

            if ("add".equals(action)) {
                try {
                    String nom = request.getParameter("nom");
                    int fermierId = Integer.parseInt(request.getParameter("fermierId"));
                    String localisation = request.getParameter("localisation");
                    double superficie = Double.parseDouble(request.getParameter("superficie"));
                    Date dateCreation = Date.valueOf(request.getParameter("date_creation"));

                    dao.ajouterFerme(nom, fermierId, localisation, superficie, dateCreation);
                    response.sendRedirect("fermeservlet?action=view");                } catch (Exception ex) {
                    ex.printStackTrace();
                    request.setAttribute("errorMessage", "Erreur lors de l'ajout : " + ex.getMessage());
                    request.getRequestDispatcher("ajouter_ferme.jsp").forward(request, response);
                }
        

            } else if ("delete".equals(action)) {
                int fermeId = Integer.parseInt(request.getParameter("id"));
                dao.supprimerFerme(fermeId);
                response.sendRedirect("fermeservlet?action=view");

            } else if ("view".equals(action)) {
                request.setAttribute("fermes", dao.afficherFermes());
                request.getRequestDispatcher("/ferme.jsp").forward(request, response);

            } else if ("update".equals(action)) {
                int fermeId = Integer.parseInt(request.getParameter("id"));
                String nom = request.getParameter("nom");
                int fermierId = Integer.parseInt(request.getParameter("fermierId"));
                String localisation = request.getParameter("localisation");
                double superficie = Double.parseDouble(request.getParameter("superficie"));
                Date dateCreation = Date.valueOf(request.getParameter("date_creation"));

                dao.modifierFerme(fermeId, nom, fermierId, localisation, superficie, dateCreation);
                response.sendRedirect("fermeservlet?action=view");

            } else if ("editForm".equals(action)) {
                int fermeId = Integer.parseInt(request.getParameter("id"));
                Ferme ferme = dao.getFermeById(fermeId);

                request.setAttribute("ferme", ferme);
                request.getRequestDispatcher("/edit_ferme.jsp").forward(request, response);

            } else {
                response.sendRedirect("erreur.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("erreur.jsp");
        }
    }
}
