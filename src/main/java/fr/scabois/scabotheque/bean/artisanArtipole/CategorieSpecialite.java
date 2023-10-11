/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.bean.artisanArtipole;

import fr.scabois.scabotheque.bean.HasId;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author paul.petit
 */
@Entity
@Table(name = "aa_categories_specialites")
public class CategorieSpecialite implements HasId, Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private int categorie_id;
  @ManyToOne
  private Specialite specialite;

  @Override
  public Integer getId() {
    return this.id;
  }

  /**
   *
   * @param id
   */
  @Override
  public void setId(final Integer id) {
    this.id = id;
  }

  public int getId_categorie() {
    return this.categorie_id;
  }

  public void setId_categorie(final int id_categorie) {
    this.categorie_id = id_categorie;
  }

  public Specialite getSpecialite() {
    return this.specialite;
  }

  public void setSpecialite(final Specialite specialite) {
    this.specialite = specialite;
  }
}
