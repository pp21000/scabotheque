package fr.scabois.scabotheque.bean.adherent;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import fr.scabois.scabotheque.bean.HasId;
import fr.scabois.scabotheque.bean.commun.Activite;

@Entity
@Table(name = "adherent_activite")
public class AdherentActivite implements HasId {

    @ManyToOne
    @JoinColumn(name = "activite_id")
    private Activite activite;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "adherent_id")
    private Adherent adherent;
    private String commentaire;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private int pourcentage;

    public Activite getActivite() {
	return activite;
    }

    public Adherent getAdherent() {
	return adherent;
    }

    public String getCommentaire() {
	return commentaire;
    }

    @Override
    public Integer getId() {
	return id;
    }

    public int getPourcentage() {
	return pourcentage;
    }

    public void setActivite(Activite activite) {
	this.activite = activite;
    }

    public void setAdherent(Adherent adherent) {
	this.adherent = adherent;
    }

    public void setCommentaire(String commentaire) {
	this.commentaire = commentaire;
    }

    @Override
    public void setId(Integer id) {
	this.id = id;
    }

    public void setPourcentage(int pourcentage) {
	this.pourcentage = pourcentage;
    }

}