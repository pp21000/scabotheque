package fr.scabois.scabotheque.bean.adherent;

import fr.scabois.scabotheque.bean.HasId;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "adherent_suivi_visite")
public class AdherentSuiviVisite implements HasId {

  @Column(name = "adherent_id")
  private Integer adherentId;
  private byte[] commentaire;
  @Column(name = "date_commentaire")
  private Date dateCommentaire;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  public Integer getAdherentId() {
    return adherentId;
  }

  public void setAdherentId(Integer adherentId) {
    this.adherentId = adherentId;
  }

  public byte[] getCommentaire() {
    return commentaire;
  }

  public void setCommentaire(byte[] commentaire) {
    this.commentaire = commentaire;
  }

  public String getCommentaireString() {
    return commentaire == null ? null : new String(commentaire);
  }

  public void setCommentaireString(String commentaire) {
    this.commentaire = commentaire == null ? null : commentaire.getBytes();
  }

  public Date getDateCommentaire() {
    return dateCommentaire;
  }

  public void setDateCommentaire(Date dateCommentaire) {
    this.dateCommentaire = dateCommentaire;
  }

  @Override
  public Integer getId() {
    return id;
  }

  @Override
  public void setId(Integer id) {
    this.id = id;
  }
}
