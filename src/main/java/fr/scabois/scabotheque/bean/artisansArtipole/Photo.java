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
import javax.persistence.Table;

@Entity
@Table(name = "photos")
public class Photo implements HasIdLibelle, Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private String libelle;
  private byte[] data;
  private String alt;
  private String type;

  public String getAlt() {
    return this.alt;
  }

  public void setAlt(final String alt) {
    this.alt = alt;
  }

  public byte[] getData() {
    return this.data;
  }

  public void setData(final byte[] data) {
    this.data = data;
  }

  public String getDataImg() {
    return (this.data == null) ? "" : new String(this.data);
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

  public String getType() {
    return this.type;
  }

  public void setType(String type) {
    this.type = type;
  }
}
