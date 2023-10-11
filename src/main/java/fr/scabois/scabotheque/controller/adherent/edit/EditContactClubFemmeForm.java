package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.adherent.ContactClubFemme;
import javax.validation.Valid;

public class EditContactClubFemmeForm {

  @Valid
  private EditContactClubFemme editContactClubFemme;

  public EditContactClubFemme getEditContactClubFemme() {
    return this.editContactClubFemme;
  }

  public void setEditContactClubFemme(final EditContactClubFemme pContact) {
    this.editContactClubFemme = pContact;
  }

  public ContactClubFemme getContactClubFemme(final EditContactClubFemme contact) {
    final ContactClubFemme contactRetour = new ContactClubFemme();
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
