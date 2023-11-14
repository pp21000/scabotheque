/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.bean.artisanArtipole;

import fr.scabois.scabotheque.bean.HasIdLibelle;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "aa_travaux")
public class Travaux implements HasIdLibelle, Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private String libelle;
  @OneToMany(mappedBy = "travaux", fetch = FetchType.EAGER)
  private List<Specialite> specialites;

  public Travaux() {
    this.specialites = new ArrayList<>();
  }

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

  public List<Specialite> getSpecialites() {
    return this.specialites;
  }

  public void setSpecialites(List<Specialite> specialites) {
    this.specialites = specialites;
  }

}
