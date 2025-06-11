package DAO;

import java.sql.*;
import BD.BDI;
import Model.Site;

public class CRUD_site {

    // Ajouter un site
    public void ajouterSite(String nom, int fermeId, double latitude, double longitude, double altitude, Date dateDebut, Date dateFin) {
        Site site = new Site(nom, fermeId, latitude, longitude, altitude, dateDebut, dateFin);
        Connection con = new BDI().getConnection();

        String sql = "INSERT INTO site (nom, ferme_id, latitude, longitude, altitude, date_debut, date_fin) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, site.getNom());
            ps.setInt(2, site.getFermeId());
            ps.setDouble(3, site.getLatitude());
            ps.setDouble(4, site.getLongitude());
            ps.setDouble(5, site.getAltitude());
            ps.setDate(6, site.getDateDebut());
            ps.setDate(7, site.getDateFin());

            ps.executeUpdate();
            System.out.println("Site ajouté avec succès !");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Afficher tous les sites
    public ResultSet afficherSites() {
        Connection con = new BDI().getConnection();
        ResultSet rs = null;

        String sql = "SELECT s.*, f.nom AS nom_ferme FROM site s JOIN ferme f ON s.ferme_id = f.id";

        try {
            Statement st = con.createStatement();
            rs = st.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }

    // Modifier un site
    public void modifierSite(int id, String nom, int fermeId, double latitude, double longitude, double altitude, Date dateDebut, Date dateFin) throws Exception {
        Connection con = new BDI().getConnection();

        String sql = "UPDATE site SET nom = ?, ferme_id = ?, latitude = ?, longitude = ?, altitude = ?, date_debut = ?, date_fin = ? WHERE id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, nom);
            ps.setInt(2, fermeId);
            ps.setDouble(3, latitude);
            ps.setDouble(4, longitude);
            ps.setDouble(5, altitude);
            ps.setDate(6, dateDebut);
            ps.setDate(7, dateFin);
            ps.setInt(8, id);

            ps.executeUpdate();
            System.out.println("Site modifié avec succès !");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Erreur lors de la modification : " + e.getMessage());
        } finally {
            if (con != null) con.close();
        }
    }

    // Supprimer un site
    public void supprimerSite(int siteId) {
        Connection con = new BDI().getConnection();
        String sql = "DELETE FROM site WHERE id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, siteId);
            ps.executeUpdate();
            System.out.println("Site supprimé !");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Obtenir un site par ID
    public Site getSiteById(int id) {
        Connection con = new BDI().getConnection();
        String sql = "SELECT * FROM site WHERE id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String nom = rs.getString("nom");
                int fermeId = rs.getInt("ferme_id");
                double latitude = rs.getDouble("latitude");
                double longitude = rs.getDouble("longitude");
                double altitude = rs.getDouble("altitude");
                Date dateDebut = rs.getDate("date_debut");
                Date dateFin = rs.getDate("date_fin");

                return new Site(id, nom, fermeId, latitude, longitude, altitude, dateDebut, dateFin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
