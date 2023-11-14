package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.adherent.AdherentMetier;
import fr.scabois.scabotheque.bean.artisanArtipole.Metier;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.validation.Valid;

public class EditAdherentMetiersForm {

  @Valid
  private List<EditAdherentMetier> metiersAdh;
  private String messageErreur;

  public EditAdherentMetiersForm() {
    this.metiersAdh = new ArrayList<EditAdherentMetier>();
  }

  public EditAdherentMetiersForm(final List<AdherentMetier> metiersAdherent, final List<Metier> metiers, final int adhId) {
    this.metiersAdh = new ArrayList<EditAdherentMetier>();
    metiers.stream().forEach(m -> {
      EditAdherentMetier editAM = new EditAdherentMetier();
      Optional<AdherentMetier> test = metiersAdherent.stream().filter(ma -> ma.getMetierId() == m.getId()).findFirst();
      editAM.setId(test.isPresent() ? test.get().getId() : null);
      editAM.setAdherentId(adhId);
      editAM.setMetierId((int) m.getId());
      editAM.setCheck(test.isPresent());
      this.metiersAdh.add(editAM);
    });
  }

  public List<AdherentMetier> getAdherentMetiers() {
    final List<AdherentMetier> list = new ArrayList<AdherentMetier>();
    this.metiersAdh.stream().forEach(ma -> {
      if (ma.isCheck()) {
        AdherentMetier editAM = new AdherentMetier();
        editAM.setId(ma.getId());
        editAM.setAdherentId(ma.getAdherentId());
        editAM.setMetierId(Integer.valueOf(ma.getMetierId()));
        list.add(editAM);
      }
    });
    return list;
  }

  public List<EditAdherentMetier> getMetiersAdh() {
    return this.metiersAdh;
  }

  public void setMetiersAdh(final List<EditAdherentMetier> activiteAdh) {
    this.metiersAdh = activiteAdh;
  }

  public String getMessageErreur() {
    return this.messageErreur;
  }

  public void setMessageErreur(final String messageErreur) {
    this.messageErreur = messageErreur;
  }
}
