package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.commun.Commune;

public class EditAdherentLogistique {

  private Integer id;
  private Integer adherentId;
  private String adresseComplement;
  private String adresseLivraison;
  private Commune commune;
  private Integer contactReceptionId;
  private boolean isAccesSemi;
  private boolean isAuthorise;
  private boolean isMaterielDechargement;
  private String outillageCommentaire;
  private String protocolDechargement;

  public int getAdherentId() {
    return this.adherentId;
  }

  public void setAdherentId(final int adherentId) {
    this.adherentId = adherentId;
  }

  public String getAdresseComplement() {
    return this.adresseComplement;
  }

  public void setAdresseComplement(final String adresseComplement) {
    this.adresseComplement = adresseComplement;
  }

  public String getAdresseLivraison() {
    return this.adresseLivraison;
  }

  public void setAdresseLivraison(final String adresseLivraison) {
    this.adresseLivraison = adresseLivraison;
  }

  public Commune getCommune() {
    return this.commune;
  }

  public void setCommune(final Commune commune) {
    this.commune = commune;
  }

  public Integer getContactReceptionId() {
    return this.contactReceptionId;
  }

  public void setContactReceptionId(final Integer contactReception) {
    this.contactReceptionId = contactReception;
  }

  public Integer getId() {
    return this.id;
  }

  public void setId(final Integer id) {
    this.id = id;
  }

  public String getOutillageCommentaire() {
    return this.outillageCommentaire;
  }

  public void setOutillageCommentaire(final String outillageCommentaire) {
    this.outillageCommentaire = outillageCommentaire;
  }

  public boolean getIsAccesSemi() {
    return this.isAccesSemi;
  }

  public void setIsAccesSemi(final boolean isAccesSemi) {
    this.isAccesSemi = isAccesSemi;
  }

  public boolean getIsAuthorise() {
    return this.isAuthorise;
  }

  public void setIsAuthorise(final boolean isAuthorise) {
    this.isAuthorise = isAuthorise;
  }

  public boolean getIsMaterielDechargement() {
    return this.isMaterielDechargement;
  }

  public void setIsMaterielDechargement(final boolean isMaterielDechargement) {
    this.isMaterielDechargement = isMaterielDechargement;
  }

  public String getProtocolDechargement() {
    return this.protocolDechargement;
  }

  public void setProtocolDechargement(final String protocolDechargement) {
    this.protocolDechargement = protocolDechargement;
  }
}
