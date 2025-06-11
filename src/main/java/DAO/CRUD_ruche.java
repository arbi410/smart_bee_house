package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import BD.BDI;
import Model.Ruche;

public class CRUD_ruche {

    // Ajouter une ruche
	public void ajouterRuche(int siteId, int id_fermier, int agentResponsableId, String codeIdentifiant, java.sql.Date dateInstallation) {
 		Ruche ruche = new Ruche(siteId,id_fermier, agentResponsableId, codeIdentifiant, dateInstallation);

	    BDI bdi = new BDI();
	    Connection con = bdi.getConnection();

	    if (con == null) {
	        System.out.println("Erreur : connexion à la base de données est nulle !");
	        return;
	    }

	 

	    String sql = "INSERT INTO ruche (site_id, id_fermier, agent_responsable_id, code_identifiant, date_installation) VALUES (?, ?, ?, ?, ?)";

	    try (PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setInt(1, ruche.getSiteId());
	        ps.setInt(2, ruche.getId_fermier());
	        ps.setInt(3, ruche.getAgentResponsableId());
	        ps.setString(4, ruche.getCodeIdentifiant());
	        ps.setDate(5, ruche.getDateInstallation());

	        int rowsAffected = ps.executeUpdate();

	        if (rowsAffected > 0) {
	            System.out.println("Ruche ajoutée avec succès !");
	            // Si la connexion n'est pas en auto-commit, valider la transaction
	            if (!con.getAutoCommit()) {
	                con.commit();
	            }
	        } else {
	            System.out.println("Échec de l'ajout de la ruche.");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

    // Afficher toutes les ruches
    public ResultSet afficherRuches() {
        Connection con = new BDI().getConnection();
        ResultSet rs = null;
        String sql = "SELECT r.*,s.nom AS nom_site ,a.nom AS nom_agent,f.nom AS nom_fermier FROM ruche r JOIN site s ON r.site_id = s.id join agent a on r.agent_responsable_id=a.id JOIN fermier f on r.id_fermier=f.id";
                 

        try {
            Statement st = con.createStatement();
            rs = st.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    
    
    
    
 
    
    
    public void modifierRuche(Ruche ruche) {
        BDI bdi = new BDI();
        try (Connection con = bdi.getConnection()) {
            String sql = "UPDATE ruche SET site_id = ?, id_fermier = ?, agent_responsable_id = ?, code_identifiant = ?, date_installation = ? WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, ruche.getSiteId());
                ps.setInt(2, ruche.getId_fermier());
                ps.setInt(3, ruche.getAgentResponsableId());
                ps.setString(4, ruche.getCodeIdentifiant());
                ps.setDate(5, ruche.getDateInstallation());
                ps.setInt(6, ruche.getId());

                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Ruche modifiée avec succès !");
                } else {
                    System.out.println("Aucune modification effectuée.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // Supprimer une ruche
    public void supprimerRuche(int rucheId) {
        Connection con = new BDI().getConnection();
        String sql = "DELETE FROM ruche WHERE id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, rucheId);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Ruche supprimée avec succès !");
            } else {
                System.out.println("Aucune ruche supprimée.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Récupérer une ruche par ID
    public Ruche getRucheById(int id) {
        Connection con = new BDI().getConnection();
        String sql = "SELECT r.*,s.nom AS nom_site ,a.nom AS nom_agent,f.nom AS nom_fermier FROM ruche r JOIN site s ON r.site_id = s.id join agent a on r.agent_responsable_id=a.id JOIN fermier f on r.id_fermier=f.id  WHERE r.id = ?";

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int siteId = rs.getInt("site_id");
                int fermeId = rs.getInt("id_fermier");
                int agentResponsableId = rs.getInt("agent_responsable_id");
                String codeIdentifiant = rs.getString("code_identifiant");
                java.sql.Date dateInstallation = rs.getDate("date_installation");

                return new Ruche(id, siteId, fermeId, agentResponsableId, codeIdentifiant, dateInstallation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
