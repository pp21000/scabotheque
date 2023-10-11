package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import fr.scabois.scabotheque.bean.artisanArtipole.Categorie;
import java.util.List;
import java.util.stream.Collectors;
import javax.validation.Valid;

public class EditCategoriesForm {

  @Valid
  private List<EditCategorie> editCategories;

  public EditCategoriesForm() {
  }

  public EditCategoriesForm(final List<Categorie> categories) {
    this.editCategories = categories.stream().map(m -> {
      final EditCategorie edit;
      edit = new EditCategorie();
      edit.setId(m.getId());
      edit.setLibelle(m.getLibelle());
      return edit;
    }).collect(Collectors.toList());
  }

  public List<EditCategorie> getEditCategories() {
    return this.editCategories;
  }

  public void setEditCategories(final List<EditCategorie> pCategories) {
    this.editCategories = pCategories;
  }

  public List<Categorie> getCategories() {

    return this.editCategories.stream().map(m -> {
      final Categorie edit;
      edit = new Categorie();
      edit.setId(m.getId());
      edit.setLibelle(m.getLibelle());
      return edit;
    }).collect(Collectors.toList());
  }
}
