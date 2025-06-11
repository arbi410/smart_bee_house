package DAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import BD.BDI;
import Model.Agent;

/**
 * Servlet implementation class CRUD_agent
 */
@WebServlet("/CRUD_agent")
public class CRUD_agent extends HttpServlet {
	public void ajouteragent(String Nom, String role, String certificatX509, String emailGoogle, String telephone) {
	    Agent agent = new Agent(Nom, role, certificatX509, emailGoogle, telephone);

	    BDI bdi = new BDI();
	    Connection con = bdi.getConnection();

	    String sql = "INSERT INTO agent (Nom, rôle, certificat_x509, email_google, telephone) VALUES (?, ?, ?, ?, ?)";

	    try (PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setString(1, agent.getNom());
	        ps.setString(2, agent.getRole());
	        ps.setString(3, agent.getCertificatX509());
	        ps.setString(4, agent.getEmailGoogle());
	        ps.setString(5, agent.getTelephone());

	        int rowsAffected = ps.executeUpdate();

	        if (rowsAffected > 0) {
	            System.out.println("Agent ajouté avec succès !");
	        } else {
	            System.out.println("Échec de l'ajout.");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}


	    // Afficher toutes les réservations
	    public ResultSet afficheragent() {
	        Connection con = new BDI().getConnection();
	        ResultSet rs = null;

	        // Requête SQL pour afficher les réservations avec les détails des clients et des tables
	        String sql = "SELECT * FROM agent";
	        		

	        try {
	            Statement st = con.createStatement();
	            rs = st.executeQuery(sql);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return rs;
	    }
	//modif
	    public void modifieragent(int id, String nom, String role, String certificatX509, String emailGoogle, String telephone) throws Exception {
	        Connection con = new BDI().getConnection();
	        PreparedStatement stmt = null;

	        try {
	            String sql = "UPDATE agent SET Nom = ?, rôle = ?, certificat_x509 = ?, email_google = ?, telephone = ? WHERE id = ?";

	            stmt = con.prepareStatement(sql);

	            stmt.setString(1, nom);
	            stmt.setString(2, role);
	            stmt.setString(3, certificatX509);
	            stmt.setString(4, emailGoogle);
	            stmt.setString(5, telephone);
	            stmt.setInt(6, id);

	            stmt.executeUpdate();

	            System.out.println("Agent mis à jour avec succès !");
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new Exception("Erreur lors de la mise à jour de l'agent : " + e.getMessage());
	        } finally {
	            if (stmt != null) stmt.close();
	            if (con != null) con.close();
	        }
	    }


	    
	    // Supprimer une réservation par ID
	    public void supprimeragent(int agentId) {
	        Connection con = new BDI().getConnection();
	        String sql = "DELETE FROM agent WHERE id = ?";

	        // Utiliser PreparedStatement pour la suppression
	        try (PreparedStatement ps = con.prepareStatement(sql)) {
	            ps.setInt(1, agentId);
	            int rowsAffected = ps.executeUpdate();
	            if (rowsAffected > 0) {
	                System.out.println("agent supprimée avec succès !");
	            } else {
	                System.out.println("Aucune agent supprimée.");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    //afficher selon id
	    public Agent getagentnById(int id) {
	        Connection conn = new BDI().getConnection();
	        String sql = "SELECT * FROM agent WHERE id = ?";
	        
	        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setInt(1, id);
	            ResultSet rs = stmt.executeQuery();

	            if (rs.next()) {
	                String nom = rs.getString("nom");
	                String role = rs.getString("rôle"); // ou "role" selon ton schéma exact
	                String certificatX509 = rs.getString("certificat_x509");
	                String emailGoogle = rs.getString("email_google");
	                String telephone = rs.getString("telephone");

	                System.out.println("Agent trouvé : " + id);

	                return new Agent(id, nom, role, certificatX509, emailGoogle, telephone);
	            } else {
	                System.out.println("Aucun agent trouvé pour l'ID : " + id);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return null;
	    }

	    //verif 
	    public boolean checkTableAvailability(int tableId, String date, String heure) {
	        Connection conn = new BDI().getConnection();
	        String sql = "SELECT COUNT(*) FROM reservations WHERE table_id = ? ";

	        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setInt(1, tableId);
	          

	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                return rs.getInt(1) == 0; // Si le nombre est 0, la table est disponible
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false; // Par défaut, si une erreur se produit, la table est considérée comme non disponible
	    }

	}
