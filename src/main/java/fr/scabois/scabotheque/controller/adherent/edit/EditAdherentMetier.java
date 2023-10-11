package fr.scabois.scabotheque.controller.adherent.edit;

import javax.persistence.Transient;

public class EditAdherentMetier {

  private int metierId;
  private int adherentId;
  private Integer id;
  @Transient
  boolean check;

  public EditAdherentMetier() {
    this.check = false;
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

  public int getMetierId() {
    return this.metierId;
  }

  public void setMetierId(final int metierId) {
    this.metierId = metierId;
  }

  public boolean isCheck() {
    return this.check;
  }

  public void setCheck(final boolean check) {
    this.check = check;
  }
}
