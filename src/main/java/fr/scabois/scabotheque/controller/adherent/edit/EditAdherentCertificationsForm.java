package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.adherent.AdherentCertification;
import fr.scabois.scabotheque.bean.artisansArtipole.Certification;
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
      EditAdherentCertification editAC = new EditAdherentCertification();
      Optional<AdherentCertification> test = certificationsAdherent.stream().filter(ca -> ca.getCertificationId() == c.getId()).findFirst();
      editAC.setId(test.isPresent() ? test.get().getId() : null);
      editAC.setAdherentId(adhId);
      editAC.setCertificationId((int) c.getId());
      editAC.setCheck(test.isPresent());
      editAC.setCheck(test.isPresent());
      this.certificationsAdh.add(editAC);
    });
  }

  public List<AdherentCertification> getAdherentCertifications() {
    final List<AdherentCertification> list = new ArrayList<AdherentCertification>();
    this.certificationsAdh.stream().forEach(ca -> {
      if (ca.isCheck()) {
        AdherentCertification editAC = new AdherentCertification();
        editAC.setId(ca.getId());
        editAC.setAdherentId(ca.getAdherentId());
        editAC.setCertificationId(Integer.valueOf(ca.getCertificationId()));
        list.add(editAC);
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
