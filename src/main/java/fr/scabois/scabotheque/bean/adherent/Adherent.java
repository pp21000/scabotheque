package fr.scabois.scabotheque.bean.adherent;

import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.Ape;
import fr.scabois.scabotheque.bean.commun.Commune;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//@NamedNativeQuery(name = "Adherent.count", query = "select count(*) from Adherent", resultClass = Long.class)
@Entity
@Table(name = "adherent")
public class Adherent {

  private String adresse;
  @Column(name = "adresse_complement")
  private String adresseComplement;
  @ManyToOne
  private Agence agence;
  @ManyToOne
  private Ape ape;
  @Column(name = "code_adh")
  private String code;
  @Column(name = "code_erp")
  private String codeERP;
  @Column(name = "code_erp_parent")
  private String codeERPParent;
  @ManyToOne
  private Commune commune;
  private Double latitude;
  private Double longitude;
  @OneToMany(mappedBy = "adherent", cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
  private List<AdherentContactRole> contacts;
  @Column(name = "date_creation_entreprise")
  private Date dateCreation;
  @Column(name = "date_entree")
  private Date dateEntree;
  @Column(name = "cloture_exercice")
  private Date dateClotureExe;
  @Column(name = "date_sortie")
  private Date dateSortie;
  @Column(name = "denom_sociale")
  private String denomination;
  @Column(name = "nombre_salaries")
  private Integer nbSalaries;
  @ManyToOne
  private AdherentEtat etat;
  @ManyToOne
  private AdherentType adherentType;
  @ManyToOne
  private CompteType compteType;
  @ManyToOne
  @JoinColumn(name = "form_juridique_id")
  private FormeJuridique formeJuridique;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  @Column(name = "adhesion_artipole")
  private boolean isArtipole;
  @Column(name = "charte_artipole")
  private boolean isCharteArtipole;
  @Column(name = "facebook_artipole")
  private boolean isFacebookArtipole;
  @Column(name = "flocage_artipole")
  private boolean isFlocageArtipole;
  @Column(name = "formation_dirigeant")
  private String formationDirigeant;
  @Column(name = "outil_dechargement")
  private boolean isOutilDechargement;
  @Column(name = "site_web_artipole")
  private boolean isWebArtipole;
  @Column(name = "site_web")
  private String siteWeb;
  private String facebook;
  private String instagram;
  private String linkedin;
  private String youtube;
  private String pinterest;
  private String libelle;
  @Column(name = "num_rep_metier")
  private String numRepMetier;
  private byte[] photo;
  private byte[] logo;
  @ManyToOne
  private Pole pole;
  @ManyToOne
  @JoinColumn(name = "rcs_commune_id")
  private Commune rcsCommune;
  @Column(name = "rcs_rm")
  private String rcsRm;
  @ManyToOne
  @JoinColumn(name = "rm_commune_id")
  private Commune rmCommune;
  @ManyToOne
  private Role role;
  @ManyToOne
  private Secteur secteur;
  private String siren;
  private String siret;
  @ManyToOne
  private Tournee tournee;
  @Column(name = "cnx_eolas_authorise")
  private boolean cnxEolasAllow;
  private String telephone;
  private String mail;
  private String description_activite;
  private String description_entreprise;
//    @OneToOne(mappedBy = "adherent", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//    private AdherentContactComptable contactComptable;
//    @Column(name = "contact_comptable")
//    private String contactComptable;
//    @Column(name = "nb_parts")
//    private Integer nbParts;

  public Adherent() {
    this.codeERPParent = "";
    this.contacts = new ArrayList<AdherentContactRole>();
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

  public boolean getCnxEolasAllow() {
    return this.cnxEolasAllow;
  }

  public void setCnxEolasAllow(final boolean cnxEolasAllow) {
    this.cnxEolasAllow = cnxEolasAllow;
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

  public List<AdherentContactRole> getContacts() {
    return this.contacts;
  }

  public Date getDateCreation() {
    return this.dateCreation;
  }

  public Date getDateClotureExe() {
    return this.dateClotureExe;
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
    return (this.latitude == null) ? 0.0 : this.latitude;
  }

  public void setLatitude(final double latitude) {
    this.latitude = latitude;
  }

  public double getLongitude() {
    return (this.longitude == null) ? 0.0 : this.longitude;
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

  public Integer getNbSalaries() {
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

  public byte[] getPhoto() {
    return this.photo;
  }

  public String getPhotoImg() {
    return (this.photo == null) ? "" : new String(this.photo);
  }

  public byte[] getlogo() {
    return this.logo;
  }

  public String getLogoImg() {
    return (this.logo == null) ? "" : new String(this.logo);
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

  public CompteType getCompteType() {
    return this.compteType;
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

  public AdherentType getAdherentType() {
    return this.adherentType;
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

  public void setContacts(final List<AdherentContactRole> contacts) {
    this.contacts.clear();
    this.contacts.addAll(contacts);
  }

  public void setDateCreation(final Date dateCreation) {
    this.dateCreation = dateCreation;
  }

  public void setDateClotureExe(final Date dateClotureExe) {
    this.dateClotureExe = dateClotureExe;
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

  public void setIsWebArtipole(final boolean isWebArtipole) {
    this.isWebArtipole = isWebArtipole;
  }

  public void setLibelle(final String libelle) {
    this.libelle = libelle;
  }

  public void setNumRepMetier(final String numRepMetier) {
    this.numRepMetier = numRepMetier;
  }

  public void setIsOutilDechargement(final boolean isOutilDechargement) {
    this.isOutilDechargement = isOutilDechargement;
  }

  public void setPhoto(final byte[] photo) {
    this.photo = photo;
  }

  public void setLogo(final byte[] logo) {
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

  public void setCompteType(final CompteType compteType) {
    this.compteType = compteType;
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

  public void setAdherentType(final AdherentType adherentType) {
    this.adherentType = adherentType;
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

//  public AdherentContactComptable getContactComptable() {
//    return contactComptable;
//  }
//
//  public void setContactComptable(AdherentContactComptable contactComptable) {
//    this.contactComptable = contactComptable;
//  }
}
