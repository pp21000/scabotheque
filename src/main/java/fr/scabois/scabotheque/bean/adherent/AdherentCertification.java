/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.bean.adherent;

import fr.scabois.scabotheque.bean.HasId;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "certifications_adherents")
public class AdherentCertification implements HasId {

  @Column(name = "certification_id")
  private int certificationId;
  @Column(name = "adherents_id")
  private int adherentId;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  public int getAdherentId() {
    return this.adherentId;
  }

  public void setAdherentId(final int adherentId) {
    this.adherentId = adherentId;
  }

  @Override
  public Integer getId() {
    return this.id;
  }

  @Override
  public void setId(final Integer id) {
    this.id = id;
  }

  public Integer getCertificationId() {
    return this.certificationId;
  }

  public void setCertificationId(final Integer certificationId) {
    this.certificationId = certificationId;
  }
}
