/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.scabois.scabotheque.bean.analyse;

import fr.scabois.scabotheque.bean.commun.Activite;

/**
 *
 * @author dslowensky
 */
public class ChiffresActivite {

    private Activite activite;

    private double cumulAnnee;
    private double cumulAnneeN1;
    private double cumulAnneeN2;
    private double cumulMois;
    private double cumulMoisN1;
    private double cumulMoisN2;
    private double cumulSemaine;
    private double cumulSemaineN1;
    private double cumulSemaineN2;
    private int nbCommandesSemaine;

    public Activite getActivite() {
        return activite;
    }

    public void setActivite(Activite activite) {
        this.activite = activite;
    }

    public double getCumulAnnee() {
        return cumulAnnee;
    }

    public void setCumulAnnee(double cumulAnnee) {
        this.cumulAnnee = cumulAnnee;
    }

    public double getCumulAnneeN1() {
        return cumulAnneeN1;
    }

    public void setCumulAnneeN1(double cumulAnneeN1) {
        this.cumulAnneeN1 = cumulAnneeN1;
    }

    public double getCumulAnneeN2() {
        return cumulAnneeN2;
    }

    public void setCumulAnneeN2(double cumulAnneeN2) {
        this.cumulAnneeN2 = cumulAnneeN2;
    }

    public double getCumulMois() {
        return cumulMois;
    }

    public void setCumulMois(double cumulMois) {
        this.cumulMois = cumulMois;
    }

    public double getCumulMoisN1() {
        return cumulMoisN1;
    }

    public void setCumulMoisN1(double cumulMoisN1) {
        this.cumulMoisN1 = cumulMoisN1;
    }

    public double getCumulMoisN2() {
        return cumulMoisN2;
    }

    public void setCumulMoisN2(double cumulMoisN2) {
        this.cumulMoisN2 = cumulMoisN2;
    }

    public double getCumulSemaine() {
        return cumulSemaine;
    }

    public void setCumulSemaine(double cumulSemaine) {
        this.cumulSemaine = cumulSemaine;
    }

    public double getCumulSemaineN1() {
        return cumulSemaineN1;
    }

    public void setCumulSemaineN1(double cumulSemaineN1) {
        this.cumulSemaineN1 = cumulSemaineN1;
    }

    public double getCumulSemaineN2() {
        return cumulSemaineN2;
    }

    public void setCumulSemaineN2(double cumulSemaineN2) {
        this.cumulSemaineN2 = cumulSemaineN2;
    }

//    public int getNbCommandeAnneeN1() {
//        return nbCommandeAnneeN1;
//    }
//
//    public void setNbCommandeAnneeN1(int nbCommandeAnneeN1) {
//        this.nbCommandeAnneeN1 = nbCommandeAnneeN1;
//    }
//    public int getNbCommandeMois() {
//        return nbCommandeMois;
//    }
//
//    public void setNbCommandeMois(int nbCommandeMois) {
//        this.nbCommandeMois = nbCommandeMois;
//    }
//
//    public int getNbCommandeMoisN1() {
//        return nbCommandeMoisN1;
//    }
//
//    public void setNbCommandeMoisN1(int nbCommandeMoisN1) {
//        this.nbCommandeMoisN1 = nbCommandeMoisN1;
//    }
    public int getNbCommandesSemaine() {
        return nbCommandesSemaine;
    }

    public void setNbCommandesSemaine(int nbCommandesSemaine) {
        this.nbCommandesSemaine = nbCommandesSemaine;
    }

}
