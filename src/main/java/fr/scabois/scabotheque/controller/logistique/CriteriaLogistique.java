package fr.scabois.scabotheque.controller.logistique;

import java.io.Serializable;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

public class CriteriaLogistique implements Serializable {

  private String avertissement;

  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date dateLivraison;
  private String dateLivraisonString;
  private String codeAgence = "";
  private String zone = "";

  public String getCodeAgence() {
    return codeAgence;
  }

  public void setCodeAgence(String codeAgence) {
    this.codeAgence = codeAgence;
  }

  public String getAvertissement() {
    return avertissement;
  }

  public void setAvertissement(String avertissement) {
    this.avertissement = avertissement;
  }

  public String getDateLivraisonString() {
    return dateLivraisonString;
  }

  public void setDateLivraisonString(String dateLivraisonString) {
    this.dateLivraisonString = dateLivraisonString;
  }

  public String getZone() {
    return zone;
  }

  public void setZone(String zone) {
    this.zone = zone;
  }

  public Date getDateLivraison() {
    return dateLivraison;
  }

  public void setDateLivraison(Date dateLivraison) {
    this.dateLivraison = dateLivraison;
  }

}
