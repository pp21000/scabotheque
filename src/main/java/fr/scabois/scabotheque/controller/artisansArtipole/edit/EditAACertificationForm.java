package fr.scabois.scabotheque.controller.artisansArtipole.edit;

import fr.scabois.scabotheque.bean.artisansArtipole.Certification;
import java.io.IOException;
import javax.validation.Valid;
import org.apache.tomcat.util.codec.binary.Base64;

public class EditAACertificationForm {

  @Valid
  private EditAACertification editAACertification;

  public EditAACertificationForm() {
  }

  public EditAACertificationForm(final Certification certification) {
    (this.editAACertification = new EditAACertification()).setId(certification.getId());
    this.editAACertification.setLibelle(certification.getLibelle());
    this.editAACertification.setData(certification.getDataImg());
    this.editAACertification.setAlt(certification.getAlt());
  }

  public Certification getCertification() {
    final Certification retour = new Certification();
    String fileName = (this.editAACertification.getData() == null) ? "" : this.editAACertification.getData();
    retour.setId(this.editAACertification.getId());
    retour.setLibelle(this.editAACertification.getLibelle());
    retour.setAlt(this.editAACertification.getAlt());
    try {
      if (this.editAACertification.getFile() != null && this.editAACertification.getFile().getOriginalFilename() != "") {
        final String extension = this.editAACertification.getFile().getOriginalFilename().substring(this.editAACertification.getFile().getOriginalFilename().length() - 3);
        fileName = "data:image/" + extension + ";base64," + Base64.encodeBase64String(this.editAACertification.getFile().getBytes());
      }
    } catch (IOException ex) {
    }
    retour.setData(fileName.getBytes());
    return retour;
  }

  public EditAACertification getEditAACertification() {
    return this.editAACertification;
  }

  public void setEditAACertification(final EditAACertification editAACertification) {
    this.editAACertification = editAACertification;
  }
}
