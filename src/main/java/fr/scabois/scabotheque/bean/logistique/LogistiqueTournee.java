package fr.scabois.scabotheque.bean.logistique;

import fr.scabois.scabotheque.bean.HasId;
import fr.scabois.scabotheque.controller.logistique.EditLogistiqueTournee;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "logistique_tournee_rubis")
public class LogistiqueTournee implements HasId, Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  @Column(name = "fkey")
  private String key;
  @Column(name = "agenc")
  private String agence;
  @Column(name = "nocli")
  private String noAdh;
  @Column(name = "nomlv")
  private String nomAdresse;
  @Column(name = "ad1lv")
  private String adresse1;
  @Column(name = "ad2lv")
  private String adresse2;
  @Column(name = "ruelv")
  private String adresse3;
  @Column(name = "cpolv")
  private String codePostal;
  @Column(name = "burlv")
  private String ville;
  @Column(name = "villv")
  private String ville2;
  @Column(name = "dateLiv")
  private Date dateLivraison;
  @Column(name = "dateBl")
  private Date dateBonLiv;
  @Column(name = "det94")
  private String zone;
  @Column(name = "telephone")
  private String telephone;
  private Integer ordre;
  @Column(name = "commentaire")
  private String commentaire;
  @Column(name = "envoi")
  private int envoi;
  @Column(name = "camion_Id")
  private Integer camionId;
  @Column(name = "chauffeur_Id")
  private Integer chauffeurId;
  private Integer tournee;
  private String user;

//    @OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
//    @JoinColumns({
//        @JoinColumn(name = "nocli", referencedColumnName = "nocli"),
//        @JoinColumn(name = "dateLiv", referencedColumnName = "dateLiv")
//    })
  @Transient
//    @OneToMany(mappedBy = "key", fetch = FetchType.EAGER)
  private List<LogistiqueTourneeCmd> tourneeCommande = new ArrayList<>();

  public LogistiqueTournee() {
  }

  public LogistiqueTournee(EditLogistiqueTournee t, Integer camionId, Integer chauffeurId, Integer tournee) {

    id = t.getId();
    agence = t.getAgence();
    noAdh = t.getNoAdh();
    nomAdresse = t.getNomAdresse();
    adresse1 = t.getAdresse1();
    adresse2 = t.getAdresse2();
    adresse3 = t.getAdresse3();
    codePostal = t.getCodePostal();
    ville = t.getVille();
    ville2 = t.getVille2();
    dateLivraison = t.getDateLivraison();
    dateBonLiv = t.getDateBonLiv();
    zone = t.getZone();
    telephone = t.getTelephone();
    ordre = t.getOrdre();
    commentaire = t.getCommentaire();
    envoi = t.getEnvoi();
    tourneeCommande.addAll(t.getCmd());
    this.camionId = camionId;
    this.chauffeurId = chauffeurId;
    this.tournee = tournee;
    this.user = t.getUser();
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

  public Integer getCamionId() {
    return camionId;
  }

  public void setCamionId(Integer camionId) {
    this.camionId = camionId;
  }

  public Integer getChauffeurId() {
    return chauffeurId;
  }

  public void setChauffeurId(Integer chauffeurId) {
    this.chauffeurId = chauffeurId;
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

  @Override
  public Integer getId() {
    return id;
  }

  @Override
  public void setId(Integer id) {
    this.id = id;
  }

  public String getKey() {
    return key;
  }

  public void setKey(String key) {
    this.key = key;
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

  public Integer getTournee() {
    return tournee;
  }

  public void setTournee(Integer tournee) {
    this.tournee = tournee;
  }

  public List<LogistiqueTourneeCmd> getTourneeCommande() {
    return tourneeCommande;
  }

  public void setTourneeCommande(List<LogistiqueTourneeCmd> tourneeCommande) {
    this.tourneeCommande = tourneeCommande;
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
