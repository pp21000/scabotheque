package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

public class EditAAActualite {

  private Integer id;
  private String titre;
  private String contenu;
  private String type;
  private String sous_type;
  private Integer position;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date date_ajout;
  private String detail_contenu;
  private String lien_url;
  private Adherent adherent;

  public String getContenu() {
    return this.contenu;
  }

  public void setContenu(final String contenu) {
    this.contenu = contenu;
  }

  public Date getDate_ajout() {
    return this.date_ajout;
  }

  public void setDate_ajout(final Date date_ajout) {
    this.date_ajout = date_ajout;
  }

  public String getDetail_contenu() {
    return this.detail_contenu;
  }

  public void setDetail_contenu(String detail_contenu) {
    this.detail_contenu = detail_contenu;
  }

  public Integer getId() {
    return this.id;
  }

  public void setId(final Integer id) {
    this.id = id;
  }

  public String getLien_url() {
    return this.lien_url;
  }

  public void setLien_url(String lien_url) {
    this.lien_url = lien_url;
  }

  public Integer getPosition() {
    return this.position;
  }

  public void setPosition(final Integer position) {
    this.position = position;
  }

  public String getSous_type() {
    return this.sous_type;
  }

  public void setSous_type(final String sous_type) {
    this.sous_type = sous_type;
  }

  public String getTitre() {
    return this.titre;
  }

  public void setTitre(final String titre) {
    this.titre = titre;
  }

  public String getType() {
    return this.type;
  }

  public void setType(final String type) {
    this.type = type;
  }

  public Adherent getAdherent() {
    return adherent;
  }

  public void setAdherent(Adherent adherent) {
    this.adherent = adherent;
  }
}
