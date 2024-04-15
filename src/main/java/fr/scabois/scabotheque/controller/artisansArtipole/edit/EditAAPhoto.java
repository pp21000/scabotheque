package fr.scabois.scabotheque.controller.artisansArtipole.edit;

import javax.validation.constraints.NotNull;
import org.springframework.web.multipart.MultipartFile;

public class EditAAPhoto {

  private Integer id;
  @NotNull(message = "{modification.notempty}")
  private String libelle;
  private String data;
  private String alt;
  private String type;
  private MultipartFile file;

  public String getAlt() {
    return this.alt;
  }

  public void setAlt(final String alt) {
    this.alt = alt;
  }

  public String getData() {
    return this.data;
  }

  public void setData(final String data) {
    this.data = data;
  }

  public Integer getId() {
    return this.id;
  }

  public void setId(final Integer id) {
    this.id = id;
  }

  public String getLibelle() {
    return this.libelle;
  }

  public void setLibelle(final String libelle) {
    this.libelle = libelle;
  }

  public MultipartFile getFile() {
    return this.file;
  }

  public void setFile(final MultipartFile file) {
    this.file = file;
  }

  public String getType() {
    return this.type;
  }

  public void setType(String type) {
    this.type = type;
  }
}
