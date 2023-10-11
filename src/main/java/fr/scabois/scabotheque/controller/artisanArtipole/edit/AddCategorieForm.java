package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import fr.scabois.scabotheque.bean.artisanArtipole.Categorie;
import javax.validation.Valid;

public class AddCategorieForm {

  @Valid
  private EditCategorie addCategorie;

  public AddCategorieForm() {
    this.addCategorie = new EditCategorie();
  }

  public AddCategorieForm(final Categorie categorie) {
    this.addCategorie = new EditCategorie();
    (this.addCategorie = new EditCategorie()).setId(categorie.getId());
    this.addCategorie.setLibelle(categorie.getLibelle());
  }

  public Categorie getCategorie() {
    final Categorie retour = new Categorie();
    retour.setId(this.addCategorie.getId());
    retour.setLibelle(this.addCategorie.getLibelle());
    return retour;
  }

  public EditCategorie getAddCategorie() {
    return this.addCategorie;
  }

  public void setAddCategorie(final EditCategorie addCategorie) {
    this.addCategorie = addCategorie;
  }
}
