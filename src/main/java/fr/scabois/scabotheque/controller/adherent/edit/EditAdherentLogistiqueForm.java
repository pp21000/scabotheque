package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.adherent.AdherentLogistique;
import javax.validation.Valid;

public class EditAdherentLogistiqueForm {

  @Valid
  private EditAdherentLogistique editLogistiqueAdh;
  private String commentaire;

  public EditAdherentLogistiqueForm() {
  }

  public EditAdherentLogistiqueForm(final AdherentLogistique logistiqueAdh) {
    (this.editLogistiqueAdh = new EditAdherentLogistique()).setId(logistiqueAdh.getId());
    this.editLogistiqueAdh.setAdherentId(logistiqueAdh.getAdherentId());
    this.editLogistiqueAdh.setCommune(logistiqueAdh.getCommune());
    this.editLogistiqueAdh.setAdresseLivraison(logistiqueAdh.getAdresseLivraison());
    this.editLogistiqueAdh.setAdresseComplement(logistiqueAdh.getAdresseComplement());
    this.editLogistiqueAdh.setContactReceptionId((logistiqueAdh.getContactReceptionId() == null) ? null : logistiqueAdh.getContactReceptionId());
    this.editLogistiqueAdh.setIsAccesSemi(logistiqueAdh.getIsAccesSemi());
    this.editLogistiqueAdh.setIsAuthorise(logistiqueAdh.getIsAuthorise());
    this.editLogistiqueAdh.setIsMaterielDechargement(logistiqueAdh.getIsMaterielDechargement());
    this.editLogistiqueAdh.setOutillageCommentaire(logistiqueAdh.getOutillageCommentaire());
    this.editLogistiqueAdh.setProtocolDechargement(logistiqueAdh.getProtocolDechargement());
  }

  public EditAdherentLogistique getEditLogistiqueAdh() {
    return this.editLogistiqueAdh;
  }

  public void setEditLogistiqueAdh(final EditAdherentLogistique editLogistiqueAdh) {
    this.editLogistiqueAdh = editLogistiqueAdh;
  }

  public String getCommentaire() {
    return this.commentaire;
  }

  public void setCommentaire(final String commentaire) {
    this.commentaire = commentaire;
  }

  public AdherentLogistique getLogistiqueAdh() {
    final AdherentLogistique retour = new AdherentLogistique();
    retour.setId(this.editLogistiqueAdh.getId());
    retour.setAdherentId(Integer.valueOf(this.editLogistiqueAdh.getAdherentId()));
    retour.setCommune(this.editLogistiqueAdh.getCommune());
    retour.setAdresseLivraison(this.editLogistiqueAdh.getAdresseLivraison());
    retour.setAdresseComplement(this.editLogistiqueAdh.getAdresseComplement());
    retour.setContactReceptionId((this.editLogistiqueAdh.getContactReceptionId() == null) ? null : this.editLogistiqueAdh.getContactReceptionId());
    retour.setAccesSemi(this.editLogistiqueAdh.getIsAccesSemi());
    retour.setAuthorise(this.editLogistiqueAdh.getIsAuthorise());
    retour.setMaterielDechargement(this.editLogistiqueAdh.getIsMaterielDechargement());
    retour.setOutillageCommentaire(this.editLogistiqueAdh.getOutillageCommentaire());
    retour.setProtocolDechargement(this.editLogistiqueAdh.getProtocolDechargement());
    return retour;
  }
}
