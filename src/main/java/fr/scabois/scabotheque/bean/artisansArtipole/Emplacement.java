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
@Table(name = "aa_emplacements")
public class Emplacement implements HasIdLibelle, Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private String libelle;
  private String content;
  private String type;
  private byte[] data;
  private String alt;
  @ManyToOne
  private Page page;

  public String getAlt() {
    return this.alt;
  }

  public void setAlt(final String alt) {
    this.alt = alt;
  }

  public String getContent() {
    return this.content;
  }

  public void setContent(final String content) {
    this.content = content;
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

  public Page getPage() {
    return this.page;
  }

  public void setPage(final Page page) {
    this.page = page;
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

  public void setType(final String type) {
    this.type = type;
  }
}
