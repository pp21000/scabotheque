package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import fr.scabois.scabotheque.bean.artisanArtipole.Actualite;
import javax.validation.Valid;

public class EditAAActualiteForm {

  @Valid
  private EditAAActualite editAAActualite;

  public EditAAActualiteForm() {
  }

  public EditAAActualiteForm(final Actualite actu) {
    (this.editAAActualite = new EditAAActualite()).setId(actu.getId());
    this.editAAActualite.setTitre(actu.getTitre());
    this.editAAActualite.setContenu(actu.getContenu());
    this.editAAActualite.setType(actu.getType());
    this.editAAActualite.setSous_type(actu.getSous_type());
    this.editAAActualite.setPosition(actu.getPosition());
    this.editAAActualite.setDate_ajout(actu.getDate_ajout());
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
    return retour;
  }

  public EditAAActualite getEditAAActualite() {
    return this.editAAActualite;
  }

  public void setEditAAActualite(final EditAAActualite editAAActualite) {
    this.editAAActualite = editAAActualite;
  }
}
