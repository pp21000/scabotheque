package fr.scabois.scabotheque.bean.adherent;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import fr.scabois.scabotheque.bean.HasId;
import fr.scabois.scabotheque.bean.commun.ContactFonction;

@Entity
@Table(name = "adherent_contact")
public class AdherentContactRole implements HasId {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "adherent_id")
    private Adherent adherent;
    private String civilite;
    private String fixe;

    @ManyToOne
    @JoinColumn(name = "fonction_contact_id")
    private ContactFonction fonction;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "administratif")
//    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean isMailingAdministratif;
    @Column(name = "commerce")
//    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean isMailingCommerce;
    @Column(name = "compta")
//    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean isMailingCompta;
    @Column(name = "dirigeant")
//    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean isMailingDirigeant;
    private String mail;
    private String mobile;

    private Date naissance;
    private String nom;
    private byte[] photo;
    private String prenom;

    public Adherent getAdherent() {
	return adherent;
    }

    public String getCivilite() {
	return civilite;
    }

    public String getFixe() {
	return fixe;
    }

    public ContactFonction getFonction() {
	return fonction;
    }

    @Override
    public Integer getId() {
	return id;
    }

    public boolean getIsMailingAdministratif() {
	return isMailingAdministratif;
    }

    public boolean getIsMailingCommerce() {
	return isMailingCommerce;
    }

    public boolean getIsMailingCompta() {
	return isMailingCompta;
    }

    public boolean getIsMailingDirigeant() {
	return isMailingDirigeant;
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

    public byte[] getPhoto() {
	return photo;
    }

    public String getPhotoImg() {
	return photo == null ? "" : new String(photo);
    }

    public String getPrenom() {
	return prenom;
    }

    public void setAdherent(Adherent adherent) {
	this.adherent = adherent;
    }

    public void setCivilite(String civilite) {
	this.civilite = civilite;
    }

    public void setFixe(String fixe) {
	this.fixe = fixe;
    }

    public void setFonction(ContactFonction fonction) {
	this.fonction = fonction;
    }

    @Override
    public void setId(Integer id) {
	this.id = id;
    }

    public void setIsMailingAdministratif(boolean isAdministratif) {
	this.isMailingAdministratif = isAdministratif;
    }

    public void setIsMailingCommerce(boolean isCommerce) {
	this.isMailingCommerce = isCommerce;
    }

    public void setIsMailingCompta(boolean isCompta) {
	this.isMailingCompta = isCompta;
    }

    public void setIsMailingDirigeant(boolean isDirigeant) {
	this.isMailingDirigeant = isDirigeant;
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

    public void setPhoto(byte[] photo) {
	this.photo = photo;
    }

    public void setPrenom(String prenom) {
	this.prenom = prenom;
    }

}