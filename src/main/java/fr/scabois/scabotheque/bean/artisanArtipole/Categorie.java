/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.bean.artisanArtipole;

import fr.scabois.scabotheque.bean.HasIdLibelle;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author paul.petit
 */
@Entity
@Table(name = "aa_categorie")
public class Categorie implements HasIdLibelle {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private String libelle;
  @Transient
  List<Specialite> specialites;

  public Categorie() {
    this.specialites = new ArrayList<Specialite>();
  }

  /**
   *
   * @return
   */
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

  /**
   *
   * @param libelle
   */
  @Override
  public void setLibelle(final String libelle) {
    this.libelle = libelle;
  }

  public List<Specialite> getSpecialites() {
    return this.specialites;
  }

  public void setSpecialites(final List<Specialite> specialites) {
    this.specialites = specialites;
  }
}
