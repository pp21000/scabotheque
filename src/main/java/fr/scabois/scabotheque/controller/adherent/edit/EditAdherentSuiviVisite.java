package fr.scabois.scabotheque.controller.adherent.edit;

import java.util.Date;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class EditAdherentSuiviVisite {

  private Integer id;
  private int adherentId;
  @NotEmpty(message = "{modification.mailNotEmpty}")
  private String commentaire;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date dateCommentaire;

  public EditAdherentSuiviVisite() {
  }

  public EditAdherentSuiviVisite(int adhId) {
    adherentId = adhId;
    dateCommentaire = new Date();
  }

  public int getAdherentId() {
    return adherentId;
  }

  public Integer getId() {
    return id;
  }

  public String getCommentaire() {
    return commentaire;
  }

  public Date getDateCommentaire() {
    return dateCommentaire;
  }

  public void setAdherentId(int adherentId) {
    this.adherentId = adherentId;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public void setCommentaire(String commentaire) {
    this.commentaire = commentaire;
  }

  public void setDateCommentaire(Date dateCommentaire) {
    this.dateCommentaire = dateCommentaire;
  }
}
