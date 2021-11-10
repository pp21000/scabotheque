package fr.scabois.scabotheque.bean.logistique;

import fr.scabois.scabotheque.bean.HasIdPositionLibelle;
import fr.scabois.scabotheque.controller.logistique.edit.EditCamion;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "logistique_camion")
public class LogistiqueCamion implements HasIdPositionLibelle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "nom")
    private String nom;
    @Column(name = "immatriculation")
    private String immatriculation;
    @Column(name = "chauffeur")
    private Integer chauffeurId;
    private Integer position;

    public LogistiqueCamion() {
    }

    public LogistiqueCamion(EditCamion c) {
        id = c.getId();
        nom = c.getNom();
        immatriculation = c.getImmatriculation();
        chauffeurId = c.getChauffeurId();
        position = c.getPosition();
    }

    public Integer getChauffeurId() {
        return chauffeurId;
    }

    public void setChauffeurId(Integer chauffeurId) {
        this.chauffeurId = chauffeurId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImmatriculation() {
        return immatriculation;
    }

    public void setImmatriculation(String immatriculation) {
        this.immatriculation = immatriculation;
    }

    public String getLibelle() {
        return nom + " " + immatriculation;
    }

    @Override
    public void setLibelle(String libelle) {
        // pas besoin de setter
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
}
