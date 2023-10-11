package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import fr.scabois.scabotheque.bean.artisanArtipole.Page;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class EditAAEmplacement {

  private Integer id;
  @NotNull(message = "{modification.notempty}")
  private String libelle;
  @NotNull(message = "{modification.notempty}")
  private String content;
  @NotEmpty(message = "{modification.notempty}")
  private String type;
  private String data;
  private MultipartFile file;
  private String alt;
  private Page Page;

  public String getAlt() {
    return this.alt;
  }

  public void setAlt(final String alt) {
    this.alt = alt;
  }

  public String getContent() {
    return this.content;
  }

  public void setContent(final String content) {
    this.content = content;
  }

  public String getData() {
    return this.data;
  }

  public void setData(final String data) {
    this.data = data;
  }

  public MultipartFile getFile() {
    return this.file;
  }

  public void setFile(final MultipartFile file) {
    this.file = file;
  }

  public Integer getId() {
    return this.id;
  }

  public void setId(final Integer id) {
    this.id = id;
  }

  public Page getPage() {
    return this.Page;
  }

  public void setPage(final Page Page) {
    this.Page = Page;
  }

  public String getLibelle() {
    return this.libelle;
  }

  public void setLibelle(final String libelle) {
    this.libelle = libelle;
  }

  public String getType() {
    return this.type;
  }

  public void setType(final String type) {
    this.type = type;
  }
}
