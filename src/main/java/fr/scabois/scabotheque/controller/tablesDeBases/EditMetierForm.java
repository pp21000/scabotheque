package fr.scabois.scabotheque.controller.tablesDeBases;


import fr.scabois.scabotheque.bean.artisansArtipole.Metier;
import fr.scabois.scabotheque.controller.artisansArtipole.edit.EditMetier;
import javax.validation.Valid;

public class EditMetierForm {

  @Valid
  private EditMetier editMetier;

  public EditMetierForm() {
  }

  public EditMetierForm(final Metier metier) {
    (this.editMetier = new EditMetier()).setId(metier.getId());
    this.editMetier.setLibelle(metier.getLibelle());
    this.editMetier.setDescription(metier.getDescription());
  }

  public Metier getMetier() {
    final Metier retour = new Metier();
    retour.setId(this.editMetier.getId());
    retour.setLibelle(this.editMetier.getLibelle());
    retour.setDescription(this.editMetier.getDescription());
    return retour;
  }

  public EditMetier getEditMetier() {
    return this.editMetier;
  }

  public void setEditMetier(final EditMetier editMetier) {
    this.editMetier = editMetier;
  }
}
