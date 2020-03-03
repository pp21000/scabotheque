package fr.scabois.scabotheque.controller.adherent.edit;

import java.util.List;

import javax.validation.Valid;

public class EditAdherentContactsForm {

    @Valid
    private List<EditAdherentContact> adherentContacts;

    private String commentaire;

    public List<EditAdherentContact> getAdherentContacts() {
	return adherentContacts;
    }

    public String getCommentaire() {
	return commentaire;
    }

    public void setAdherentContacts(final List<EditAdherentContact> pContacts) {
	adherentContacts = pContacts;
    }

    public void setCommentaire(String commentaire) {
	this.commentaire = commentaire;
    }
}