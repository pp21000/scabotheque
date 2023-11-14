package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import fr.scabois.scabotheque.bean.artisanArtipole.Travaux;
import javax.validation.Valid;

public class EditAATravauxForm {

  @Valid
  private EditAATravaux editAATravaux;

  public EditAATravauxForm() {
    editAATravaux = new EditAATravaux();
  }

  public EditAATravauxForm(final Travaux travaux) {
    (this.editAATravaux = new EditAATravaux()).setId(travaux.getId());
    this.editAATravaux.setLibelle(travaux.getLibelle());
    this.editAATravaux.setSpecialites(travaux.getSpecialites());
  }

  public Travaux getTravaux() {
    final Travaux retour = new Travaux();
    retour.setId(this.editAATravaux.getId());
    retour.setLibelle(this.editAATravaux.getLibelle());
    retour.setSpecialites(this.editAATravaux.getSpecialites());
    return retour;
  }

  public EditAATravaux getEditAATravaux() {
    return editAATravaux;
  }

  public void setEditAATravaux(EditAATravaux editAATravaux) {
    this.editAATravaux = editAATravaux;
  }

}
