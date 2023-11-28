package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.adherent.AdherentSpecialite;
import fr.scabois.scabotheque.bean.artisanArtipole.Specialite;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;

public class EditAdherentSpecialitesForm {

  @Valid
  private List<EditAdherentSpecialite> specialitesAdh;
  private String messageErreur;

  public EditAdherentSpecialitesForm() {
    this.specialitesAdh = new ArrayList<EditAdherentSpecialite>();
  }

  public EditAdherentSpecialitesForm(final List<AdherentSpecialite> specialitesAdherent, final List<Specialite> specialites, final int adhId) {
    this.specialitesAdh = new ArrayList<EditAdherentSpecialite>();
    for (int i = 0; i < 15; i++) {
      EditAdherentSpecialite editAS = new EditAdherentSpecialite();
      editAS.setAdherentId(adhId);
      if (i < specialitesAdherent.size()) {
        AdherentSpecialite adherentSpecialite = specialitesAdherent.get(i);
        editAS.setId(adherentSpecialite.getId());
        editAS.setSpecialiteId(adherentSpecialite.getSpecialiteId());
        editAS.setNiveau(adherentSpecialite.getNiveau());
        editAS.setTravauxId(specialites.stream().filter(s -> s.getId() == adherentSpecialite.getSpecialiteId()).findFirst().get().getTravaux().getId());
      } else {
        editAS.setId(null);
        editAS.setSpecialiteId(null);
        editAS.setNiveau(null);
        editAS.setTravauxId(null);
      }
      this.specialitesAdh.add(editAS);
    }
  }

  public List<AdherentSpecialite> getAdherentSpecialites() {
    final List<AdherentSpecialite> list = new ArrayList<AdherentSpecialite>();
    int niveau = 1;
    for (int i = 0; i < 15; i++) {
      EditAdherentSpecialite sa = this.specialitesAdh.get(i);
      if (sa.getSpecialiteId() != null) {
        AdherentSpecialite editAS = new AdherentSpecialite();
        editAS.setId(sa.getId());
        editAS.setAdherentId(sa.getAdherentId());
        editAS.setSpecialiteId(Integer.valueOf(sa.getSpecialiteId()));
        editAS.setNiveau(niveau);
        niveau++;
        list.add(editAS);
      }
    };
    return list;
  }

  public List<EditAdherentSpecialite> getSpecialitesAdh() {
    return this.specialitesAdh;
  }

  public void setSpecialitesAdh(final List<EditAdherentSpecialite> activiteAdh) {
    this.specialitesAdh = activiteAdh;
  }

  public String getMessageErreur() {
    return this.messageErreur;
  }

  public void setMessageErreur(final String messageErreur) {
    this.messageErreur = messageErreur;
  }
}
