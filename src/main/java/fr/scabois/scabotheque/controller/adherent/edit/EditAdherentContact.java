package fr.scabois.scabotheque.controller.adherent.edit;

import java.util.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import fr.scabois.scabotheque.bean.commun.ContactFonction;

public class EditAdherentContact {

    private int adherentId;
    private String civilite;

    private int contactFonctionId;
    private MultipartFile file;
    // @NotEmpty(message = "{modification.fixeNotEmpty}")
    @Pattern(regexp = "^0[1-9](([ ][0-9]{2}){4})$", message = "{modification.phoneFixeFormat}")
    private String fixe;
    private ContactFonction fonction;
    private Integer id;
    private boolean isMailingAdministratif;
    private boolean isMailingCommercial;
    private boolean isMailingComptabilite;
    private boolean isMailingDirigeant;
    private boolean isAccessEOLAS;
    @NotEmpty(message = "{modification.mailNotEmpty}")
    @Email(message = "{modification.mailNotValid}")
    @Pattern(regexp = "[^()<>,;:\"|ç%&]+", message = "{modification.mailNotValid}")
    private String mail;

    @Pattern(regexp = "^$|0[6-9](([ ][0-9]{2}){4})$", message = "{modification.phoneMobileFormat}")
    private String mobile;
    private Date naissance;
    @NotEmpty(message = "{modification.nomNotEmpty}")
    private String nom;
    private String photoImg;
    @NotEmpty(message = "{modification.prenomNotEmpty}")
    private String prenom;

    private String loginEOLAS;
    private String passEOLAS;

    public String getLoginEOLAS() {
        return loginEOLAS;
    }

    public void setLoginEOLAS(String loginEOLAS) {
        this.loginEOLAS = loginEOLAS;
    }

    public String getPassEOLAS() {
        return passEOLAS;
    }

    public void setPassEOLAS(String passEOLAS) {
        this.passEOLAS = passEOLAS;
    }

    public int getAdherentId() {
        return adherentId;
    }

    public String getCivilite() {
        return civilite;
    }

    public int getContactFonctionId() {
        return contactFonctionId;
    }

    public MultipartFile getFile() {
        return file;
    }

    public String getFixe() {
        return fixe;
    }

    public ContactFonction getFonction() {
        return fonction;
    }

    public Integer getId() {
        return id;
    }

    public boolean getIsMailingAdministratif() {
        return isMailingAdministratif;
    }

    public boolean getIsMailingCommercial() {
        return isMailingCommercial;
    }

    public boolean getIsMailingComptabilite() {
        return isMailingComptabilite;
    }

    public boolean getIsMailingDirigeant() {
        return isMailingDirigeant;
    }

    public boolean getIsAccessEOLAS() {
        return isAccessEOLAS;
    }

    public String getMail() {
        return mail;
    }

    public String getMobile() {
        return mobile;
    }

    public Date getNaissance() {
        return naissance;
    }

    public String getNom() {
        return nom;
    }

    public String getPhotoImg() {
        return photoImg;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setAdherentId(int adherentId) {
        this.adherentId = adherentId;
    }

    public void setCivilite(String civilite) {
        this.civilite = civilite;
    }

    public void setContactFonctionId(int contactFonctionId) {
        this.contactFonctionId = contactFonctionId;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public void setFixe(String fixe) {
        this.fixe = fixe;
    }

    public void setFonction(ContactFonction fonction) {
        this.fonction = fonction;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setIsMailingAdministratif(boolean isAdministratif) {
        this.isMailingAdministratif = isAdministratif;
    }

    public void setIsMailingCommercial(boolean isCommercial) {
        this.isMailingCommercial = isCommercial;
    }

    public void setIsMailingComptabilite(boolean isComptabilite) {
        this.isMailingComptabilite = isComptabilite;
    }

    public void setIsMailingDirigeant(boolean isDirigeant) {
        this.isMailingDirigeant = isDirigeant;
    }

    public void setIsAccessEOLAS(boolean isAccessEOLAS) {
        this.isAccessEOLAS = isAccessEOLAS;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public void setNaissance(Date naissance) {
        this.naissance = naissance;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPhotoImg(String photoImg) {
        this.photoImg = photoImg;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
}
