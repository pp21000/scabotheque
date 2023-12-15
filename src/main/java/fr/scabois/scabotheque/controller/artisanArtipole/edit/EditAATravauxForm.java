package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import fr.scabois.scabotheque.bean.artisanArtipole.Specialite;
import fr.scabois.scabotheque.bean.artisanArtipole.Travaux;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;

public class EditAATravauxForm {

  @Valid
  private EditAATravaux editAATravaux;
  private List<Specialite> specialites = new ArrayList<>();

  public EditAATravauxForm() {
    editAATravaux = new EditAATravaux();
  }

  public EditAATravauxForm(final Travaux travaux) {
    (this.editAATravaux = new EditAATravaux()).setId(travaux.getId());
    this.editAATravaux.setLibelle(travaux.getLibelle());
//    this.editAATravaux.setSpecialites(travaux.getSpecialites());
    this.specialites = travaux.getSpecialites();
    this.specialites = travaux.getSpecialites();
  }

  public List<Specialite> getSpecialites() {
    return this.specialites;
  }

  public void setSpecialites(List<Specialite> specialites) {
    this.specialites = specialites;
  }

  public Travaux getTravaux() {
    final Travaux retour = new Travaux();
    retour.setId(this.editAATravaux.getId());
    retour.setLibelle(this.editAATravaux.getLibelle());
    retour.setSpecialites(this.specialites);
    return retour;
  }

  public EditAATravaux getEditAATravaux() {
    return editAATravaux;
  }

  public void setEditAATravaux(EditAATravaux editAATravaux) {
    this.editAATravaux = editAATravaux;
  }

}
