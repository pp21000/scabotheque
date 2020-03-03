package fr.scabois.scabotheque.controller.adherent.edit;

import java.util.List;

import javax.validation.Valid;

public class EditAdherentActivitesForm {
    @Valid
    private List<EditAdherentActivite> activitesAdh;
    private String commentaire;

    public List<EditAdherentActivite> getActivitesAdh() {
	return activitesAdh;
    }

    public String getCommentaire() {
	return commentaire;
    }

    public void setActivitesAdh(final List<EditAdherentActivite> activiteAdh) {
	this.activitesAdh = activiteAdh;
    }

    public void setCommentaire(String commentaire) {
	this.commentaire = commentaire;
    }
}