package fr.scabois.scabotheque.controller.adherent.edit;

import javax.validation.Valid;

public class EditAdherentForm {

    @Valid
    private EditAdherent adherent;

    private String commentaire;

    public EditAdherent getAdherent() {
	return adherent;
    }

    public String getCommentaire() {
	return commentaire;
    }

    public void setAdherent(final EditAdherent pAdherent) {
	adherent = pAdherent;
    }

    public void setCommentaire(String commentaire) {
	this.commentaire = commentaire;
    }
}