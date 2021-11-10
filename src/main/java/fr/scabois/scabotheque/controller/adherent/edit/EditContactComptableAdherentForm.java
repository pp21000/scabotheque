package fr.scabois.scabotheque.controller.adherent.edit;

import javax.validation.Valid;

public class EditContactComptableAdherentForm {

    @Valid
    private EditContactComptableAdherent contactComptableAdherent;

    public EditContactComptableAdherent getContactComptableAdherent() {
        return contactComptableAdherent;
    }

    public void setContactComptableAdherent(final EditContactComptableAdherent pAdherent) {
        contactComptableAdherent = pAdherent;
    }

}
