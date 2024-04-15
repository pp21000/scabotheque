package fr.scabois.scabotheque.controller.logistique.edit;

import fr.scabois.scabotheque.bean.logistique.LogistiqueConducteur;

/**
 *
 * @author dslowensky
 */
public class EditConducteur {

    private Integer id;
    private String nom;
    private String prenom;
    private Integer position;

    public EditConducteur() {
    }

    public EditConducteur(LogistiqueConducteur c) {
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

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

}
