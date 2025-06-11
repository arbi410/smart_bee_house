package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import BD.BDI;
import Model.Fermier;  // Créez cette classe modèle si nécessaire

public class CRUD_fermier {

    // Ajouter un fermier
	public void ajouterFermier(String nom, String email, String telephone, String adresse) {
	    Fermier fermier = new Fermier(nom, email, telephone, adresse);

	    BDI bdi = new BDI();
	    Connection con = bdi.getConnection();

	    String sql = "INSERT INTO fermier (nom, email, telephone, adresse) VALUES (?, ?, ?, ?)";

	    try (PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setString(1, fermier.getNom());
	        ps.setString(2, fermier.getEmail());
	        ps.setString(3, fermier.getTelephone());
	        ps.setString(4, fermier.getAdresse());

	        int rowsAffected = ps.executeUpdate();

	        if (rowsAffected > 0) {
	            System.out.println("Fermier ajouté avec succès !");
	        } else {
	            System.out.println("Échec de l'ajout du fermier.");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}


    // Afficher tous les fermiers (retourne ResultSet)
    public ResultSet afficherfermier() {
        BDI bdi = new BDI();
        ResultSet rs = null;
        try {
            Connection con = bdi.getConnection();
            String sql = "SELECT * FROM fermier";
            Statement st = con.createStatement();
            rs = st.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    // Modifier un fermier
    public void modifierFermier(int id, String nom, String email, String telephone, String adresse) {
        BDI bdi = new BDI();
        try (Connection con = bdi.getConnection()) {
            String sql = "UPDATE fermier SET nom = ?, email = ?, telephone = ?, adresse = ? WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, nom);
                ps.setString(2, email);
                ps.setString(3, telephone);
                ps.setString(4, adresse);
                ps.setInt(5, id);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Fermier modifié avec succès !");
                } else {
                    System.out.println("Aucune modification effectuée.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Supprimer un fermier par ID
    public void supprimerFermier(int id) {
        BDI bdi = new BDI();
        try (Connection con = bdi.getConnection()) {
            String sql = "DELETE FROM fermier WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, id);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Fermier supprimé avec succès !");
                } else {
                    System.out.println("Aucune suppression effectuée.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Obtenir un fermier par ID
    public Fermier getFermierById(int id) {
        Connection conn = new BDI().getConnection();
        String sql = "SELECT * FROM fermier WHERE id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String nom = rs.getString("nom");
                String email = rs.getString("email");
                String telephone = rs.getString("telephone");
                String adresse = rs.getString("adresse");

                System.out.println("Fermier trouvé : " + id);

                return new Fermier(id, nom, email, telephone, adresse);
            } else {
                System.out.println("Aucun fermier trouvé pour l'ID : " + id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
