package fr.scabois.scabotheque.bean.adherent;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import fr.scabois.scabotheque.bean.HasId;
import fr.scabois.scabotheque.enums.PageType;

@Entity
@Table(name = "adherent_commentaire")
public class AdherentCommentaire implements HasId {

    @Column(name = "adherent_id")
    private int adherentId;

    private byte[] commentaire;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Enumerated(EnumType.ORDINAL)
    private PageType type;

    public int getAdherentId() {
	return adherentId;
    }

    public byte[] getCommentaire() {
	return commentaire;
    }

    public String getCommentaireString() {
	return commentaire == null ? null : new String(commentaire);
    }

    @Override
    public Integer getId() {
	return id;
    }

    public PageType getType() {
	return type;
    }

    public void setAdherentId(int adherentId) {
	this.adherentId = adherentId;
    }

    public void setCommentaire(byte[] commentaire) {
	this.commentaire = commentaire;
    }

    public void setCommentaireString(String commentaire) {
	this.commentaire = commentaire == null ? null : commentaire.getBytes();
    }

    @Override
    public void setId(Integer id) {
	this.id = id;
    }

    public void setType(PageType type) {
	this.type = type;
    }

}