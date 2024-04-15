package fr.scabois.scabotheque.controller.artisansArtipole.edit;

import fr.scabois.scabotheque.bean.artisansArtipole.Actualite;
import javax.validation.Valid;

public class EditAAActualiteForm {

  @Valid
  private EditAAActualite editAAActualite;
  private Integer idAdh;

  public EditAAActualiteForm() {
  }

  public EditAAActualiteForm(final Actualite actu, final Integer idAdh) {
    (this.editAAActualite = new EditAAActualite()).setId(actu.getId());
    this.editAAActualite.setTitre(actu.getTitre());
    this.editAAActualite.setContenu(actu.getContenu());
    this.editAAActualite.setType(actu.getType());
    this.editAAActualite.setSous_type(actu.getSous_type());
    this.editAAActualite.setPosition(actu.getPosition());
    this.editAAActualite.setDate_ajout(actu.getDate_ajout());
    this.editAAActualite.setDetail_contenu(actu.getDetail_contenu());
    this.editAAActualite.setLien_url(actu.getLien_url());
    this.editAAActualite.setAdherent(actu.getAdherent());
    this.editAAActualite.setAdherent(actu.getAdherent());
    this.idAdh = idAdh;
  }

  public Actualite getActualite() {
    final Actualite retour = new Actualite();
    retour.setId(this.editAAActualite.getId());
    retour.setTitre(this.editAAActualite.getTitre());
    retour.setContenu(this.editAAActualite.getContenu());
    retour.setType(this.editAAActualite.getType());
    retour.setSous_type(this.editAAActualite.getSous_type());
    retour.setPosition(this.editAAActualite.getPosition());
    retour.setDate_ajout(this.editAAActualite.getDate_ajout());
    retour.setDetail_contenu(this.editAAActualite.getDetail_contenu());
    retour.setLien_url(this.editAAActualite.getLien_url());
    retour.setAdherent(this.editAAActualite.getAdherent());
    return retour;
  }

  public Integer getIdAdh() {
    return this.idAdh;
  }

  public void setIdAdh(final Integer idAdh) {
    this.idAdh = idAdh;
  }

  public EditAAActualite getEditAAActualite() {
    return this.editAAActualite;
  }

  public void setEditAAActualite(final EditAAActualite editAAActualite) {
    this.editAAActualite = editAAActualite;
  }

}
