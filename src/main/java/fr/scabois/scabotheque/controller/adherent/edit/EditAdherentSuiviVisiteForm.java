package fr.scabois.scabotheque.controller.adherent.edit;

import javax.validation.Valid;

public class EditAdherentSuiviVisiteForm {

  @Valid
  private EditAdherentSuiviVisite suiviVisiteAdh;

  public EditAdherentSuiviVisite getSuiviVisiteAdh() {
    return suiviVisiteAdh;
  }

  public void setSuiviVisiteAdh(final EditAdherentSuiviVisite activiteAdh) {
    this.suiviVisiteAdh = activiteAdh;
  }
}
