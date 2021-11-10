package fr.scabois.scabotheque.controller.logistique;

import fr.scabois.scabotheque.bean.logistique.LogistiqueTournee;
import fr.scabois.scabotheque.bean.logistique.LogistiqueTourneeCmd;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EditLogistiqueTournee {

  //@NotEmpty(message = "{modification.notempty}")
  private Integer id;
  private String agence;
  private String noAdh;
  private String nomAdresse;
  private String adresse1;
  private String adresse2;
  private String adresse3;
  private String codePostal;
  private String ville;
  private String ville2;
  private Date dateLivraison;
  private Date dateBonLiv;
  private String zone;
  private String telephone;
  private Integer ordre;
  private String commentaire;
  private int envoi;
  private String user;
  private List<LogistiqueTourneeCmd> cmd = new ArrayList<>();

  public EditLogistiqueTournee() {
  }

  public EditLogistiqueTournee(LogistiqueTournee tournee) {
    this.id = tournee.getId();
    this.agence = tournee.getAgence();
    this.noAdh = tournee.getNoAdh();
    this.nomAdresse = tournee.getNomAdresse();
    this.adresse1 = tournee.getAdresse1();
    this.adresse2 = tournee.getAdresse2();
    this.adresse3 = tournee.getAdresse3();
    this.codePostal = tournee.getCodePostal();
    this.ville = tournee.getVille();
    this.ville2 = tournee.getVille2();
    this.dateLivraison = tournee.getDateLivraison();
    this.dateBonLiv = tournee.getDateBonLiv();
    this.zone = tournee.getZone();
    this.telephone = tournee.getTelephone();
    this.ordre = tournee.getOrdre();
    this.commentaire = tournee.getCommentaire();
    this.envoi = tournee.getEnvoi();
    this.getCmd().addAll(tournee.getTourneeCommande());
    this.user = tournee.getUser();
//        tournee.getTourneeCommande().stream().forEach(c -> cmd.add(new LogistiqueTourneeCmd(c)));
  }

  public String getAdresse1() {
    return adresse1;
  }

  public void setAdresse1(String adresse1) {
    this.adresse1 = adresse1;
  }

  public String getAdresse2() {
    return adresse2;
  }

  public void setAdresse2(String adresse2) {
    this.adresse2 = adresse2;
  }

  public String getAdresse3() {
    return adresse3;
  }

  public void setAdresse3(String adresse3) {
    this.adresse3 = adresse3;
  }

  public String getAgence() {
    return agence;
  }

  public void setAgence(String agence) {
    this.agence = agence;
  }

  public List<LogistiqueTourneeCmd> getCmd() {
    return cmd;
  }

  public void setCmd(List<LogistiqueTourneeCmd> cmd) {
    this.cmd = cmd;
  }

  public String getCodePostal() {
    return codePostal;
  }

  public void setCodePostal(String codePostal) {
    this.codePostal = codePostal;
  }

  public String getCommentaire() {
    return commentaire;
  }

  public void setCommentaire(String commentaire) {
    this.commentaire = commentaire;
  }

  public Date getDateBonLiv() {
    return dateBonLiv;
  }

  public void setDateBonLiv(Date dateBonLiv) {
    this.dateBonLiv = dateBonLiv;
  }

  public Date getDateLivraison() {
    return dateLivraison;
  }

  public void setDateLivraison(Date dateLivraison) {
    this.dateLivraison = dateLivraison;
  }

  public int getEnvoi() {
    return envoi;
  }

  public void setEnvoi(int envoi) {
    this.envoi = envoi;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getNoAdh() {
    return noAdh;
  }

  public void setNoAdh(String noAdh) {
    this.noAdh = noAdh;
  }

  public String getNomAdresse() {
    return nomAdresse;
  }

  public void setNomAdresse(String nomAdresse) {
    this.nomAdresse = nomAdresse;
  }

  public Integer getOrdre() {
    return ordre;
  }

  public void setOrdre(Integer ordre) {
    this.ordre = ordre;
  }

  public String getTelephone() {
    return telephone;
  }

  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }

  public String getUser() {
    return user;
  }

  public void setUser(String user) {
    this.user = user;
  }

  public String getVille() {
    return ville;
  }

  public void setVille(String ville) {
    this.ville = ville;
  }

  public String getVille2() {
    return ville2;
  }

  public void setVille2(String ville2) {
    this.ville2 = ville2;
  }

  public String getZone() {
    return zone;
  }

  public void setZone(String zone) {
    this.zone = zone;
  }

}
