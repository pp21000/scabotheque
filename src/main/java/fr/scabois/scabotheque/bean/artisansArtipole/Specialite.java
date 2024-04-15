/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.bean.artisansArtipole;

import fr.scabois.scabotheque.bean.HasIdLibelle;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "aa_specialite")
public class Specialite implements HasIdLibelle, Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private String libelle;
  @ManyToOne
  private Travaux travaux;

  @Override
  public Integer getId() {
    return this.id;
  }

  @Override
  public void setId(final Integer id) {
    this.id = id;
  }

  @Override
  public String getLibelle() {
    return this.libelle;
  }

  @Override
  public void setLibelle(final String libelle) {
    this.libelle = libelle;
  }

  public Travaux getTravaux() {
    return this.travaux;
  }

  public void setTravaux(final Travaux travaux) {
    this.travaux = travaux;
  }
}
