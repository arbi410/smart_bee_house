package Control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.CRUD_agent;
import Model.Agent;

 
@WebServlet("/agentservlet")
public class agentservlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");

	        try {
	            CRUD_agent dao = new CRUD_agent();

	            // Pour l'action d'ajout (add)
	            if ("add".equals(action)) {
	            	 
	            	String Nom = request.getParameter("Nom");
	            	String role = request.getParameter("role");
	            	String certificatX509 = request.getParameter("certificatX509");
	            	String emailGoogle = request.getParameter("emailGoogle");
	            	String telephone = request.getParameter("telephone");

	                 dao.ajouteragent(Nom, role, certificatX509, emailGoogle,telephone);
	                response.sendRedirect("agentservlet?action=view");
	           
	            } 
 	            else if ("delete".equals(action)) {
	                int agentId = Integer.parseInt(request.getParameter("id"));
	                dao.supprimeragent(agentId);
	                response.sendRedirect("agentservlet?action=view");

	            } 
 	            else if ("view".equals(action)) {
	                request.setAttribute("agent", dao.afficheragent());
	                request.getRequestDispatcher("/agent.jsp").forward(request, response);

	            } 
 	            else if ("update".equals(action)) {
 	            	int agentId = Integer.parseInt(request.getParameter("id"));
 	            	String nom = request.getParameter("nom");
 	            	String role = request.getParameter("role");
 	            	String certificatX509 = request.getParameter("certificatx509");
 	            	String emailGoogle = request.getParameter("emailgoogle");
 	            	String telephone = request.getParameter("telephone");

 	            	// Appel DAO pour mise à jour
 	            	dao.modifieragent(agentId, nom, role, certificatX509, emailGoogle, telephone);

 	            	// Redirection après mise à jour
 	            	response.sendRedirect("agentservlet?action=view");


	            }
	            
 	            else if ("editForm".equals(action)) {
	                int agentId = Integer.parseInt(request.getParameter("id"));
 	            Agent agent = dao.getagentnById(agentId);

	             request.setAttribute("agent", agent);
	              request.getRequestDispatcher("/edit_agent.jsp").forward(request, response);

	            } else {
	                response.sendRedirect("erreur.jsp");
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("erreur.jsp");
	        }
	    }
	}