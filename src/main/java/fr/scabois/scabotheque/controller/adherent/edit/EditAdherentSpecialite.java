package fr.scabois.scabotheque.controller.adherent.edit;

import javax.persistence.Transient;

public class EditAdherentSpecialite {

  private Integer specialiteId;
  private int adherentId;
  private Integer id;
  @Transient
  Integer niveau;
  Integer travauxId;

  public EditAdherentSpecialite() {
  }

  public int getAdherentId() {
    return this.adherentId;
  }

  public Integer getId() {
    return this.id;
  }

  public void setAdherentId(final int adherentId) {
    this.adherentId = adherentId;
  }

  public void setId(final Integer id) {
    this.id = id;
  }

  public Integer getSpecialiteId() {
    return this.specialiteId;
  }

  public void setSpecialiteId(final Integer specialiteId) {
    this.specialiteId = specialiteId;
  }

  public Integer getNiveau() {
    return this.niveau;
  }

  public void setNiveau(final Integer niveau) {
    this.niveau = niveau;
  }

  public Integer getTravauxId() {
    return this.travauxId;
  }

  public void setTravauxId(final Integer travauxId) {
    this.travauxId = travauxId;
  }
}
