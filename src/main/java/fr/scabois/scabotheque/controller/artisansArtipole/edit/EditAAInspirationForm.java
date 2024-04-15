package fr.scabois.scabotheque.controller.artisansArtipole.edit;

import fr.scabois.scabotheque.bean.artisansArtipole.Inspiration;
import javax.validation.Valid;

public class EditAAInspirationForm {

  @Valid
  private EditAAInspiration editAAInspiration;

  public EditAAInspirationForm() {
  }

  public EditAAInspirationForm(final Inspiration inspiration) {
    (this.editAAInspiration = new EditAAInspiration()).setId(inspiration.getId());
    this.editAAInspiration.setLibelle(inspiration.getLibelle());
    this.editAAInspiration.setMetierId(inspiration.getMetier().getId());
    this.editAAInspiration.setPhotoId(inspiration.getPhoto().getId());
    this.editAAInspiration.setPageId(inspiration.getPage().getId());
    this.editAAInspiration.setPosition(inspiration.getPosition());
  }

  public Inspiration getInspiration() {
    final Inspiration retour = new Inspiration();
    retour.setId(this.editAAInspiration.getId());
    retour.setLibelle(this.editAAInspiration.getLibelle());
    retour.setPosition(this.editAAInspiration.getPosition());
    return retour;
  }

  public EditAAInspiration getEditAAInspiration() {
    return null;
  }

  public void setEditAAInspiration(final EditAAInspiration editAAInspiration) {
  }
}
