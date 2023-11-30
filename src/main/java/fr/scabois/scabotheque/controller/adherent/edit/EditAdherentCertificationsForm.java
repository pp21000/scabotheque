package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.adherent.AdherentCertification;
import fr.scabois.scabotheque.bean.artisanArtipole.Certification;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.validation.Valid;

public class EditAdherentCertificationsForm {

  @Valid
  private List<EditAdherentCertification> certificationsAdh;
  private String messageErreur;

  public EditAdherentCertificationsForm() {
    this.certificationsAdh = new ArrayList<EditAdherentCertification>();
  }

  public EditAdherentCertificationsForm(final List<AdherentCertification> certificationsAdherent, final List<Certification> certifications, final int adhId) {
    this.certificationsAdh = new ArrayList<EditAdherentCertification>();
    certifications.stream().forEach(c -> {
      EditAdherentCertification editAM = new EditAdherentCertification();
      Optional<AdherentCertification> test = certificationsAdherent.stream().filter(ca -> ca.getCertificationId() == c.getId()).findFirst();
      editAM.setId(test.isPresent() ? test.get().getId() : null);
      editAM.setAdherentId(adhId);
      editAM.setCertificationId((int) c.getId());
      editAM.setCheck(test.isPresent());
      this.certificationsAdh.add(editAM);
    });
  }

  public List<AdherentCertification> getAdherentCertifications() {
    final List<AdherentCertification> list = new ArrayList<AdherentCertification>();
    this.certificationsAdh.stream().forEach(ca -> {
      if (ca.isCheck()) {
        AdherentCertification editAM = new AdherentCertification();
        editAM.setId(ca.getId());
        editAM.setAdherentId(ca.getAdherentId());
        editAM.setCertificationId(Integer.valueOf(ca.getCertificationId()));
        list.add(editAM);
      }
    });
    return list;
  }

  public List<EditAdherentCertification> getCertificationsAdh() {
    return this.certificationsAdh;
  }

  public void setCertificationsAdh(final List<EditAdherentCertification> activiteAdh) {
    this.certificationsAdh = activiteAdh;
  }

  public String getMessageErreur() {
    return this.messageErreur;
  }

  public void setMessageErreur(final String messageErreur) {
    this.messageErreur = messageErreur;
  }
}
