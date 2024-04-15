package fr.scabois.scabotheque.controller.artisansArtipole.edit;

import fr.scabois.scabotheque.bean.artisansArtipole.Metier;
import java.util.List;
import java.util.stream.Collectors;
import javax.validation.Valid;

public class EditMetiersForm {

  @Valid
  private List<EditMetier> editMetiers;

  public EditMetiersForm() {
  }

  public EditMetiersForm(final List<Metier> metiers) {
    this.editMetiers = metiers.stream().map(m -> {
      final EditMetier edit;
      edit = new EditMetier();
      edit.setId(m.getId());
      edit.setLibelle(m.getLibelle());
      edit.setDescription(m.getDescription());
      return edit;
    }).collect(Collectors.toList());
  }

  public List<EditMetier> getEditMetiers() {
    return this.editMetiers;
  }

  public void setEditMetiers(final List<EditMetier> pMetiers) {
    this.editMetiers = pMetiers;
  }

  public List<Metier> getMetiers() {
    return this.editMetiers.stream().map(m -> {
      final Metier edit;
      edit = new Metier();
      edit.setId(m.getId());
      edit.setLibelle(m.getLibelle());
      edit.setDescription(m.getDescription());
      return edit;
    }).collect(Collectors.toList());
  }
}
