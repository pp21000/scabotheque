package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.commun.ContactFonction;
import java.util.Date;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class EditAdherentContact {

    private int adherentId;
    private String civilite;

    private int contactFonctionId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateNaissance;
    private MultipartFile file;
    // @NotEmpty(message = "{modification.fixeNotEmpty}")
    @Pattern(regexp = "^0[1-9](([ ][0-9]{2}){4})$", message = "{modification.phoneFixeFormat}")
    private String fixe;
    private ContactFonction fonction;
    private Integer id;
    private boolean isAccessEOLAS;
    private boolean isMailingAdministratif;
    private boolean isMailingCommercial;
    private boolean isMailingComptabilite;
    private boolean isMailingDirigeant;
    private String loginEOLAS;
    @NotEmpty(message = "{modification.mailNotEmpty}")
    @Email(message = "{modification.mailNotValid}")
    @Pattern(regexp = "[^()<>,;:\"|ç%&]+", message = "{modification.mailNotValid}")
    private String mail;

    @Pattern(regexp = "^$|0[6-9](([ ][0-9]{2}){4})$", message = "{modification.phoneMobileFormat}")
    private String mobile;
    @NotEmpty(message = "{modification.nomNotEmpty}")
    private String nom;
    private String passEOLAS;
    private String photoImg;
    @NotEmpty(message = "{modification.prenomNotEmpty}")
    private String prenom;
    private Integer roleSalarieEOLASId = 4;

    public int getAdherentId() {
        return adherentId;
    }

    public void setAdherentId(int adherentId) {
        this.adherentId = adherentId;
    }

    public String getCivilite() {
        return civilite;
    }

    public void setCivilite(String civilite) {
        this.civilite = civilite;
    }

    public int getContactFonctionId() {
        return contactFonctionId;
    }

    public void setContactFonctionId(int contactFonctionId) {
        this.contactFonctionId = contactFonctionId;
    }

    public Date getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(Date dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getFixe() {
        return fixe;
    }

    public void setFixe(String fixe) {
        this.fixe = fixe;
    }

    public ContactFonction getFonction() {
        return fonction;
    }

    public void setFonction(ContactFonction fonction) {
        this.fonction = fonction;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public boolean getIsAccessEOLAS() {
        return isAccessEOLAS;
    }

    public void setIsAccessEOLAS(boolean isAccessEOLAS) {
        this.isAccessEOLAS = isAccessEOLAS;
    }

    public boolean getIsMailingAdministratif() {
        return isMailingAdministratif;
    }

    public void setIsMailingAdministratif(boolean isAdministratif) {
        this.isMailingAdministratif = isAdministratif;
    }

    public boolean getIsMailingCommercial() {
        return isMailingCommercial;
    }

    public void setIsMailingCommercial(boolean isCommercial) {
        this.isMailingCommercial = isCommercial;
    }

    public boolean getIsMailingComptabilite() {
        return isMailingComptabilite;
    }

    public void setIsMailingComptabilite(boolean isComptabilite) {
        this.isMailingComptabilite = isComptabilite;
    }

    public boolean getIsMailingDirigeant() {
        return isMailingDirigeant;
    }

    public void setIsMailingDirigeant(boolean isDirigeant) {
        this.isMailingDirigeant = isDirigeant;
    }

    public String getLoginEOLAS() {
        return loginEOLAS;
    }

    public void setLoginEOLAS(String loginEOLAS) {
        this.loginEOLAS = loginEOLAS;
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

    public String getPassEOLAS() {
        return passEOLAS;
    }

    public void setPassEOLAS(String passEOLAS) {
        this.passEOLAS = passEOLAS;
    }

    public String getPhotoImg() {
        return photoImg;
    }

    public void setPhotoImg(String photoImg) {
        this.photoImg = photoImg;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Integer getRoleSalarieEOLASId() {
        return roleSalarieEOLASId;
    }

    public void setRoleSalarieEOLASId(Integer roleSalarieEOLASId) {
        this.roleSalarieEOLASId = roleSalarieEOLASId;
    }
}
