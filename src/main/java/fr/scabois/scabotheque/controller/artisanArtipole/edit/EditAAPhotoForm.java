package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import fr.scabois.scabotheque.bean.artisanArtipole.Photo;
import java.io.IOException;
import javax.validation.Valid;
import org.apache.tomcat.util.codec.binary.Base64;

public class EditAAPhotoForm {

  @Valid
  private EditAAPhoto editAAPhoto;

  public EditAAPhotoForm() {
  }

  public EditAAPhotoForm(final Photo photo) {
    (this.editAAPhoto = new EditAAPhoto()).setId(photo.getId());
    this.editAAPhoto.setLibelle(photo.getLibelle());
    this.editAAPhoto.setData(photo.getDataImg());
    this.editAAPhoto.setAlt(photo.getAlt());
  }

  public Photo getPhoto() {
    final Photo retour = new Photo();
    String fileName = (this.editAAPhoto.getData() == null) ? "" : this.editAAPhoto.getData();
    retour.setId(this.editAAPhoto.getId());
    retour.setLibelle(this.editAAPhoto.getLibelle());
    retour.setAlt(this.editAAPhoto.getAlt());
    try {
      if (this.editAAPhoto.getFile() != null && this.editAAPhoto.getFile().getOriginalFilename() != "") {
        final String extension = this.editAAPhoto.getFile().getOriginalFilename().substring(this.editAAPhoto.getFile().getOriginalFilename().length() - 3);
        fileName = "data:image/" + extension + ";base64," + Base64.encodeBase64String(this.editAAPhoto.getFile().getBytes());
      }
    } catch (IOException ex) {
    }
    retour.setData(fileName.getBytes());
    return retour;
  }

  public EditAAPhoto getEditAAPhoto() {
    return this.editAAPhoto;
  }

  public void setEditAAPhoto(final EditAAPhoto editAAPhoto) {
    this.editAAPhoto = editAAPhoto;
  }
}
