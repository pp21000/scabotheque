package fr.scabois.scabotheque.controller.adherent.edit;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

public class EditAdherentActivite {

    private int activiteId;
    private String activiteLibelle;
    private int adherentId;
    private String commentaire;
    private Integer id;
//    @Pattern(regexp = "^$|(?:\\b|-)([0-9]{1,2}[0]?|100)\\b", message = "{modification.number.pourcentage}")
    @Min(0)
    @Max(100)
    private Integer pourcentage;

    public int getActiviteId() {
	return activiteId;
    }

    public String getActiviteLibelle() {
	return activiteLibelle;
    }

    public int getAdherentId() {
	return adherentId;
    }

    public String getCommentaire() {
	return commentaire;
    }

    public Integer getId() {
	return id;
    }

    public Integer getPourcentage() {
	return pourcentage;
    }

    public void setActiviteId(int activiteId) {
	this.activiteId = activiteId;
    }

    public void setActiviteLibelle(String libelle) {
	this.activiteLibelle = libelle;
    }

    public void setAdherentId(int adherentId) {
	this.adherentId = adherentId;
    }

    public void setCommentaire(String commentaire) {
	this.commentaire = commentaire;
    }

    public void setId(Integer id) {
	this.id = id;
    }

    public void setPourcentage(Integer pourcentage) {
	this.pourcentage = pourcentage;
    }
}