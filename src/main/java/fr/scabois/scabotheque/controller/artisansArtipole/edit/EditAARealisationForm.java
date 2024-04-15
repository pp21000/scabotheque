package fr.scabois.scabotheque.controller.artisansArtipole.edit;

import fr.scabois.scabotheque.bean.artisansArtipole.Realisation;
import javax.validation.Valid;

public class EditAARealisationForm {

  @Valid
  private EditAARealisation editAARealisation;

  public EditAARealisationForm() {
  }

  public EditAARealisationForm(final Realisation realisation, final int adhId) {
    (this.editAARealisation = new EditAARealisation()).setId(realisation.getId());
    this.editAARealisation.setPosition(realisation.getPosition());
    this.editAARealisation.setLegende(realisation.getLegende());
    this.editAARealisation.setPhoto(realisation.getPhoto());
    this.editAARealisation.setAdherentId(realisation.getAdherent().getId());
//    Adherent adh = new Adherent();
//    this.editAARealisation.setAdherent(adh.setId(adhId));
  }

  public Realisation getRealisation() {
    final Realisation retour = new Realisation();
    retour.setId(this.editAARealisation.getId());
    retour.setLegende(this.editAARealisation.getLegende());
    retour.setPosition(this.editAARealisation.getPosition());
    retour.setPhoto(this.editAARealisation.getPhoto());
//    retour.setAdherent(this.editAARealisation.getAdherent());
    return retour;
  }

  public EditAARealisation getEditAARealisation() {
    return this.editAARealisation;
  }

  public void setEditAARealisation(final EditAARealisation editAARealisation) {
    this.editAARealisation = editAARealisation;
  }
}
