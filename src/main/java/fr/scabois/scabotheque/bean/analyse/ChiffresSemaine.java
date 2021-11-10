/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.scabois.scabotheque.bean.analyse;

import java.util.Date;
import java.util.List;

/**
 *
 * @author dslowensky
 */
public class ChiffresSemaine {

  private List<ChiffresActivite> chiffresActivite;
  private Date dateDebut;
  private Date dateFin;
  private int numSemaine;

  private double totalNbCommande;
  private double totalAnnee;
  private double totalAnneeN1;
  private double totalAnneeN2;
  private double totalMois;
  private double totalMoisN1;
  private double totalMoisN2;
  private double totalSemaine;
  private double totalSemaineN1;
  private double totalSemaineN2;

  public List<ChiffresActivite> getChiffresActivite() {
    return chiffresActivite;
  }

  public void setChiffresActivite(List<ChiffresActivite> chiffresActivite) {
    this.chiffresActivite = chiffresActivite;
  }

  public Date getDateDebut() {
    return dateDebut;
  }

  public void setDateDebut(Date dateDebut) {
    this.dateDebut = dateDebut;
  }

  public Date getDateFin() {
    return dateFin;
  }

  public void setDateFin(Date dateFin) {
    this.dateFin = dateFin;
  }

  public int getNumSemaine() {
    return numSemaine;
  }

  public void setNumSemaine(int numSemaine) {
    this.numSemaine = numSemaine;
  }

  public double getTotalAnnee() {
    return totalAnnee;
  }

  public void setTotalAnnee(double totalAnnee) {
    this.totalAnnee = totalAnnee;
  }

  public double getTotalAnneeN1() {
    return totalAnneeN1;
  }

  public void setTotalAnneeN1(double totalAnneeN1) {
    this.totalAnneeN1 = totalAnneeN1;
  }

  public double getTotalAnneeN2() {
    return totalAnneeN2;
  }

  public void setTotalAnneeN2(double totalAnneeN2) {
    this.totalAnneeN2 = totalAnneeN2;
  }

  public double getTotalMois() {
    return totalMois;
  }

  public void setTotalMois(double totalMois) {
    this.totalMois = totalMois;
  }

  public double getTotalMoisN1() {
    return totalMoisN1;
  }

  public void setTotalMoisN1(double totalMoisN1) {
    this.totalMoisN1 = totalMoisN1;
  }

  public double getTotalMoisN2() {
    return totalMoisN2;
  }

  public void setTotalMoisN2(double totalMoisN2) {
    this.totalMoisN2 = totalMoisN2;
  }

  public double getTotalNbCommande() {
    return totalNbCommande;
  }

  public void setTotalNbCommande(double totalNbCommande) {
    this.totalNbCommande = totalNbCommande;
  }

  public double getTotalSemaine() {
    return totalSemaine;
  }

  public void setTotalSemaine(double totalSemaine) {
    this.totalSemaine = totalSemaine;
  }

  public double getTotalSemaineN1() {
    return totalSemaineN1;
  }

  public void setTotalSemaineN1(double totalSemaineN1) {
    this.totalSemaineN1 = totalSemaineN1;
  }

  public double getTotalSemaineN2() {
    return totalSemaineN2;
  }

  public void setTotalSemaineN2(double totalSemaineN2) {
    this.totalSemaineN2 = totalSemaineN2;
  }
}
