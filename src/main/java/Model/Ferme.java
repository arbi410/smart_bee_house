package Model;

import java.sql.Date;

public class Ferme {
    private int id;
    private String nom;
    private int fermierId;
    private String localisation;
    private double superficie;
    private Date dateCreation;

    // Constructeur vide
    public Ferme() {}

    // Constructeur avec tous les champs (id inclus)
    public Ferme(int id, String nom, int fermierId, String localisation, double superficie, Date dateCreation) {
        this.id = id;
        this.nom = nom;
        this.fermierId = fermierId;
        this.localisation = localisation;
        this.superficie = superficie;
        this.dateCreation = dateCreation;
    }

    // Constructeur sans id (pour insertion)
    public Ferme(String nom, int fermierId, String localisation, double superficie, Date dateCreation) {
        this.nom = nom;
        this.fermierId = fermierId;
        this.localisation = localisation;
        this.superficie = superficie;
        this.dateCreation = dateCreation;
    }

    // Getters et setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getFermierId() {
        return fermierId;
    }

    public void setFermierId(int fermierId) {
        this.fermierId = fermierId;
    }

    public String getLocalisation() {
        return localisation;
    }

    public void setLocalisation(String localisation) {
        this.localisation = localisation;
    }

    public double getSuperficie() {
        return superficie;
    }

    public void setSuperficie(double superficie) {
        this.superficie = superficie;
    }

    public Date getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(Date dateCreation) {
        this.dateCreation = dateCreation;
    }
}
