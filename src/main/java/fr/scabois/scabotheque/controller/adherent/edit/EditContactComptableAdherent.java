package fr.scabois.scabotheque.controller.adherent.edit;

import javax.validation.constraints.Pattern;

public class EditContactComptableAdherent {

    private Integer id;
    private Integer adherentId;

//    @NotEmpty(message = "{modification.notempty}")
    private String cabinet;
    private String civilite;

    @Pattern(regexp = "^$|0[1-9](([ ][0-9]{2}){4})$", message = "{modification.phoneFixeFormat}")
    private String fixe;
//    @NotEmpty(message = "{modification.mailNotEmpty}")
//    @Email(message = "{modification.mailNotValid}")
    @Pattern(regexp = "^$|[^()<>,;:\"|ç%&]+", message = "{modification.mailNotValid}")
    private String mail;
    @Pattern(regexp = "^$|0[6-9](([ ][0-9]{2}){4})$", message = "{modification.phoneMobileFormat}")
    private String mobile;
    private String nom;
    private String prenom;

    public Integer getAdherentId() {
        return adherentId;
    }

    public void setAdherentId(Integer adherentId) {
        this.adherentId = adherentId;
    }

    public String getCabinet() {
        return cabinet;
    }

    public void setCabinet(String cabinet) {
        this.cabinet = cabinet;
    }

    public String getCivilite() {
        return civilite;
    }

    public void setCivilite(String civilite) {
        this.civilite = civilite;
    }

    public String getFixe() {
        return fixe;
    }

    public void setFixe(String fixe) {
        this.fixe = fixe;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

}
