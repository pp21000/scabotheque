/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.bean.artisansArtipole;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "realisations_photos")
public class Realisation implements Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private Integer position;
  private String legende;
  @ManyToOne
  @JoinColumn(name = "adherents_id")
  private Adherent adherent;
  @ManyToOne
  @JoinColumn(name = "photos_id")
  private Photo photo;

  public Integer getId() {
    return this.id;
  }

  public void setId(final Integer id) {
    this.id = id;
  }

  public Integer getPosition() {
    return this.position;
  }

  public void setPosition(final Integer position) {
    this.position = position;
  }

  public String getLegende() {
    return this.legende;
  }

  public void setLegende(final String legende) {
    this.legende = legende;
  }

  public Adherent getAdherent() {
    return this.adherent;
  }

  public void setAdherent(final Adherent adherent) {
    this.adherent = adherent;
  }

  public Photo getPhoto() {
    return this.photo;
  }

  public void setPhoto(final Photo photo) {
    this.photo = photo;
  }

}
