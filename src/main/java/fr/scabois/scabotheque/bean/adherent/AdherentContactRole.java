package fr.scabois.scabotheque.bean.adherent;

import fr.scabois.scabotheque.bean.HasId;
import fr.scabois.scabotheque.bean.commun.ContactFonction;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
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

@Entity
@Table(name = "adherent_contact")
public class AdherentContactRole implements HasId {

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "adherent_id")
  private Adherent adherent;
  private String civilite;
  @Column(name = "date_naissance")
  private Date dateNaissance;
  private String fixe;

  @ManyToOne
  @JoinColumn(name = "fonction_contact_id")
  private ContactFonction fonction;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  @Column(name = "accesEOLAS")
  private boolean isAccessEOLAS;
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
  private String loginEOLAS;
  private String mail;
  private String mobile;
  private String nom;
  private String passEOLAS;

  private byte[] photo;
  private String prenom;

//    @ManyToOne()
  @Column(name = "role_Salarie_EOLAS_id")
  private Integer roleSalarieEOLASId;

  public Adherent getAdherent() {
    return adherent;
  }

  public void setAdherent(Adherent adherent) {
    this.adherent = adherent;
  }

  public int getAge() {
    LocalDate contactDate = dateNaissance == null ? LocalDate.now() : dateNaissance.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    return Period.between(contactDate, LocalDate.now()).getYears();
  }

  public String getCivilite() {
    return civilite;
  }

  public void setCivilite(String civilite) {
    this.civilite = civilite;
  }

  public Date getDateNaissance() {
    return dateNaissance;
  }

  public void setDateNaissance(Date dateNaissance) {
    this.dateNaissance = dateNaissance;
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

  @Override
  public Integer getId() {
    return id;
  }

  @Override
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

  public boolean getIsMailingCommerce() {
    return isMailingCommerce;
  }

  public void setIsMailingCommerce(boolean isCommerce) {
    this.isMailingCommerce = isCommerce;
  }

  public boolean getIsMailingCompta() {
    return isMailingCompta;
  }

  public void setIsMailingCompta(boolean isCompta) {
    this.isMailingCompta = isCompta;
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

  public byte[] getPhoto() {
    return photo;
  }

  public void setPhoto(byte[] photo) {
    this.photo = photo;
  }

  public String getPhotoImg() {
    return photo == null ? "" : new String(photo);
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

  public String getlibelle() {
    return this.nom + " - " + this.prenom;
  }

}
