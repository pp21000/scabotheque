package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.adherent.ContactRetraite;
import javax.validation.Valid;

public class EditContactRetraiteForm {

  @Valid
  private EditContactRetraite editContactRetraite;

  public EditContactRetraite getEditContactRetraite() {
    return this.editContactRetraite;
  }

  public void setEditContactRetraite(final EditContactRetraite pContact) {
    this.editContactRetraite = pContact;
  }

  public ContactRetraite getContactRetraite(final EditContactRetraite contact) {
    final ContactRetraite contactRetour = new ContactRetraite();
    contactRetour.setCivilite(contact.getCivilite());
    contactRetour.setNom(contact.getNom());
    contactRetour.setPrenom(contact.getPrenom());
    contactRetour.setMail(contact.getMail());
    contactRetour.setFixe(contact.getFixe());
    contactRetour.setMobile(contact.getMobile());
    contactRetour.setAdresse(contact.getAdresse());
    contactRetour.setAdresseComplement(contact.getAdresseComplement());
    contactRetour.setCommune(contact.getCommune());
    return contactRetour;
  }
}
