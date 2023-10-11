package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import fr.scabois.scabotheque.bean.artisanArtipole.Metier;
import javax.validation.Valid;

public class AddMetierForm {

  @Valid
  private EditMetier addMetier;

  public AddMetierForm() {
    this.addMetier = new EditMetier();
  }

  public AddMetierForm(final Metier metier) {
    this.addMetier = new EditMetier();
    (this.addMetier = new EditMetier()).setId(metier.getId());
    this.addMetier.setLibelle(metier.getLibelle());
  }

  public Metier getMetier() {
    final Metier retour = new Metier();
    retour.setId(this.addMetier.getId());
    retour.setLibelle(this.addMetier.getLibelle());
    retour.setDescription(this.addMetier.getDescription());
    return retour;
  }

  public EditMetier getAddMetier() {
    return this.addMetier;
  }

  public void setAddMetier(final EditMetier addMetier) {
    this.addMetier = addMetier;
  }
}
