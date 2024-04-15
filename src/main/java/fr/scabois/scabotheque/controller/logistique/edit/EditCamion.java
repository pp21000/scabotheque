/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.scabois.scabotheque.controller.logistique.edit;

import fr.scabois.scabotheque.bean.logistique.LogistiqueCamion;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author dslowensky
 */
public class EditCamion {

    private Integer id;
    @NotEmpty
    private String nom;
    @NotEmpty
    private String immatriculation;
    private Integer chauffeurId;
    private Integer position;

    public EditCamion() {
    }

    public EditCamion(LogistiqueCamion c) {
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

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }
}
