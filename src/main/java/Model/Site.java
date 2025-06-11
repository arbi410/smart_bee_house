package Model;

import java.sql.Date;

public class Site {
    private int id;
    private String nom;
    private int fermeId;
    private double latitude;
    private double longitude;
    private double altitude;
    private Date dateDebut;
    private Date dateFin;

    // Constructeur complet avec ID (utile pour modification et récupération)
    public Site(int id, String nom, int fermeId, double latitude, double longitude, double altitude, Date dateDebut, Date dateFin) {
        this.id = id;
        this.nom = nom;
        this.fermeId = fermeId;
        this.latitude = latitude;
        this.longitude = longitude;
        this.altitude = altitude;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
    }

    // Constructeur sans ID (utile pour insertion)
    public Site(String nom, int fermeId, double latitude, double longitude, double altitude, Date dateDebut, Date dateFin) {
        this.nom = nom;
        this.fermeId = fermeId;
        this.latitude = latitude;
        this.longitude = longitude;
        this.altitude = altitude;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
    }

    // Getters et setters
    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public int getFermeId() {
        return fermeId;
    }

    public double getLatitude() {
        return latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public double getAltitude() {
        return altitude;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setFermeId(int fermeId) {
        this.fermeId = fermeId;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public void setAltitude(double altitude) {
        this.altitude = altitude;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }
}
