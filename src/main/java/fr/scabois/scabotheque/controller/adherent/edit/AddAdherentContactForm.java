package fr.scabois.scabotheque.controller.adherent.edit;

import javax.validation.Valid;

public class AddAdherentContactForm {

    @Valid
    private EditAdherentContact contact;

    public EditAdherentContact getContact() {
	return contact;
    }

    public void setContact(final EditAdherentContact contact) {
	this.contact = contact;
    } 
}