package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import fr.scabois.scabotheque.bean.artisanArtipole.Emplacement;
import java.io.IOException;
import javax.validation.Valid;
import org.apache.tomcat.util.codec.binary.Base64;

public class EditAAEmplacementForm {

  @Valid
  private EditAAEmplacement editAAEmplacement;

  public EditAAEmplacementForm() {
  }

  public EditAAEmplacementForm(final Emplacement emplacement) {
    (this.editAAEmplacement = new EditAAEmplacement()).setId(emplacement.getId());
    this.editAAEmplacement.setLibelle(emplacement.getLibelle());
    this.editAAEmplacement.setContent(emplacement.getContent());
    this.editAAEmplacement.setType(emplacement.getType());
    this.editAAEmplacement.setData(emplacement.getDataImg());
    this.editAAEmplacement.setAlt(emplacement.getAlt());
    this.editAAEmplacement.setPage(emplacement.getPage());
  }

  public Emplacement getEmplacement() {
    final Emplacement retour = new Emplacement();
    String fileName = (this.editAAEmplacement.getData() == null) ? "" : this.editAAEmplacement.getData();
    retour.setId(this.editAAEmplacement.getId());
    retour.setLibelle(this.editAAEmplacement.getLibelle());
    retour.setContent(this.editAAEmplacement.getContent());
    retour.setType(this.editAAEmplacement.getType());
    retour.setAlt(this.editAAEmplacement.getAlt());
    retour.setPage(this.editAAEmplacement.getPage());
    try {
      if (this.editAAEmplacement.getFile().getSize() != 0 && this.editAAEmplacement.getFile() != null && this.editAAEmplacement.getFile().getOriginalFilename() != "") {
        final String extension = this.editAAEmplacement.getFile().getOriginalFilename().substring(this.editAAEmplacement.getFile().getOriginalFilename().length() - 3);
        fileName = "data:image/" + extension + ";base64," + Base64.encodeBase64String(this.editAAEmplacement.getFile().getBytes());
        retour.setData(fileName.getBytes());
      }
    } catch (IOException ex) {
    }
    return retour;
  }

  public EditAAEmplacement getEditAAEmplacement() {
    return this.editAAEmplacement;
  }

  public void setEditAAEmplacement(final EditAAEmplacement editAAEmplacement) {
    this.editAAEmplacement = editAAEmplacement;
  }
}
