/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.bean.adherent;

import fr.scabois.scabotheque.bean.HasId;
import fr.scabois.scabotheque.bean.commun.Commune;
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

/**
 *
 * @author paul.petit
 */
@Entity
@Table(name = "contact_club_femme")
public class ContactClubFemme implements HasId {

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "adherent_id")
  private Adherent adherent;
  private String civilite;
  @Column(name = "date_naissance")
  private Date dateNaissance;
  private String fixe;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private String adresse;
  @Column(name = "adresse_complement")
  private String adresseComplement;
  @ManyToOne
  private Commune commune;
  private String mail;
  private String mobile;
  private String nom;
  private byte[] photo;
  private String prenom;

  public Adherent getAdherent() {
    return this.adherent;
  }

  public void setAdherent(final Adherent adherent) {
    this.adherent = adherent;
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

  public int getAge() {
    final LocalDate contactDate = (this.dateNaissance == null) ? LocalDate.now() : this.dateNaissance.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    return Period.between(contactDate, LocalDate.now()).getYears();
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

  public Date getDateNaissance() {
    return this.dateNaissance;
  }

  public void setDateNaissance(final Date dateNaissance) {
    this.dateNaissance = dateNaissance;
  }

  public String getFixe() {
    return this.fixe;
  }

  public void setFixe(final String fixe) {
    this.fixe = fixe;
  }

  @Override
  public Integer getId() {
    return this.id;
  }

  @Override
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

  public byte[] getPhoto() {
    return this.photo;
  }

  public void setPhoto(final byte[] photo) {
    this.photo = photo;
  }

  public String getPhotoImg() {
    return (this.photo == null) ? "" : new String(this.photo);
  }

  public String getPrenom() {
    return this.prenom;
  }

  public void setPrenom(final String prenom) {
    this.prenom = prenom;
  }
}
