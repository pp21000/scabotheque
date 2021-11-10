package fr.scabois.scabotheque.bean.logistique;

import fr.scabois.scabotheque.bean.HasIdPositionLibelle;
import fr.scabois.scabotheque.controller.logistique.edit.EditConducteur;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "logistique_chauffeur")
public class LogistiqueConducteur implements HasIdPositionLibelle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "nom")
    private String nom;
    private Integer position;
    @Column(name = "prenom")
    private String prenom;

    public LogistiqueConducteur() {
    }

    public LogistiqueConducteur(EditConducteur c) {
        id = c.getId();
        nom = c.getNom();
        prenom = c.getPrenom();
        position = c.getPosition();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String getLibelle() {
        return nom + " " + prenom;
    }

    @Override
    public void setLibelle(String libelle) {
        // non implementé
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Override
    public Integer getPosition() {
        return position;
    }

    @Override
    public void setPosition(Integer position) {
        this.position = position;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

}
