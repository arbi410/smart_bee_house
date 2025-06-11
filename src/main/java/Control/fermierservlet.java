package Control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.CRUD_fermier;
import Model.Agent;
import Model.Fermier;

/**
 * Servlet implementation class agentservlet
 */
@WebServlet("/fermierservlet")
public class fermierservlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");

	        try {
	        	CRUD_fermier dao = new CRUD_fermier();

	            // Pour l'action d'ajout (add)
	            if ("add".equals(action)) {
	            	   String nom = request.getParameter("nom");
	            	    String email = request.getParameter("email");
	            	    String telephone = request.getParameter("telephone");
	            	    String adresse = request.getParameter("adresse");

	            	    // Appel à la méthode DAO pour ajouter un fermier
	            	    dao.ajouterFermier(nom, email, telephone, adresse);
	            	    response.sendRedirect("fermierservlet?action=view");
	            } 
	      else if ("delete".equals(action)) {
	            int fermierId = Integer.parseInt(request.getParameter("id"));
	            dao.supprimerFermier(fermierId);
        	    response.sendRedirect("fermierservlet?action=view");

	        } else if ("view".equals(action)) {
	            request.setAttribute("fermiers", dao.afficherfermier());
	            request.getRequestDispatcher("/fermier.jsp").forward(request, response);

	        } else if ("update".equals(action)) {
	            int fermierId = Integer.parseInt(request.getParameter("id"));
	            String nom = request.getParameter("nom");
	            String email = request.getParameter("email");
	            String telephone = request.getParameter("telephone");
	            String adresse = request.getParameter("adresse");

	            dao.modifierFermier(fermierId, nom, email, telephone, adresse);
        	    response.sendRedirect("fermierservlet?action=view");
	         
	        }  
	        else if ("editForm".equals(action)) {
	            try {
	                int fermierId = Integer.parseInt(request.getParameter("id"));
	                Fermier fermier = dao.getFermierById(fermierId);
	                request.setAttribute("fermier", fermier);
	                request.getRequestDispatcher("/editFermier.jsp").forward(request, response);
	            } catch (Exception e) {
	                e.printStackTrace();
	                // gérer l'erreur (afficher une page d'erreur ou message)
	            }
	     
	      
	        
	      
	        }   
	      
	            
	            
	        
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("erreur.jsp");
	        }
	    }
	}