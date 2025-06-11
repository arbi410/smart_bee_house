package Model;

import java.sql.Date;

public class Ruche {
    private int id;
    private int siteId;
     private int agentResponsableId;
    private String codeIdentifiant;
    private Date dateInstallation;
	private int id_fermier;

    // Coprivate int propriétaireId;  // ou proprietaireId si accents posent problème

    public int getId_fermier() {
        return id_fermier;
    }

public void setId_fermier(int id_fermier) {
    this.id_fermier = id_fermier;
}
//nstructeur sans id (pour ajout)
    public Ruche(int siteId, int id_fermier, int agentResponsableId, String codeIdentifiant, Date dateInstallation) {
        this.siteId = siteId;
        this.id_fermier = id_fermier;
        this.agentResponsableId = agentResponsableId;
        this.codeIdentifiant = codeIdentifiant;
        this.dateInstallation = dateInstallation;
    }

    // Constructeur avec id (pour modification, récupération)
    public Ruche(int id, int siteId, int id_fermier, int agentResponsableId, String codeIdentifiant, Date dateInstallation) {
        this.id = id;
        this.siteId = siteId;
        this.id_fermier = id_fermier;
        this.agentResponsableId = agentResponsableId;
        this.codeIdentifiant = codeIdentifiant;
        this.dateInstallation = dateInstallation;
    }

    public Ruche() {}
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSiteId() {
        return siteId;
    }

    public void setSiteId(int siteId) {
        this.siteId = siteId;
    }

 

    public int getAgentResponsableId() {
        return agentResponsableId;
    }

    public void setAgentResponsableId(int agentResponsableId) {
        this.agentResponsableId = agentResponsableId;
    }

    public String getCodeIdentifiant() {
        return codeIdentifiant;
    }

    public void setCodeIdentifiant(String codeIdentifiant) {
        this.codeIdentifiant = codeIdentifiant;
    }

    public Date getDateInstallation() {
        return dateInstallation;
    }

    public void setDateInstallation(Date dateInstallation) {
        this.dateInstallation = dateInstallation;
    }
}
