package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.adherent.AdherentEtat;
import fr.scabois.scabotheque.bean.adherent.AdherentType;
import fr.scabois.scabotheque.bean.adherent.CompteType;
import fr.scabois.scabotheque.bean.adherent.FormeJuridique;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Role;
import fr.scabois.scabotheque.bean.adherent.Secteur;
import fr.scabois.scabotheque.bean.adherent.Tournee;
import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.Ape;
import fr.scabois.scabotheque.bean.commun.Commune;
import java.util.Date;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class EditAdherent {

  @NotEmpty(message = "{modification.notempty}")
  private String adresse;
  private String adresseComplement;
  private Agence agence;
  private Ape ape;
  @Length(max = 6, message = "{modification.valueTooLong}")
  @NotEmpty(message = "{modification.notempty}")
  private String code;
  @Length(max = 6, message = "{modification.valueTooLong}")
  @NotEmpty(message = "{modification.notempty}")
  private String codeERP;
  @Length(max = 6, message = "{modification.valueTooLong}")
  private String codeERPParent;
  private Commune commune;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date dateCreation;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date dateEntree;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date dateClotureExe;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date dateSortie;
  @NotEmpty(message = "{modification.notempty}")
  private String denomination;
  private AdherentEtat etat;
  private FormeJuridique formeJuridique;
  private Integer id;
  private Integer nbSalaries;
  private boolean isArtipole;
  private boolean isCharteArtipole;
  private boolean isFacebookArtipole;
  private boolean isFlocageArtipole;
  private String formationDirigeant;
  private boolean isOutilDechargement;
  private boolean isWebArtipole;
  private String siteWeb;
  private String facebook;
  private String instagram;
  private String linkedin;
  private String youtube;
  private String pinterest;
  private boolean cnxEolasAllow;
  @NotEmpty(message = "{modification.notempty}")
  private String libelle;
  @Length(max = 15, message = "{modification.valueTooLong}")
  private String numRepMetier;
  private String photo;
  private String logo;
  private MultipartFile filePhoto;
  private MultipartFile fileLogo;
  private Pole pole;
  private Commune rcsCommune;
  private String rcsRm;
  private Commune rmCommune;
  private Role role;
  private Secteur secteur;
  @NotNull(message = "{modification.notempty}")
  @Length(max = 9, message = "{modification.valueTooLong}")
  @Pattern(regexp = "|[0-9]+", message = "{modification.number}")
  private String siren;
  @Length(max = 14, message = "{modification.valueTooLong}")
  @Pattern(regexp = "|[0-9]+", message = "{modification.number}")
  private String siret;
  private Tournee tournee;
  private AdherentType adherentType;
  private CompteType compteType;
  private double longitude;
  private double latitude;
  private String mail;
  private String telephone;
  private String description_activite;
  private String description_entreprise;

  public AdherentType getAdherentType() {
    return this.adherentType;
  }

  public void setAdherentType(final AdherentType adherentType) {
    this.adherentType = adherentType;
  }

  public CompteType getCompteType() {
    return this.compteType;
  }

  public void setCompteType(final CompteType compteType) {
    this.compteType = compteType;
  }

  public String getAdresse() {
    return this.adresse;
  }

  public String getAdresseComplement() {
    return this.adresseComplement;
  }

  public Agence getAgence() {
    return this.agence;
  }

  public Ape getApe() {
    return this.ape;
  }

  public String getCode() {
    return this.code;
  }

  public String getCodeERP() {
    return this.codeERP;
  }

  public String getCodeERPParent() {
    return this.codeERPParent;
  }

  public Commune getCommune() {
    return this.commune;
  }

  public Date getDateClotureExe() {
    return this.dateClotureExe;
  }

  public Date getDateCreation() {
    return this.dateCreation;
  }

  public Date getDateEntree() {
    return this.dateEntree;
  }

  public Date getDateSortie() {
    return this.dateSortie;
  }

  public String getDenomination() {
    return this.denomination;
  }

  public String getDescription_activite() {
    return this.description_activite;
  }

  public void setDescription_activite(final String description_activite) {
    this.description_activite = description_activite;
  }

  public String getDescription_entreprise() {
    return this.description_entreprise;
  }

  public void setDescription_entreprise(final String description_entreprise) {
    this.description_entreprise = description_entreprise;
  }

  public AdherentEtat getEtat() {
    return this.etat;
  }

  public String getFacebook() {
    return this.facebook;
  }

  public MultipartFile getFilePhoto() {
    return this.filePhoto;
  }

  public void setFilePhoto(final MultipartFile filePhoto) {
    this.filePhoto = filePhoto;
  }

  public MultipartFile getFileLogo() {
    return this.fileLogo;
  }

  public void setFileLogo(final MultipartFile fileLogo) {
    this.fileLogo = fileLogo;
  }

  public void setFacebook(final String facebook) {
    this.facebook = facebook;
  }

  public FormeJuridique getFormeJuridique() {
    return this.formeJuridique;
  }

  public Integer getId() {
    return this.id;
  }

  public double getLatitude() {
    return this.latitude;
  }

  public void setLatitude(final double latitude) {
    this.latitude = latitude;
  }

  public double getLongitude() {
    return this.longitude;
  }

  public void setLongitude(final double longitude) {
    this.longitude = longitude;
  }

  public String getMail() {
    return this.mail;
  }

  public void setMail(final String mail) {
    this.mail = mail;
  }

  public Integer getNbSalarie() {
    return this.nbSalaries;
  }

  public boolean getIsArtipole() {
    return this.isArtipole;
  }

  public boolean getIsCharteArtipole() {
    return this.isCharteArtipole;
  }

  public boolean getIsFacebookArtipole() {
    return this.isFacebookArtipole;
  }

  public boolean getIsFlocageArtipole() {
    return this.isFlocageArtipole;
  }

  public String getFormationDirigeant() {
    return this.formationDirigeant;
  }

  public boolean getCnxEolasAllow() {
    return this.cnxEolasAllow;
  }

  public boolean getIsOutilDechargement() {
    return this.isOutilDechargement;
  }

  public boolean getIsWebArtipole() {
    return this.isWebArtipole;
  }

  public String getLibelle() {
    return this.libelle;
  }

  public String getNumRepMetier() {
    return this.numRepMetier;
  }

  public String getPhoto() {
    return (this.photo == null) ? "" : this.photo;
  }

  public String getLogo() {
    return (this.logo == null) ? "" : this.logo;
  }

  public Pole getPole() {
    return this.pole;
  }

  public Commune getRcsCommune() {
    return this.rcsCommune;
  }

  public String getRcsRm() {
    return this.rcsRm;
  }

  public Commune getRmCommune() {
    return this.rmCommune;
  }

  public Role getRole() {
    return this.role;
  }

  public Secteur getSecteur() {
    return this.secteur;
  }

  public String getSiren() {
    return this.siren;
  }

  public String getSiret() {
    return this.siret;
  }

  public String getSiteWeb() {
    return this.siteWeb;
  }

  public void setSiteWeb(final String siteWeb) {
    this.siteWeb = siteWeb;
  }

  public String getTelephone() {
    return this.telephone;
  }

  public void setTelephone(final String telephone) {
    this.telephone = telephone;
  }

  public Tournee getTournee() {
    return this.tournee;
  }

  public void setAdresse(final String adresse) {
    this.adresse = adresse;
  }

  public void setAdresseComplement(final String adresseComplement) {
    this.adresseComplement = adresseComplement;
  }

  public void setAgence(final Agence agence) {
    this.agence = agence;
  }

  public void setApe(final Ape ape) {
    this.ape = ape;
  }

  public void setCode(final String code) {
    this.code = code;
  }

  public void setCodeERP(final String codeERP) {
    this.codeERP = codeERP;
  }

  public void setCodeERPParent(final String codeERPParent) {
    this.codeERPParent = codeERPParent;
  }

  public void setCommune(final Commune commune) {
    this.commune = commune;
  }

  public void setDateClotureExe(final Date dateClotureExe) {
    this.dateClotureExe = dateClotureExe;
  }

  public void setDateCreation(final Date dateCreation) {
    this.dateCreation = dateCreation;
  }

  public void setDateEntree(final Date dateEntree) {
    this.dateEntree = dateEntree;
  }

  public void setDateSortie(final Date dateSortie) {
    this.dateSortie = dateSortie;
  }

  public void setDenomination(final String denomination) {
    this.denomination = denomination;
  }

  public void setEtat(final AdherentEtat etat) {
    this.etat = etat;
  }

  public void setFormeJuridique(final FormeJuridique formeJuridique) {
    this.formeJuridique = formeJuridique;
  }

  public void setId(final Integer id) {
    this.id = id;
  }

  public void setNbSalaries(final Integer nbSalaries) {
    this.nbSalaries = nbSalaries;
  }

  public void setIsArtipole(final boolean isArtipole) {
    this.isArtipole = isArtipole;
  }

  public void setIsCharteArtipole(final boolean isCharteArtipole) {
    this.isCharteArtipole = isCharteArtipole;
  }

  public void setIsFacebookArtipole(final boolean isFacebookArtipole) {
    this.isFacebookArtipole = isFacebookArtipole;
  }

  public void setIsFlocageArtipole(final boolean isFlocageArtipole) {
    this.isFlocageArtipole = isFlocageArtipole;
  }

  public void setFormationDirigeant(final String formationDirigeant) {
    this.formationDirigeant = formationDirigeant;
  }

  public void setCnxEolasAllow(final boolean cnxEolasAllow) {
    this.cnxEolasAllow = cnxEolasAllow;
  }

  public void setIsOutilDechargement(final boolean outilDechargement) {
    this.isOutilDechargement = outilDechargement;
  }

  public void setIsWebArtipole(final boolean isWebArtipole) {
    this.isWebArtipole = isWebArtipole;
  }

  public void setLibelle(final String libelle) {
    this.libelle = libelle;
  }

  public void setNumRepMetier(final String numRepMetier) {
    this.numRepMetier = numRepMetier;
  }

  public void setPhoto(final String photo) {
    this.photo = photo;
  }

  public void setLogo(final String logo) {
    this.logo = logo;
  }

  public void setPole(final Pole pole) {
    this.pole = pole;
  }

  public void setRcsCommune(final Commune rcsCommune) {
    this.rcsCommune = rcsCommune;
  }

  public void setRcsRm(final String rcsRm) {
    this.rcsRm = rcsRm;
  }

  public void setRmCommune(final Commune rmCommune) {
    this.rmCommune = rmCommune;
  }

  public void setRole(final Role role) {
    this.role = role;
  }

  public void setSecteur(final Secteur secteur) {
    this.secteur = secteur;
  }

  public void setSiren(final String siren) {
    this.siren = siren;
  }

  public void setSiret(final String siret) {
    this.siret = siret;
  }

  public void setTournee(final Tournee tournee) {
    this.tournee = tournee;
  }

  public String getInstagram() {
    return this.instagram;
  }

  public void setInstagram(final String instagram) {
    this.instagram = instagram;
  }

  public String getLinkedin() {
    return this.linkedin;
  }

  public void setLinkedin(final String linkedin) {
    this.linkedin = linkedin;
  }

  public String getPinterest() {
    return this.pinterest;
  }

  public void setPinterest(final String pinterest) {
    this.pinterest = pinterest;
  }

  public String getYoutube() {
    return this.youtube;
  }

  public void setYoutube(final String youtube) {
    this.youtube = youtube;
  }
}
