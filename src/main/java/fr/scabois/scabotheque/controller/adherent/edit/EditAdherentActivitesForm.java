package fr.scabois.scabotheque.controller.adherent.edit;

import java.util.List;
import javax.validation.Valid;

public class EditAdherentActivitesForm {

    @Valid
    private List<EditAdherentActivite> activitesAdh;
    private String commentaire;
    private String messageErreur;

    public List<EditAdherentActivite> getActivitesAdh() {
        return activitesAdh;
    }

    public void setActivitesAdh(final List<EditAdherentActivite> activiteAdh) {
        this.activitesAdh = activiteAdh;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }

    public String getMessageErreur() {
        return messageErreur;
    }

    public void setMessageErreur(String messageErreur) {
        this.messageErreur = messageErreur;
    }
}
