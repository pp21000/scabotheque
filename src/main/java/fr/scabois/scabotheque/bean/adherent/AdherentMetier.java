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

/**
 *
 * @author paul.petit
 */
@Entity
@Table(name = "metiers_adherents")
public class AdherentMetier implements HasId {

  @Column(name = "metiers_id")
  private int metierId;
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

  public Integer getMetierId() {
    return this.metierId;
  }

  public void setMetierId(final Integer metierId) {
    this.metierId = metierId;
  }
}
