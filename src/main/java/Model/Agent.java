package Model;
 
public class Agent {
    private int id;
    private String nom;
    private String role;
    private String certificatX509;
    private String emailGoogle;
    private String telephone;

    // Constructeur sans ID
    public Agent(String nom, String role, String certificatX509, String emailGoogle, String telephone) {
        this.nom = nom;
        this.role = role;
        this.certificatX509 = certificatX509;
        this.emailGoogle = emailGoogle;
        this.telephone = telephone;
    }

    // Constructeur avec ID
    public Agent(int id, String nom, String role, String certificatX509, String emailGoogle, String telephone) {
        this.id = id;
        this.nom = nom;
        this.role = role;
        this.certificatX509 = certificatX509;
        this.emailGoogle = emailGoogle;
        this.telephone = telephone;
    }

    // Constructeur avec ID uniquement
    public Agent(int id) {
        this.id = id;
    }

    // Getters et Setters
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String agent() {
        return certificatX509;
    }

    public void setCertificatX509(String certificatX509) {
        this.certificatX509 = certificatX509;
    }

    public String getCertificatX509() {
        return certificatX509;
    }

    public String getEmailGoogle() {
        return emailGoogle;
    }
    public void setEmailGoogle(String emailGoogle) {
        this.emailGoogle = emailGoogle;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
}
