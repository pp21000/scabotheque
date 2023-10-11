package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.commun.Commune;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class EditContactRetraite {

  private Integer id;
  @NotNull(message = "{modification.notempty}")
  private Integer adherentId;
  private String civilite;
  @Pattern(regexp = "^$|0[6-9](([ ][0-9]{2}){4})$", message = "{modification.phoneMobileFormat}")
  private String mobile;
  @Pattern(regexp = "^$|0[1-9](([ ][0-9]{2}){4})$", message = "{modification.phoneFixeFormat}")
  private String fixe;
  @NotEmpty(message = "{modification.mailNotEmpty}")
  @Email(message = "{modification.mailNotValid}")
  @Pattern(regexp = "^$|[^()<>,;:\"|\u00e7%&]+", message = "{modification.mailNotValid}")
  private String mail;
  @NotEmpty(message = "{modification.nomNotEmpty}")
  private String nom;
  @NotEmpty(message = "{modification.prenomNotEmpty}")
  private String prenom;
  private Commune commune;
  @NotEmpty(message = "{modification.notempty}")
  private String adresse;
  private String adresseComplement;
  private String commentaire;

  public Integer getAdherentId() {
    return this.adherentId;
  }

  public void setAdherentId(final Integer adherentId) {
    this.adherentId = adherentId;
  }

  public String getAdresse() {
    return this.adresse;
  }

  public void setAdresse(final String adresse) {
    this.adresse = adresse;
  }

  public String getAdresseComplement() {
    return this.adresseComplement;
  }

  public void setAdresseComplement(final String adresseComplement) {
    this.adresseComplement = adresseComplement;
  }

  public String getCivilite() {
    return this.civilite;
  }

  public void setCivilite(final String civilite) {
    this.civilite = civilite;
  }

  public Commune getCommune() {
    return this.commune;
  }

  public void setCommune(final Commune commune) {
    this.commune = commune;
  }

  public String getFixe() {
    return this.fixe;
  }

  public void setFixe(final String fixe) {
    this.fixe = fixe;
  }

  public Integer getId() {
    return this.id;
  }

  public void setId(final Integer id) {
    this.id = id;
  }

  public String getMail() {
    return this.mail;
  }

  public void setMail(final String mail) {
    this.mail = mail;
  }

  public String getMobile() {
    return this.mobile;
  }

  public void setMobile(final String mobile) {
    this.mobile = mobile;
  }

  public String getNom() {
    return this.nom;
  }

  public void setNom(final String nom) {
    this.nom = nom;
  }

  public String getCommentaire() {
    return this.commentaire;
  }

  public void setCommentaire(final String commentaire) {
    this.commentaire = commentaire;
  }

  public String getPrenom() {
    return this.prenom;
  }

  public void setPrenom(final String prenom) {
    this.prenom = prenom;
  }
}
