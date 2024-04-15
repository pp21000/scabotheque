package fr.scabois.scabotheque.controller.artisansArtipole.edit;

import fr.scabois.scabotheque.bean.artisansArtipole.Photo;

public class EditAARealisation {

  private Integer id;
//  @NotEmpty(message = "{modification.notempty}")
  private Integer position;
//  @NotNull(message = "{modification.notempty}")
  private String legende;
//  @NotEmpty(message = "{modification.notempty}")
  private int adherentId;
//  @NotEmpty(message = "{modification.notempty}")
  private Photo photo;

  public Integer getId() {
    return this.id;
  }

  public void setId(final Integer id) {
    this.id = id;
  }

  public Integer getPosition() {
    return this.position;
  }

  public void setPosition(final Integer position) {
    this.position = position;
  }

  public String getLegende() {
    return this.legende;
  }

  public void setLegende(final String legende) {
    this.legende = legende;
  }

  public Photo getPhoto() {
    return this.photo;
  }

  public void setPhoto(Photo photo) {
    this.photo = photo;
  }

//  public Adherent getAdherent() {
//    return this.adherent;
//  }
  public int getAdherentId() {
    return this.adherentId;
  }

  public void setAdherentId(int adherentId) {
    this.adherentId = adherentId;
  }

}
