/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import fr.scabois.scabotheque.bean.artisanArtipole.Specialite;
import java.util.List;
import javax.validation.constraints.NotNull;

class EditAATravaux {

  private Integer id;
  @NotNull(message = "{modification.notempty}")
  private String libelle;
  private List<Specialite> specialites;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getLibelle() {
    return libelle;
  }

  public void setLibelle(String libelle) {
    this.libelle = libelle;
  }

  public List<Specialite> getSpecialites() {
    return specialites;
  }

  public void setSpecialites(List<Specialite> specialites) {
    this.specialites = specialites;
  }
}
