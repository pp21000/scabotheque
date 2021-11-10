package fr.scabois.scabotheque.bean.adherent;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "adherent_historique")
public class AdherentHistorique {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    private Adherent adherent;

    private float montant;
    
    @Column(name = "nb_commande")
    private int nbCommande;
    
    private int annee;
    
    private int mois;

    public Integer getId() {
	return id;
    }

    public void setId(final Integer pId) {
	id = pId;
    }

    public Adherent getAdherent() {
	return adherent;
    }

    public void setAdherent(final Adherent adherent) {
	this.adherent = adherent;
    }
    
    public float getMontant() {
	return montant;
    }

    public void setMontant(final float montant) {
	this.montant = montant;
    }

    public int getNbCommande() {
	return nbCommande;
    }

    public void setNbCommande(final int nbCommande) {
	this.nbCommande = nbCommande;
    }

        public int getAnnee() {
	return annee;
    }

    public void setAnnee(final int annee) {
	this.annee = annee;
    }

    public int getMois() {
	return mois;
    }

    public void setMois(final int mois) {
	this.mois = mois;
    }

}