package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import BD.BDI;
import Model.Ferme;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class CRUD_ferme {

    // Ajouter une ferme
    public void ajouterFerme(String nom, int fermierId, String localisation, double superficie, Date dateCreation) {
        Ferme ferme = new Ferme(nom, fermierId, localisation, superficie, dateCreation);

        BDI bdi = new BDI();
        Connection con = bdi.getConnection();

        String sql = "INSERT INTO ferme (nom, fermier_id, localisation, superficie, date_creation) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, ferme.getNom());
            ps.setInt(2, ferme.getFermierId());
            ps.setString(3, ferme.getLocalisation());
            ps.setDouble(4, ferme.getSuperficie());
            ps.setDate(5, ferme.getDateCreation());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Ferme ajoutée avec succès !");
            } else {
                System.out.println("Échec de l'ajout de la ferme.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Afficher toutes les fermes (retourne ResultSet)
    public ResultSet afficherFermes() {
        BDI bdi = new BDI();
        ResultSet rs = null;
        try {
            Connection con = bdi.getConnection();
            String sql = "SELECT f.*, fr.nom AS nom_fermier FROM ferme f JOIN fermier fr ON f.fermier_id = fr.id;";
            	
            Statement st = con.createStatement();
            rs = st.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    // Modifier une ferme
    public void modifierFerme(int id, String nom, int fermierId, String localisation, double superficie, Date dateCreation) {
        BDI bdi = new BDI();
        try (Connection con = bdi.getConnection()) {
            String sql = "UPDATE ferme SET nom = ?, fermier_id = ?, localisation = ?, superficie = ?, date_creation = ? WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, nom);
                ps.setInt(2, fermierId);
                ps.setString(3, localisation);
                ps.setDouble(4, superficie);
                ps.setDate(5, dateCreation);
                ps.setInt(6, id);

                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Ferme modifiée avec succès !");
                } else {
                    System.out.println("Aucune modification effectuée.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Supprimer une ferme par ID
    public void supprimerFerme(int id) {
        BDI bdi = new BDI();
        try (Connection con = bdi.getConnection()) {
            String sql = "DELETE FROM ferme WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, id);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Ferme supprimée avec succès !");
                } else {
                    System.out.println("Aucune suppression effectuée.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Obtenir une ferme par ID
    public Ferme getFermeById(int id) {
        Connection conn = new BDI().getConnection();
        String sql = "SELECT * FROM ferme WHERE id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String nom = rs.getString("nom");
                int fermierId = rs.getInt("fermier_id");
                String localisation = rs.getString("localisation");
                double superficie = rs.getDouble("superficie");
                Date dateCreation = rs.getDate("date_creation");

                System.out.println("Ferme trouvée : " + id);

                return new Ferme(id, nom, fermierId, localisation, superficie, dateCreation);
            } else {
                System.out.println("Aucune ferme trouvée pour l'ID : " + id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
