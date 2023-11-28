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
@Table(name = "aa_specialites_adherents")
public class AdherentSpecialite implements HasId {

  @Column(name = "specialite_id")
  private Integer specialiteId;
  @Column(name = "adherent_id")
  private int adherentId;
  @Column(name = "niveau")
  private int niveau;
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
}
