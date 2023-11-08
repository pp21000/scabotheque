/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.bean.artisanArtipole;

import fr.scabois.scabotheque.bean.HasIdLibelle;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "photos_inspirations")
public class Inspiration implements HasIdLibelle, Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private String libelle;
  @ManyToOne
  private Metier metier;
  @ManyToOne
  private Photo photo;
  private Integer position;
  @ManyToOne
  private Page page;
  private String legende;

  @Override
  public Integer getId() {
    return this.id;
  }

  @Override
  public void setId(final Integer id) {
    this.id = id;
  }

  public String getLegende() {
    return this.legende;
  }

  public void setLegende(final String legende) {
    this.legende = legende;
  }

  @Override
  public String getLibelle() {
    return this.libelle;
  }

  @Override
  public void setLibelle(final String libelle) {
    this.libelle = libelle;
  }

  public Metier getMetier() {
    return this.metier;
  }

  public void setMetier(final Metier metier) {
    this.metier = metier;
  }

  public Page getPage() {
    return this.page;
  }

  public void setPage(final Page page) {
    this.page = page;
  }

  public Photo getPhoto() {
    return this.photo;
  }

  public void setPhoto(final Photo photo) {
    this.photo = photo;
  }

  public Integer getPosition() {
    return this.position;
  }

  public void setPosition(final Integer position) {
    this.position = position;
  }
}
