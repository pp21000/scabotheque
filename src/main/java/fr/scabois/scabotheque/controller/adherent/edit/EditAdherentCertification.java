package fr.scabois.scabotheque.controller.adherent.edit;

import javax.persistence.Transient;

public class EditAdherentCertification {

  private int certificationId;
  private int adherentId;
  private Integer id;
  @Transient
  boolean check;

  public EditAdherentCertification() {
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

  public int getCertificationId() {
    return this.certificationId;
  }

  public void setCertificationId(final int certificationId) {
    this.certificationId = certificationId;
  }

  public boolean isCheck() {
    return this.check;
  }

  public void setCheck(final boolean check) {
    this.check = check;
  }
}
