package fr.scabois.scabotheque.bean.logistique;

import fr.scabois.scabotheque.bean.HasId;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "logistique_tournee_commande_rubis")
public class LogistiqueTourneeCmd implements HasId {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  @Column(name = "key")
  private String key;
  @Column(name = "nocli")
  private String noAdh;
  @Column(name = "nobon")
  private String numeroBon;
  @Column(name = "enbon")
  private String refBon;
  @Column(name = "pdssb")
  private String poids;
  @Column(name = "dateLiv")
  private Date dateLivraison;
  @Column(name = "dateBl")
  private Date dateBonLiv;
  @Column(name = "bledi")
  private String bonLivrEdite;
  @Column(name = "nb_colis")
  private int nbColis;
  private String user;

  public LogistiqueTourneeCmd() {
  }

  public LogistiqueTourneeCmd(LogistiqueTourneeCmd t) {
    id = t.getId();
    this.numeroBon = t.getNumeroBon();
    this.refBon = t.getRefBon();
    this.poids = t.getPoids();
    dateLivraison = t.getDateLivraison();
    dateBonLiv = t.getDateBonLiv();
    bonLivrEdite = t.getBonLivrEdite();
    nbColis = t.getNbColis();
    user = t.getUser();
  }

  public String getBonLivrEdite() {
    return bonLivrEdite;
  }

  public void setBonLivrEdite(String bonLivrEdite) {
    this.bonLivrEdite = bonLivrEdite;
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

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getKey() {
    return key;
  }

  public void setKey(String key) {
    this.key = key;
  }

  public int getNbColis() {
    return nbColis;
  }

  public void setNbColis(int nbColis) {
    this.nbColis = nbColis;
  }

  public String getNoAdh() {
    return noAdh;
  }

  public void setNoAdh(String noAdh) {
    this.noAdh = noAdh;
  }

  public String getNumeroBon() {
    return numeroBon;
  }

  public void setNumeroBon(String numeroBon) {
    this.numeroBon = numeroBon;
  }

  public String getPoids() {
    return poids;
  }

  public void setPoids(String poids) {
    this.poids = poids;
  }

  public String getRefBon() {
    return refBon;
  }

  public void setRefBon(String refBon) {
    this.refBon = refBon;
  }

  public String getUser() {
    return user;
  }

  public void setUser(String user) {
    this.user = user;
  }

}
