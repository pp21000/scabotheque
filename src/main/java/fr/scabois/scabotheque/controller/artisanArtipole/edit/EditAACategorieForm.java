package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import fr.scabois.scabotheque.bean.artisanArtipole.Categorie;
import javax.validation.Valid;

public class EditAACategorieForm {

  @Valid
  private EditAACategorie editAACategorie;

  public EditAACategorieForm() {
  }

  public EditAACategorieForm(final Categorie categorie) {
    (this.editAACategorie = new EditAACategorie()).setId(categorie.getId());
    this.editAACategorie.setLibelle(categorie.getLibelle());
  }

  public Categorie getCategorie() {
    final Categorie retour = new Categorie();
    retour.setId(this.editAACategorie.getId());
    retour.setLibelle(this.editAACategorie.getLibelle());
    return retour;
  }

  public EditAACategorie getEditAACategorie() {
    return this.editAACategorie;
  }

  public void setEditAACategorie(final EditAACategorie editAACategorie) {
    this.editAACategorie = editAACategorie;
  }
}
