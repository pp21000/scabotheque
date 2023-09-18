package fr.scabois.scabotheque.bean.adherent;

import fr.scabois.scabotheque.bean.commun.Commune;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "adherent_logistique")
public class AdherentLogistique {

  @Column(name = "adherent_id")
  private Integer adherentId;
  @Column(name = "livraison_complement")
  private String adresseComplement;
  @Column(name = "livraison_adresse")
  private String adresseLivraison;
  @ManyToOne(fetch = FetchType.EAGER)
  private Commune commune;
  @Column(name = "contact1_reception")
  private Integer contactReceptionId;
  @Column(name = "protocol_dechargement")
  private String protocolDechargement;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  @Column(name = "acces_semi")
  private boolean isAccesSemi;
  @Column(name = "authorisation_utilisation")
  private boolean isAuthorise;
  @Column(name = "materiel_dechargement")
  private boolean isMaterielDechargement;
  @Column(name = "commentaire_outillage")
  private String outillageCommentaire;

  public Integer getAdherentId() {
    return this.adherentId;
  }

  public String getAdresseComplement() {
    return this.adresseComplement;
  }

  public String getAdresseLivraison() {
    return this.adresseLivraison;
  }

  public Commune getCommune() {
    return this.commune;
  }

  public Integer getContactReceptionId() {
    return this.contactReceptionId;
  }

  public String getProtocolDechargement() {
    return this.protocolDechargement;
  }

  public Integer getId() {
    return this.id;
  }

  public boolean getIsAccesSemi() {
    return this.isAccesSemi;
  }

  public boolean getIsAuthorise() {
    return this.isAuthorise;
  }

  public boolean getIsMaterielDechargement() {
    return this.isMaterielDechargement;
  }

  public String getOutillageCommentaire() {
    return this.outillageCommentaire;
  }

  public void setAdresseComplement(String adresseComplement) {
    this.adresseComplement = adresseComplement;
  }

  public void setAdresseLivraison(String adresseLivraison) {
    this.adresseLivraison = adresseLivraison;
  }

  public void setAuthorise(boolean isAuthorise) {
    this.isAuthorise = isAuthorise;
  }

  public void setCommune(Commune commune) {
    this.commune = commune;
  }

  public void setContactReceptionId(Integer contactReceptionId) {
    this.contactReceptionId = contactReceptionId;
  }

  public void setProtocolDechargement(String protocolDechargement) {
    this.protocolDechargement = protocolDechargement;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public void setAccesSemi(boolean isAccesSemi) {
    this.isAccesSemi = isAccesSemi;
  }

  public void setAdherentId(Integer adherentId) {
    this.adherentId = adherentId;
  }

  public void setMaterielDechargement(boolean isMaterielDechargement) {
    this.isMaterielDechargement = isMaterielDechargement;
  }

  public void setOutillageCommentaire(String outillageCommentaire) {
    this.outillageCommentaire = outillageCommentaire;
  }
}
